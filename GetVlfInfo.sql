USE tempdb

DROP TABLE IF EXISTS #LogInfo;

CREATE TABLE #LogInfo
(RowId INT IDENTITY(1,1)
,TableName SYSNAME
,VlfStatus CHAR(10)
,VlfTypeSizeMb BIGINT
,VlfTypeCount BIGINT)

SELECT 
N'StartValues',
CASE
	WHEN vlf_status = 0 THEN N'Free'
	WHEN vlf_status = 2 THEN N'Active'
END AS VlfStatus, 
SUM(vlf_size_mb) AS [VlfTypeSize (MB)], 
COUNT(*) AS VlfTypeCount
FROM sys.dm_db_log_info(DB_ID(N'AdrMetrics'))
GROUP BY vlf_status;