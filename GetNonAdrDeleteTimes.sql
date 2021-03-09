USE NonAdrTest;

SET NOCOUNT ON;

DECLARE @starttime DATETIME,
@Duration BIGINT;

SELECT @starttime = CURRENT_TIMESTAMP;


SELECT 
N'StartValues' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
0
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;

BEGIN TRANSACTION

DELETE FROM AdrTest1000
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'Delete 1000' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration AS [Duration (ms)]
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;

SELECT @starttime = CURRENT_TIMESTAMP;

ROLLBACK TRANSACTION;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'ROLLBACK 1000' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;

SELECT @starttime = CURRENT_TIMESTAMP;

BEGIN TRANSACTION

DELETE FROM AdrTest1000000
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'DELETE 1M' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration AS [Duration (ms)]
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;

SELECT @starttime = CURRENT_TIMESTAMP;

ROLLBACK TRANSACTION;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'ROLLBACK 1M' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;

SELECT @starttime = CURRENT_TIMESTAMP;

BEGIN TRANSACTION

DELETE FROM AdrTest100M
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'DELETE 100M' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration AS [Duration (ms)]
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;

SELECT @starttime = CURRENT_TIMESTAMP;

ROLLBACK TRANSACTION;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'ROLLBACK 100M' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;

