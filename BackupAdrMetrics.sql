BACKUP DATABASE [ADRMetrics] 
TO DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\ADRMetrics.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'ADRMetrics-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO