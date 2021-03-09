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

INSERT INTO AdrTest1000Insert
(TextCol1
,TextCol2)
SELECT TextCol1,
TextCol2
FROM AdrTest1000
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'INSERT 1000' AS TableName,
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

INSERT INTO AdrTest1000000Insert
(TextCol1
,TextCol2)
SELECT TextCol1,
TextCol2
FROM AdrTest1000000
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'INSERT 1M' AS TableName,
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

INSERT INTO AdrTest100MInsert
(TextCol1
,TextCol2)
SELECT TextCol1,
TextCol2
FROM AdrTest100M
WHERE RowId % 2 = 0;

SELECT @Duration = DATEDIFF(MILLISECOND,@starttime,CURRENT_TIMESTAMP);

SELECT 
N'INSERT 100M' AS TableName,
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

