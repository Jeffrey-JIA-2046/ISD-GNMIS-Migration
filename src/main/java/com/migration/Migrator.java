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

    public void migrateTableFull(String tableName) throws SQLException {
        logger.info("Starting full migration for table {}", tableName);

        // Validate table name to prevent SQL injection
        if (!isValidTableName(tableName)) {
            throw new IllegalArgumentException("Invalid table name: " + tableName);
        }

        // Get column info
        logger.debug("Retrieving column information for table {}", tableName);
        String columnQuery = "SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ? ORDER BY ORDINAL_POSITION";
        PreparedStatement stmt = mssqlConn.prepareStatement(columnQuery);
        stmt.setString(1, tableName);
        ResultSet rs = stmt.executeQuery();
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
        logger.debug(createStmt.toString());
        createStmt.append(")");
        Statement mysqlStmt = mysqlConn.createStatement();
        mysqlStmt.execute(createStmt.toString());
        mysqlStmt.close();
        logger.debug("Table {} created or already exists in MySQL", tableName);

        // Migrate data
        logger.debug("Migrating data for table {}", tableName);
        mysqlConn.setAutoCommit(false); // Enable transaction control
        String selectQuery = "SELECT * FROM " + tableName; // Safe because tableName is validated above
        Statement selectStmt = mssqlConn.createStatement();
        rs = selectStmt.executeQuery(selectQuery);
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
        long startTime = System.currentTimeMillis();
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
                    long elapsed = System.currentTimeMillis() - startTime;
                    double avgTimePerBatch = (double) elapsed / (rowCount / batchSize);
                    logger.info("[PROGRESS] Table: {} | Committed: {} records | Batch#: {} | Elapsed: {} ms | Avg per batch: {:.2f} ms", 
                        tableName, rowCount, rowCount / batchSize, elapsed, avgTimePerBatch);
                }
            }
            // Commit remaining records
            ps.executeBatch();
            mysqlConn.commit();
            long totalElapsed = System.currentTimeMillis() - startTime;
            int remainingRecords = rowCount % batchSize;
            logger.info("[PROGRESS] Table: {} | Final commit: {} records | Total migrated: {} records | Total time: {} ms | Avg speed: {:.2f} records/sec", 
                tableName, remainingRecords > 0 ? remainingRecords : batchSize, rowCount, totalElapsed, rowCount * 1000.0 / totalElapsed);
        } catch (SQLException e) {
            logger.error("Error during batch insert for table {}, rolling back transaction", tableName, e);
            mysqlConn.rollback();
            throw e;
        } finally {
            ps.close();
            rs.close();
            selectStmt.close();
            mysqlConn.setAutoCommit(true); // Restore auto-commit
        }
        logger.debug("Migrated {} rows for table {}", rowCount, tableName);

        // Update total rows count
        String countQuery = "SELECT COUNT(*) FROM " + tableName; // Safe because tableName is validated above
        Statement countStmt = mysqlConn.createStatement();
        ResultSet countRs = countStmt.executeQuery(countQuery);
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

        // Validate table name to prevent SQL injection
        if (!isValidTableName(tableName)) {
            throw new IllegalArgumentException("Invalid table name: " + tableName);
        }

        // Use 'updatets' column for change detection
        logger.debug("Querying changes for table {} since {}", tableName, lastSync);
        String deltaQuery = "SELECT * FROM " + tableName + " WHERE updatets > ?"; // Safe because tableName is validated above
        PreparedStatement stmt = mssqlConn.prepareStatement(deltaQuery);
        stmt.setTimestamp(1, lastSync);
        ResultSet rs = stmt.executeQuery();

        // Get columns
        List<String> columns = getColumnNames(tableName);
        logger.debug("Columns for table {}: {}", tableName, columns);

        // Determine key column (assume 'refno' if exists, else first column)
        String keyColumn = columns.contains("refno") ? "refno" : columns.get(0);
        logger.debug("Using key column '{}' for table {}", keyColumn, tableName);

        // Prepare INSERT statement
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

        // Prepare UPDATE statement
        StringBuilder updateStmt = new StringBuilder("UPDATE " + tableName + " SET ");
        for (int i = 0; i < columns.size(); i++) {
            updateStmt.append(columns.get(i)).append(" = ?");
            if (i < columns.size() - 1) updateStmt.append(", ");
        }
        updateStmt.append(" WHERE ").append(keyColumn).append(" = ?");

        // Collect data for batch processing
        List<Object[]> insertData = new ArrayList<>();
        List<Object[]> updateData = new ArrayList<>();

        while (rs.next()) {
            Object[] rowData = new Object[columns.size()];
            for (int i = 0; i < columns.size(); i++) {
                rowData[i] = rs.getObject(i + 1);
            }

            // Check if record exists in MySQL
            String checkQuery = "SELECT 1 FROM " + tableName + " WHERE " + keyColumn + " = ? LIMIT 1";
            PreparedStatement checkStmt = mysqlConn.prepareStatement(checkQuery);
            checkStmt.setObject(1, rs.getObject(keyColumn));
            ResultSet checkRs = checkStmt.executeQuery();
            boolean exists = checkRs.next();
            checkRs.close();
            checkStmt.close();

            if (exists) {
                updateData.add(rowData);
            } else {
                insertData.add(rowData);
            }
        }
        rs.close();
        stmt.close();

        // Batch INSERT
        if (!insertData.isEmpty()) {
            PreparedStatement insertPs = mysqlConn.prepareStatement(insertStmt.toString());
            mysqlConn.setAutoCommit(false);
            int insertCount = 0;
            long insertStartTime = System.currentTimeMillis();
            try {
                for (Object[] row : insertData) {
                    for (int i = 0; i < row.length; i++) {
                        insertPs.setObject(i + 1, row[i]);
                    }
                    insertPs.addBatch();
                    insertCount++;
                    if (insertCount % Config.getBatchSize() == 0) {
                        insertPs.executeBatch();
                        mysqlConn.commit();
                        long elapsed = System.currentTimeMillis() - insertStartTime;
                        double progress = (insertCount * 100.0) / insertData.size();
                        logger.info("[DELTA-INSERT] Table: {} | Progress: {:.1f}% | Inserted: {}/{} records | Elapsed: {} ms", 
                            tableName, progress, insertCount, insertData.size(), elapsed);
                    }
                }
                insertPs.executeBatch();
                mysqlConn.commit();
                long totalInsertTime = System.currentTimeMillis() - insertStartTime;
                logger.info("[DELTA-INSERT] Table: {} | Completed: {}/{} records | Total time: {} ms | Avg speed: {:.2f} records/sec", 
                    tableName, insertCount, insertData.size(), totalInsertTime, insertCount * 1000.0 / totalInsertTime);
            } catch (SQLException e) {
                logger.error("Error during batch INSERT for table {}, rolling back transaction", tableName, e);
                mysqlConn.rollback();
                throw e;
            } finally {
                insertPs.close();
                mysqlConn.setAutoCommit(true);
            }
            logger.debug("Inserted {} new records for table {}", insertCount, tableName);
        }

        // Batch UPDATE
        if (!updateData.isEmpty()) {
            PreparedStatement updatePs = mysqlConn.prepareStatement(updateStmt.toString());
            mysqlConn.setAutoCommit(false);
            int updateCount = 0;
            long updateStartTime = System.currentTimeMillis();
            try {
                for (Object[] row : updateData) {
                    for (int i = 0; i < row.length; i++) {
                        updatePs.setObject(i + 1, row[i]);
                    }
                    // Set key for WHERE clause
                    updatePs.setObject(row.length + 1, row[columns.indexOf(keyColumn)]);
                    updatePs.addBatch();
                    updateCount++;
                    if (updateCount % Config.getBatchSize() == 0) {
                        updatePs.executeBatch();
                        mysqlConn.commit();
                        long elapsed = System.currentTimeMillis() - updateStartTime;
                        double progress = (updateCount * 100.0) / updateData.size();
                        logger.info("[DELTA-UPDATE] Table: {} | Progress: {:.1f}% | Updated: {}/{} records | Elapsed: {} ms", 
                            tableName, progress, updateCount, updateData.size(), elapsed);
                    }
                }
                updatePs.executeBatch();
                mysqlConn.commit();
                long totalUpdateTime = System.currentTimeMillis() - updateStartTime;
                logger.info("[DELTA-UPDATE] Table: {} | Completed: {}/{} records | Total time: {} ms | Avg speed: {:.2f} records/sec", 
                    tableName, updateCount, updateData.size(), totalUpdateTime, updateCount * 1000.0 / totalUpdateTime);
            } catch (SQLException e) {
                logger.error("Error during batch UPDATE for table {}, rolling back transaction", tableName, e);
                mysqlConn.rollback();
                throw e;
            } finally {
                updatePs.close();
                mysqlConn.setAutoCommit(true);
            }
            logger.debug("Updated {} existing records for table {}", updateCount, tableName);
        }

        int totalProcessed = insertData.size() + updateData.size();
        logger.debug("Processed {} records for table {} ({} inserts, {} updates)", totalProcessed, tableName, insertData.size(), updateData.size());

        // Update total rows count after delta
        String countQuery = "SELECT COUNT(*) FROM " + tableName; // Safe because tableName is validated above
        Statement countStmt = mysqlConn.createStatement();
        ResultSet countRs = countStmt.executeQuery(countQuery);
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

        // Validate table name to prevent SQL injection
        if (!isValidTableName(tableName)) {
            throw new IllegalArgumentException("Invalid table name: " + tableName);
        }

        List<String> columns = new ArrayList<>();
        String query = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ? ORDER BY ORDINAL_POSITION";
        PreparedStatement stmt = mssqlConn.prepareStatement(query);
        stmt.setString(1, tableName);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            columns.add(rs.getString("COLUMN_NAME"));
        }
        rs.close();
        stmt.close();
        logger.debug("Retrieved {} columns for table {}", columns.size(), tableName);
        return columns;
    }

    /**
     * Validates table name to prevent SQL injection.
     * Only allows alphanumeric characters and underscores, must start with letter or underscore.
     */
    private boolean isValidTableName(String tableName) {
        if (tableName == null || tableName.trim().isEmpty()) {
            return false;
        }
        // Allow only alphanumeric characters and underscores, must start with letter or underscore
        return tableName.matches("^[a-zA-Z_][a-zA-Z0-9_]*$");
    }
}