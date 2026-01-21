package com.migration;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.io.IOException;

public class Migrator {
    private static final Logger logger = LogManager.getLogger(Migrator.class);
    private static final Map<String, Integer> totalRows = new HashMap<>();

    private Connection mssqlConn;
    private Connection mysqlConn;

    public void connect() throws SQLException {
        logger.info("Attempting to connect to databases");
        mssqlConn = Config.getMSSQLConnection();
        mysqlConn = Config.getMySQLConnection();
        logger.info("Connected to both databases");
    }

    public void disconnect() throws SQLException {
        logger.info("Attempting to disconnect from databases");
        if (mssqlConn != null) mssqlConn.close();
        if (mysqlConn != null) mysqlConn.close();
        logger.info("Disconnected from databases");
    }

    public List<String> getTables() throws SQLException {
        logger.info("Retrieving list of tables to migrate");
        List<String> tables = Config.getMigrationTables();
        logger.info("Tables to migrate: {}", tables);
        return tables;
    }

    public void migrateTableFull(String tableName) throws SQLException {
        logger.info("Starting full migration for table {}", tableName);

        // Get column info
        logger.debug("Retrieving column information for table {}", tableName);
        Statement stmt = mssqlConn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" + tableName + "' ORDER BY ORDINAL_POSITION");
        List<String> columns = new ArrayList<>();
        List<String> types = new ArrayList<>();
        while (rs.next()) {
            columns.add(rs.getString("COLUMN_NAME"));
            types.add(rs.getString("DATA_TYPE"));
        }
        rs.close();
        stmt.close();
        logger.debug("Found {} columns for table {}", columns.size(), tableName);

        // Create table in MySQL if not exists
        logger.debug("Creating table {} in MySQL if not exists", tableName);
        StringBuilder createStmt = new StringBuilder("CREATE TABLE IF NOT EXISTS " + tableName + " (");
        for (int i = 0; i < columns.size(); i++) {
            String mysqlType = mapDataType(types.get(i));
            createStmt.append(columns.get(i)).append(" ").append(mysqlType);
            if (i < columns.size() - 1) createStmt.append(", ");
        }
        createStmt.append(")");
        Statement mysqlStmt = mysqlConn.createStatement();
        mysqlStmt.execute(createStmt.toString());
        mysqlStmt.close();
        logger.debug("Table {} created or already exists in MySQL", tableName);

        // Migrate data
        logger.debug("Migrating data for table {}", tableName);
        mysqlConn.setAutoCommit(false); // Enable transaction control
        stmt = mssqlConn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM " + tableName);
        StringBuilder insertStmt = new StringBuilder("INSERT INTO " + tableName + " (");
        for (int i = 0; i < columns.size(); i++) {
            insertStmt.append(columns.get(i));
            if (i < columns.size() - 1) insertStmt.append(", ");
        }
        insertStmt.append(") VALUES (");
        for (int i = 0; i < columns.size(); i++) {
            insertStmt.append("?");
            if (i < columns.size() - 1) insertStmt.append(", ");
        }
        insertStmt.append(")");

        PreparedStatement ps = mysqlConn.prepareStatement(insertStmt.toString());
        int rowCount = 0;
        int batchSize = Config.getBatchSize();
        try {
            while (rs.next()) {
                for (int i = 0; i < columns.size(); i++) {
                    ps.setObject(i + 1, rs.getObject(i + 1));
                }
                ps.addBatch();
                rowCount++;

                if (rowCount % batchSize == 0) {
                    ps.executeBatch();
                    mysqlConn.commit();
                    logger.debug("Committed batch of {} records for table {}", batchSize, tableName);
                }
            }
            // Commit remaining records
            ps.executeBatch();
            mysqlConn.commit();
            logger.debug("Committed final batch of {} records for table {}", rowCount % batchSize, tableName);
        } catch (SQLException e) {
            logger.error("Error during batch insert for table {}, rolling back transaction", tableName, e);
            mysqlConn.rollback();
            throw e;
        } finally {
            ps.close();
            rs.close();
            stmt.close();
            mysqlConn.setAutoCommit(true); // Restore auto-commit
        }
        logger.debug("Migrated {} rows for table {}", rowCount, tableName);

        // Update total rows count
        Statement countStmt = mysqlConn.createStatement();
        ResultSet countRs = countStmt.executeQuery("SELECT COUNT(*) FROM " + tableName);
        if (countRs.next()) {
            totalRows.put(tableName, countRs.getInt(1));
        }
        countRs.close();
        countStmt.close();

        logger.info("Full migration completed for table {}", tableName);
    }

    private String mapDataType(String mssqlType) {
        logger.debug("Mapping MSSQL data type {} to MySQL", mssqlType);
        String mysqlType;
        switch (mssqlType.toLowerCase()) {
            case "int": mysqlType = "INT"; break;
            case "varchar": mysqlType = "VARCHAR(255)"; break;
            case "nvarchar": mysqlType = "VARCHAR(255)"; break;
            case "datetime": mysqlType = "DATETIME"; break;
            case "bit": mysqlType = "TINYINT(1)"; break;
            default: mysqlType = "VARCHAR(255)"; break;
        }
        logger.debug("Mapped {} to {}", mssqlType, mysqlType);
        return mysqlType;
    }

    public void syncTableDelta(String tableName, Timestamp lastSync) throws SQLException {
        logger.info("Starting delta sync for table {} since {}", tableName, lastSync);

        // Use 'updatets' column for change detection
        logger.debug("Querying changes for table {} since {}", tableName, lastSync);
        PreparedStatement stmt = mssqlConn.prepareStatement("SELECT * FROM " + tableName + " WHERE updatets > ?");
        stmt.setTimestamp(1, lastSync);
        ResultSet rs = stmt.executeQuery();

        // Get columns
        List<String> columns = getColumnNames(tableName);
        logger.debug("Columns for table {}: {}", tableName, columns);

        StringBuilder insertStmt = new StringBuilder("INSERT INTO " + tableName + " (");
        for (int i = 0; i < columns.size(); i++) {
            insertStmt.append(columns.get(i));
            if (i < columns.size() - 1) insertStmt.append(", ");
        }
        insertStmt.append(") VALUES (");
        for (int i = 0; i < columns.size(); i++) {
            insertStmt.append("?");
            if (i < columns.size() - 1) insertStmt.append(", ");
        }
        insertStmt.append(") ON DUPLICATE KEY UPDATE ");
        for (int i = 1; i < columns.size(); i++) {
            insertStmt.append(columns.get(i)).append(" = VALUES(").append(columns.get(i)).append(")");
            if (i < columns.size() - 1) insertStmt.append(", ");
        }

        PreparedStatement ps = mysqlConn.prepareStatement(insertStmt.toString());
        mysqlConn.setAutoCommit(false); // Enable transaction control
        int rowCount = 0;
        int batchSize = Config.getBatchSize();
        try {
            while (rs.next()) {
                for (int i = 0; i < columns.size(); i++) {
                    ps.setObject(i + 1, rs.getObject(i + 1));
                }
                ps.addBatch();
                rowCount++;

                if (rowCount % batchSize == 0) {
                    ps.executeBatch();
                    mysqlConn.commit();
                    logger.debug("Committed batch of {} records for delta sync of table {}", batchSize, tableName);
                }
            }
            // Commit remaining records
            ps.executeBatch();
            mysqlConn.commit();
            logger.debug("Committed final batch of {} records for delta sync of table {}", rowCount % batchSize, tableName);
        } catch (SQLException e) {
            logger.error("Error during batch upsert for table {}, rolling back transaction", tableName, e);
            mysqlConn.rollback();
            throw e;
        } finally {
            ps.close();
            rs.close();
            stmt.close();
            mysqlConn.setAutoCommit(true); // Restore auto-commit
        }
        logger.debug("Synced {} rows for table {}", rowCount, tableName);

        // Update total rows count after delta
        Statement countStmt = mysqlConn.createStatement();
        ResultSet countRs = countStmt.executeQuery("SELECT COUNT(*) FROM " + tableName);
        if (countRs.next()) {
            totalRows.put(tableName, countRs.getInt(1));
        }
        countRs.close();
        countStmt.close();

        logger.info("Delta sync completed for table {}", tableName);
    }

    public void generateReport(String type) {
        logger.info("Generating {} migration report", type);
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Migration Report");

        // Create header row
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("Table Name");
        headerRow.createCell(1).setCellValue("Total Rows Migrated");
        headerRow.createCell(2).setCellValue("Migration Type");
        headerRow.createCell(3).setCellValue("Timestamp");

        // Data rows
        int rowNum = 1;
        long timestamp = System.currentTimeMillis();
        for (Map.Entry<String, Integer> entry : totalRows.entrySet()) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(entry.getKey());
            row.createCell(1).setCellValue(entry.getValue());
            row.createCell(2).setCellValue(type);
            row.createCell(3).setCellValue(new Timestamp(timestamp).toString());
        }

        // Write to file
        try (FileOutputStream fileOut = new FileOutputStream("migration_report.xlsx")) {
            workbook.write(fileOut);
            logger.info("Excel report generated: migration_report.xlsx");
        } catch (IOException e) {
            logger.error("Error generating report: {}", e.getMessage());
        } finally {
            try {
                workbook.close();
            } catch (IOException e) {
                logger.error("Error closing workbook: {}", e.getMessage());
            }
        }
        logger.info("Report generation completed");
    }

    private List<String> getColumnNames(String tableName) throws SQLException {
        logger.debug("Retrieving column names for table {}", tableName);
        List<String> columns = new ArrayList<>();
        Statement stmt = mssqlConn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" + tableName + "' ORDER BY ORDINAL_POSITION");
        while (rs.next()) {
            columns.add(rs.getString("COLUMN_NAME"));
        }
        rs.close();
        stmt.close();
        logger.debug("Retrieved {} columns for table {}", columns.size(), tableName);
        return columns;
    }
}