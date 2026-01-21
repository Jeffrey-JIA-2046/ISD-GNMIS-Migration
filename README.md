# Data Migration Tool
# Migrates data from Microsoft SQL Server to MySQL
# Performs full migration initially, then delta sync every minute

# Java Version

# Setup:
# 1. Update src/main/resources/config.properties with your database credentials.
# 2. Run: mvn compile exec:java -Dexec.mainClass="com.migration.Main"