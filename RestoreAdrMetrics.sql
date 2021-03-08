USE [master]
RESTORE DATABASE [ADRMetrics] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\ADRMetrics.bak' 
WITH  FILE = 1,  
NOUNLOAD,  
REPLACE,  
STATS = 5

GO


