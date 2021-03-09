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
0 AS Duration
FROM sys.dm_db_log_info(DB_ID(N'NonAdrTest'))
GROUP BY vlf_status;

BEGIN TRANSACTION

UPDATE AdrTest1000
SET TextCol1 = 'Changed'
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'Update 1000' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration AS [Duration (ms)]
FROM sys.dm_db_log_info(DB_ID(N'NonAdrTest'))
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
@Duration  AS Duration
FROM sys.dm_db_log_info(DB_ID(N'NonAdrTest'))
GROUP BY vlf_status;

SELECT @starttime = CURRENT_TIMESTAMP;

BEGIN TRANSACTION

UPDATE AdrTest1000000
SET TextCol1 = 'Changed'
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'Update 1M' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration AS [Duration (ms)]
FROM sys.dm_db_log_info(DB_ID(N'NonAdrTest'))
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
@Duration AS Duration
FROM sys.dm_db_log_info(DB_ID(N'NonAdrTest'))
GROUP BY vlf_status;

SELECT @starttime = CURRENT_TIMESTAMP;

BEGIN TRANSACTION

UPDATE AdrTest100M
SET TextCol1 = 'Changed'
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'Update 100M' AS TableName,
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount,
@Duration AS [Duration (ms)]
FROM sys.dm_db_log_info(DB_ID(N'NonAdrTest'))
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
@Duration AS Duration
FROM sys.dm_db_log_info(DB_ID(N'NonAdrTest'))
GROUP BY vlf_status;

