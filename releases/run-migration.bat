@echo off
echo ========================================
echo    Data Migration Tool
echo ========================================
echo.
echo Configuration loaded from config.properties
echo Tables to migrate: preheaderhist,hotlink_audit
echo.
echo Starting the migration process...
echo.
java -jar data-migration.jar
echo.
echo ========================================
echo Migration process finished.
echo Check logs/migration.log for details.
echo ========================================
pause