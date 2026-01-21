package com.migration;

import java.io.Console;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Config {
    private static final Logger logger = LogManager.getLogger(Config.class);
    private static final Properties properties = new Properties();
    private static String mssqlPassword;
    private static String mysqlPassword;

    static {
        try (InputStream input = Config.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                logger.error("Unable to find config.properties");
                throw new RuntimeException("config.properties not found");
            }
            properties.load(input);
            logger.info("Configuration loaded successfully");
        } catch (IOException e) {
            logger.error("Error loading config.properties: {}", e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public static Connection getMSSQLConnection() throws SQLException {
        logger.debug("Creating MSSQL connection");
        String url = properties.getProperty("mssql.url");
        String user = properties.getProperty("mssql.user");
        if (mssqlPassword == null) {
            mssqlPassword = readPasswordSecurely("MSSQL");
        }
        Connection conn = DriverManager.getConnection(url, user, mssqlPassword);
        logger.info("MSSQL connection established");
        return conn;
    }

    public static Connection getMySQLConnection() throws SQLException {
        logger.debug("Creating MySQL connection");
        String url = properties.getProperty("mysql.url");
        String user = properties.getProperty("mysql.user");
        if (mysqlPassword == null) {
            mysqlPassword = readPasswordSecurely("MySQL");
        }
        Connection conn = DriverManager.getConnection(url, user, mysqlPassword);
        logger.info("MySQL connection established");
        return conn;
    }

    public static List<String> getMigrationTables() {
        String tablesStr = properties.getProperty("migration.tables");
        if (tablesStr == null || tablesStr.trim().isEmpty()) {
            logger.warn("No migration tables specified in config.properties");
            return new java.util.ArrayList<>();
        }
        List<String> tables = Arrays.asList(tablesStr.split(","));
        logger.debug("Migration tables loaded: {}", tables);
        return tables;
    }

    public static int getBatchSize() {
        String batchSizeStr = properties.getProperty("migration.batch.size", "5000");
        try {
            int batchSize = Integer.parseInt(batchSizeStr);
            if (batchSize <= 0) {
                logger.warn("Invalid batch size {}, using default 5000", batchSize);
                return 5000;
            }
            logger.debug("Batch size loaded: {}", batchSize);
            return batchSize;
        } catch (NumberFormatException e) {
            logger.warn("Invalid batch size format {}, using default 5000", batchSizeStr);
            return 5000;
        }
    }

    /**
     * Securely reads password from console with fallback warning.
     * Uses Console.readPassword() when available, otherwise warns about visibility.
     */
    private static String readPasswordSecurely(String dbType) {
        Console console = System.console();
        if (console != null) {
            char[] passwordArray = console.readPassword("Enter %s password: ", dbType);
            String password = new String(passwordArray);
            Arrays.fill(passwordArray, ' '); // Clear sensitive data from memory
            return password;
        } else {
            // Fallback for environments without console (e.g., some IDEs)
            logger.warn("Console not available for secure password input. Password may be visible on screen.");
            System.out.print("Enter " + dbType + " password (WARNING: input may be visible): ");
            Scanner scanner = new Scanner(System.in);
            String password = scanner.nextLine();
            // Don't close scanner here as it might close System.in
            return password;
        }
    }
}