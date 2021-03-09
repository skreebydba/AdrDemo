USE WithAdrTest;

EXEC sp_whoisactive;

EXEC sp_spaceused AdrTest1000;
EXEC sp_spaceused AdrTest1000000;
EXEC sp_spaceused AdrTest100M;

SELECT name, (size / 128)
FROM sys.master_files
WHERE DB_NAME(database_id) = N'WithAdrTest';

EXEC sp_spaceused @oneresultset = 1;

SELECT name, recovery_model_desc
FROM sys.databases
WHERE name = N'AdrMetrics';

DBCC LOGINFO();

USE NonAdrTest;

EXEC master.dbo.sp_WhoIsActive;
EXEC sp_spaceused AdrTest1000;
EXEC sp_spaceused AdrTest1000000;
EXEC sp_spaceused AdrTest100M;

SELECT name, (size / 128)
FROM sys.master_files
WHERE DB_NAME(database_id) = N'NonAdrTest';

EXEC sp_spaceused @oneresultset = 1;

SELECT name, recovery_model_desc
FROM sys.databases
WHERE name = N'AdrMetrics';

DBCC LOGINFO();