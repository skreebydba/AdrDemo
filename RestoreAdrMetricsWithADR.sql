USE [master]
RESTORE DATABASE [ADRMetricsWithADR] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\ADRMetrics.bak' 
WITH  FILE = 1,  
MOVE N'ADRMetrics' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ADRMetricsWithADR.mdf',
MOVE N'ADRMetrics_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ADRMetrics_log.ldf',
NOUNLOAD,  
REPLACE,  
STATS = 5

GO


