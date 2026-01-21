@echo off
echo ========================================
echo    Data Migration Tool
echo ========================================
echo.
echo Configuration loaded from config.properties
echo Tables to migrate: prheader,prcontent,preheaderhist,precontenthist
echo.
echo Starting the migration process...
echo.
java -jar target\data-migration-1.0-SNAPSHOT.jar
echo.
echo ========================================
echo Migration process finished.
echo Check logs/migration.log for details.
echo ========================================
pause