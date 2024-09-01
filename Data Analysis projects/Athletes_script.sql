SELECT *
FROM athletes

--create a copy of the table  
SELECT *
INTO Athletes_copy 
FROM athletes




--CLEANING THE NAME COLUMN
SELECT TRIM(REPLACE(Name,'   ','')) AS Fullname
FROM athletes

UPDATE  Athletes
SET Name = TRIM(REPLACE(Name,'   ',''))

--SELECT UPPER(LEFT(NAME, 1)) +
--		SUBSTRING(Name, 2,LEN(NAME)-UPPER(CHARINDEX(NAME, '  ')))
--FROM  athletes


SELECT UPPER(LEFT(NAME, 1)) +
       SUBSTRING(NAME, 2, CHARINDEX(' ', NAME) - 1) +
       ' ' +
       UPPER(SUBSTRING(NAME, CHARINDEX(' ', NAME) + 1, 1)) +
       SUBSTRING(NAME, CHARINDEX(' ', NAME) + 2, LEN(NAME) - CHARINDEX(' ', NAME))
FROM athletes;

UPDATE Athletes
SET Name = UPPER(LEFT(NAME, 1)) +
       SUBSTRING(NAME, 2, CHARINDEX(' ', NAME) - 1) +
       ' ' +
       UPPER(SUBSTRING(NAME, CHARINDEX(' ', NAME) + 1, 1)) +
       SUBSTRING(NAME, CHARINDEX(' ', NAME) + 2, LEN(NAME) - CHARINDEX(' ', NAME))



--DOB COLUMN
SELECT FORMAT(DOB, 'YYYY-DD-MM')
FROM dbo.athletes

SELECT CONVERT(DATE, DOB)
FROM Athletes

SELECT ISDATE(DOB) 
FROM athletes
--WHERE ISDATE(DOB) = 0;

UPDATE athletes
SET DOB = SUBSTRING(DOB, 4, 2) + '/' + SUBSTRING(DOB, 1, 2) + '/' + SUBSTRING(DOB, 7, 4)
WHERE ISDATE(DOB) = 0;


SELECT CONVERT(DATE,DOB)
FROM Athletes

UPDATE ATHLETES
SET DOB = CONVERT(DATE,DOB)


-- GENDER COLUMN
SELECT DISTINCT Gender
FROM Athletes

SELECT 
		CASE WHEN GENDER ='Female' THEN 'F' 
			 WHEN GENDER = 'Male' THEN 'M' ELSE GENDER
			 END
			 AS Modified_gender
FROM Athletes;

UPDATE ATHLETES
SET Gender = CASE WHEN GENDER ='Female' THEN 'F' 
			 WHEN GENDER = 'Male' THEN 'M' ELSE GENDER
			 END

SELECT *
FROM Athletes

--PersonalBest Column 
SELECT personalBest
FROM Athletes

SELECT CONVERT(FLOAT, PersonalBest) AS Converetedpersonalbest
FROM athletes


UPDATE Athletes
SET PersonalBest = CONVERT(FLOAT, PersonalBest)


--LatestPerformance column

SELECT LatestPerformance
FROM athletes


SELECT CAST(LatestPerformance/100.0 AS FLOAT)
FROM athletes

--Add a new column LatestPerformance_temp to the Table
ALTER TABLE Athletes
ADD LatestPerformance_temp FLOAT;

UPDATE Athletes
SET LatestPerformance_temp= CAST(LatestPerformance/100.0 AS FLOAT)

--Preview the Table
SELECT *
FROM Athletes

--Deleting the LatestPerformance Column
ALTER TABLE Athletes
DROP COLUMN LatestPerformance

--Renaming the LatestPerformance_temp column to LatestPerformance
EXEC sp_rename 'Athletes.latestperformance_temp', 'latestperformance', 'COLUMN';

--Preview the Table
SELECT *
FROM Athletes

--How to Rollback  changes to an  update if i am not satisfied with the update
BEGIN TRANSACTION;

-- Perform updates to the table
UPDATE YourTable
SET Column1 = NewValue1,
    Column2 = NewValue2;

-- Examine the results and determine if they are satisfactory
-- If not, undo the changes
ROLLBACK;

-- If satisfied, commit the changes
-- COMMIT;


--Classwork...Replace the injury column

--Creating Age Column
--ALTER TABLE Athletes
--ADD Age INT;
--Years
SELECT DATEDIFF(YEAR,DOB, GETDATE())
FROM Athletes

--Precise age
SELECT 
    CAST(FLOOR(DATEDIFF(DAY, DOB, GETDATE()) / 365.25) AS NVARCHAR(10)) + ' years, ' +
    CAST(FLOOR((DATEDIFF(DAY, DOB, GETDATE()) % 365.25) / 30.4375) AS NVARCHAR(10)) + ' months, ' +
    CONVERT(NVARCHAR(10), CONVERT(INT, DATEDIFF(DAY, DOB, GETDATE()) % 30.4375)) + ' days' AS Age
FROM Athletes;















