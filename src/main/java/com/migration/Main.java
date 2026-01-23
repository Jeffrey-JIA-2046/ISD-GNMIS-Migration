package com.migration;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Scanner;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Main {
    private static final Logger logger = LogManager.getLogger(Main.class);

    public static void main(String[] args) {
        logger.info("Starting Data Migration Application");
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("Choose an option:");
            System.out.println("1. Perform Full Migration");
            System.out.println("2. Start Delta Sync");
            System.out.println("3. Exit");
            System.out.print("Enter choice: ");
            int choice = scanner.nextInt();
            if (choice == 1) {
                performFullMigration();
            } else if (choice == 2) {
                startDeltaSync();
            } else if (choice == 3) {
                logger.info("Exiting application");
                System.out.println("Exiting...");
                break;
            } else {
                logger.warn("Invalid choice entered: {}", choice);
                System.out.println("Invalid choice. Please try again.");
            }
        }
        scanner.close();
        logger.info("Application terminated");
    }

    private static void performFullMigration() {
        logger.info("Initiating full migration process");
        Migrator migrator = new Migrator();
        try {
            migrator.connect();
            List<String> tables = Config.getFullMigrationTables();
            for (String table : tables) {
                migrator.migrateTableFull(table);
            }
            migrator.disconnect();
            migrator.generateReport("Full");
            logger.info("Full migration process completed successfully");
        } catch (SQLException e) {
            logger.error("Error during full migration: {}", e.getMessage(), e);
        }
    }

    private static void startDeltaSync() {
        logger.info("Initiating delta sync process");
        // Read the last sync timestamp from file, or use current time if not available
        final Timestamp[] lastSync = {Config.readLastSyncTimestamp()};
        long syncInterval = Config.getDeltaSyncIntervalMs();
        Timer timer = new Timer();
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                logger.debug("Running scheduled delta sync from timestamp: {}", lastSync[0]);
                Migrator migrator = new Migrator();
                try {
                    migrator.connect();
                    List<String> tables = Config.getDeltaSyncTables();
                    for (String table : tables) {
                        migrator.syncTableDelta(table, lastSync[0]);
                    }
                    migrator.disconnect();
                    migrator.generateReport("Delta");
                    // Update the timestamp after successful sync
                    lastSync[0] = new Timestamp(System.currentTimeMillis());
                    Config.writeLastSyncTimestamp(lastSync[0]);
                    logger.debug("Delta sync cycle completed, updated timestamp to: {}", lastSync[0]);
                } catch (SQLException e) {
                    logger.error("Error during delta sync: {}", e.getMessage(), e);
                }
            }
        }, syncInterval, syncInterval); // Use configured interval
        logger.info("Delta sync scheduled to run every {} milliseconds", syncInterval);
        System.out.println("Delta sync started. It will run every " + (syncInterval / 1000) + " seconds in the background.");
    }
}