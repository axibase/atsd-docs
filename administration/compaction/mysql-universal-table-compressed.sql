DROP DATABASE IF EXISTS axibase;
CREATE DATABASE axibase;
USE axibase;


CREATE TABLE Instruments(
   Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Name VARCHAR(20)
);

CREATE TABLE Metrics(
   Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   Name VARCHAR(20)
);

INSERT INTO Instruments (Name) VALUES ("IBM");

INSERT INTO Metrics (Name) VALUES ("Open");
INSERT INTO Metrics (Name) VALUES ("High");
INSERT INTO Metrics (Name) VALUES ("Low");
INSERT INTO Metrics (Name) VALUES ("Close");
INSERT INTO Metrics (Name) VALUES ("Volume");

CREATE TABLE UniversalHistory(
   Instrument INT NOT NULL REFERENCES Instruments(Id),
   Metric INT NOT NULL REFERENCES Metrics(Id),
   Time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   Value DECIMAL(10,4)
) ROW_FORMAT=COMPRESSED;

CREATE INDEX Idx_UniversalHistory ON UniversalHistory (Instrument, Metric, Time);

LOAD DATA LOCAL INFILE '/data/IBM_adjusted.txt'
INTO TABLE UniversalHistory
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(@col1, @col2, @col3, @col4, @col5, @col6, @col7)
SET 
	Instrument=1,
	Metric=1,
	value=@col3,
	Time=CONCAT(DATE_FORMAT(STR_TO_DATE(@col1, '%m/%d/%Y'), '%Y-%m-%d'), ' ', @col2);
	
LOAD DATA LOCAL INFILE '/data/IBM_adjusted.txt'
INTO TABLE UniversalHistory
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(@col1, @col2, @col3, @col4, @col5, @col6, @col7)
SET 
	Instrument=1,
	Metric=2,
	value=@col4,
	Time=CONCAT(DATE_FORMAT(STR_TO_DATE(@col1, '%m/%d/%Y'), '%Y-%m-%d'), ' ', @col2);
	
LOAD DATA LOCAL INFILE '/data/IBM_adjusted.txt'
INTO TABLE UniversalHistory
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(@col1, @col2, @col3, @col4, @col5, @col6, @col7)
SET 
	Instrument=1,
	Metric=3,
	value=@col5,
	Time=CONCAT(DATE_FORMAT(STR_TO_DATE(@col1, '%m/%d/%Y'), '%Y-%m-%d'), ' ', @col2);
	
LOAD DATA LOCAL INFILE '/data/IBM_adjusted.txt'
INTO TABLE UniversalHistory
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(@col1, @col2, @col3, @col4, @col5, @col6, @col7)
SET 
	Instrument=1,
	Metric=4,
	value=@col6,
	Time=CONCAT(DATE_FORMAT(STR_TO_DATE(@col1, '%m/%d/%Y'), '%Y-%m-%d'), ' ', @col2);
	
LOAD DATA LOCAL INFILE '/data/IBM_adjusted.txt'
INTO TABLE UniversalHistory
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(@col1, @col2, @col3, @col4, @col5, @col6, @col7)
SET 
	Instrument=1,
	Metric=5,
	value=@col7,
	Time=CONCAT(DATE_FORMAT(STR_TO_DATE(@col1, '%m/%d/%Y'), '%Y-%m-%d'), ' ', @col2);

SELECT 
	MIN(Engine) AS "Storage engine",
	MIN(Row_format) AS "Row format",
	SUM(data_length) "Data", 
	SUM(index_length) "Index", 
	SUM(data_length + index_length) "Total"
FROM 
   information_schema.TABLES 
WHERE 
   table_schema='axibase';



