USE AdrMetrics;

SET NOCOUNT ON;

USE AdrMetrics;

DROP TABLE IF EXISTS  AdrTest1000;

CREATE TABLE AdrTest1000
(RowId INT IDENTITY(1,1)
,TextCol1 VARCHAR(2000)
,TextCol2 VARCHAR(2000));

DECLARE @loopcount INT, 
@looplimit INT;

SELECT @loopcount = 1, @looplimit = 1000;

WHILE @loopcount <= @looplimit
BEGIN

    INSERT INTO AdrTest1000
    (TextCol1
    ,TextCol2)
    VALUES
    ('Test'
    ,'Values');

    SELECT @loopcount += 1;

END

DROP TABLE IF EXISTS  AdrTest1000000;

CREATE TABLE AdrTest1000000
(RowId INT IDENTITY(1,1)
,TextCol1 VARCHAR(2000)
,TextCol2 VARCHAR(2000));

--DECLARE @loopcount INT, 
--@looplimit INT;

SELECT @loopcount = 1, @looplimit = 1000;

WHILE @loopcount <= @looplimit
BEGIN

    INSERT INTO AdrTest1000000
    (TextCol1
    ,TextCol2)
    SELECT TextCol1,
	TextCol2
	FROM AdrTest1000;

    SELECT @loopcount += 1;

END

DROP TABLE IF EXISTS  AdrTest100M;

CREATE TABLE AdrTest100M
(RowId INT IDENTITY(1,1)
,TextCol1 VARCHAR(2000)
,TextCol2 VARCHAR(2000));


SELECT @loopcount = 1, @looplimit = 100;

WHILE @loopcount <= @looplimit
BEGIN

    INSERT INTO AdrTest100M
    (TextCol1
    ,TextCol2)
    SELECT TextCol1,
	TextCol2
	FROM AdrTest1000000;

    SELECT @loopcount += 1;

END