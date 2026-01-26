@echo off
echo ========================================
echo    Data Migration Tool
echo ========================================
echo.
echo Configuration loaded from config.properties
echo Tables to migrate: prheaderhist,hotlink_audit
echo.
echo Starting the migration process...
echo.
java -cp "data-migration.jar;." com.migration.Main
echo.
echo ========================================
echo Migration process finished.
echo Check logs/migration.log for details.
echo ========================================
pause