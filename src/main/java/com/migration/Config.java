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
            Console console = System.console();
            if (console != null) {
                char[] passwordArray = console.readPassword("Enter MSSQL password: ");
                mssqlPassword = new String(passwordArray);
                java.util.Arrays.fill(passwordArray, ' '); // Clear the array
            } else {
                Scanner scanner = new Scanner(System.in);
                System.out.print("Enter MSSQL password: ");
                mssqlPassword = scanner.nextLine();
                scanner.close();
            }
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
            Console console = System.console();
            if (console != null) {
                char[] passwordArray = console.readPassword("Enter MySQL password: ");
                mysqlPassword = new String(passwordArray);
                java.util.Arrays.fill(passwordArray, ' '); // Clear the array
            } else {
                Scanner scanner = new Scanner(System.in);
                System.out.print("Enter MySQL password: ");
                mysqlPassword = scanner.nextLine();
                scanner.close();
            }
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
}