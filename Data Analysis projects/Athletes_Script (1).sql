
-- Create the athletes table
CREATE TABLE athletes (
    AthleteID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB VARCHAR(50),
    Gender VARCHAR(10),
    Nationality VARCHAR(50),
    PersonalBest VARCHAR(20),
    LatestPerformance INT,
    DateOfLatestPerformance VARCHAR(50),
    Event VARCHAR(50),
    Medals INT,
    Records VARCHAR(100),
    Injuries VARCHAR(200),
    Email VARCHAR(100)
);

-- Insert 10 rows into the athletes table
INSERT INTO athletes (AthleteID, Name, DOB, Gender, Nationality, PersonalBest, LatestPerformance, DateOfLatestPerformance, Event, Medals, Records, Injuries, Email)
VALUES
    (1, '  John doe', '15/07/1990', 'M', 'USA', '10.52', 1052, '2023-07-25', '100m', 2, '100m National Record', NULL, 'john.doe@example.com'),
    (2, 'jane Smith', '20/02/1995', 'Female', 'Canada', '11.25', 1127, '2023-07-22', '100m', 3, NULL, NULL, 'jane.smith@example.com'),
    (3, 'michael     Johnson   ', '03/09/1985', 'M', 'Jamaica', '9.87', 997, '2023-07-20', '100m', 5, 'Olympic Gold Medal', 'Hamstring Strain', 'michael.johnson@example.com'),
    (4, 'emily brown', '11/11/1998', 'Female', 'Australia', '11.14', 1120, '2023-07-24', '100m', 1, NULL, NULL, 'emily.brown@example.com'),
    (5, 'David Lee', '30/04/1992', 'Male', 'China', '10.96', 1096, '2023-07-23', '100m', 0, NULL, NULL, 'david.lee@example.com'),
    (6, 'Sophia Rodriguez', '07/03/1996', 'F', 'Spain', '11.01', 1101, '2023-07-21', '100m', 2, NULL, NULL, 'sophia.rodriguez@example.com'),
    (7, '  robert Green', '18/06/1993', 'Male', 'Germany', '10.75', 1075, '2023-07-19', '100m', 4, 'European Championship Silver Medal', NULL, 'robert.green@example.com'),
    (8, '  lily chen  ', '25/09/1997', 'Female', 'China', '11.30', 1135, '2023-07-26', '100m', 1, NULL, NULL, 'lily.chen@example.com'),
    (9, 'james Anderson    ', '14/12/1989', 'Male', 'UK', '10.61', 1069, '2023-07-18', '100m', 3, NULL, NULL, 'james.anderson@example.com'),
    (10, '  Isabella Martinez', '29/01/1994', 'F', 'Mexico', '11.45', 1146, '2023-07-27', '100m', 0, NULL, 'Knee Injury', 'isabella.martinez@example.com');

	--all info
	select* from athletes

	--copy files
	select * into athletes_copy from athletes

	--cleaning the name
select trim(name) from athletes

update athletes
set name = trim(name)

select replace('  ', '  ', name) from athletes

	SELECT (REPLACE(Name,'   ','')) AS Fullname
FROM athletes
update athletes set name = trim(name)
update athletes set name = trim(replace(name, '  ', ''))


select upper(left(name,1)) +
substring(name, 2, charindex(' ', name)-1) + 
' ' +
upper(substring(name, charindex(' ', name)+1, 1))+
substring(name, charindex(' ',name)+2, len(name) - charindex(' ', name)+2)
from athletes
	
	update athletes set name =upper(left(name,1)) +
substring(name, 2, charindex(' ', name)-1) + 
' ' +
upper(substring(name, charindex(' ', name)+1, 1))+
substring(name, charindex(' ',name)+2, len(name) - charindex(' ', name)+2)
from athletes

	--DOB
	select isdate(DOB) from athletes
	select substring(DOB, 4, 2)+'/'+ substring(DOB,1, 2)+'/'+substring(DOB, 7, 4)
	from athletes
	where ISDATE(DOB)=0
	update athletes set DOB = SUBSTRING(DOB, 4, 2)+'/'+ SUBSTRING(DOB, 1, 2)+'/' + SUBSTRING(DOB, 7, 4) WHERE ISDATE(DOB)=0
	select DOB FROM athletes

	--GENDER
	SELECT GENDER FROM athletes
	UPDATE athletes SET Gender = CASE WHEN Gender = 'female' then 'F' WHEN Gender = 'male' then 'M'
	ELSE GENDER END
	UPDATE athletes SET Gender=ISNULL(GENDER, 'M')

	--PERSONAL BEST
	SELECT CAST (PERSONALBEST AS decimal(10,2)) FROM athletes
	BEGIN TRANSACTION
	UPDATE athletes SET  PersonalBest = CAST(personalbest as decimal(10,2))
	commit
	

	--LATEST PERFORMANCE
	SELECT CAST(latestperformance/100.0 as float) from athletes
	begin transaction 
	update athletes
	set LatestPerformance = CAST(LatestPerformance/100.00 as float) from athletes

	--AGE
	ALTER TABLE athletes add age int 
	select DATEDIFF(year, DOB, GETDATE()) FROM athletes
	Update athletes set age = DATEDIFF(year, DOB, getdate())

	--days in a year =3695.25
	--average days in a month  = 30.42
	select CAST(floor(datediff(day, dob, getdate())/365.25) as varchar(20))+'year,'+
	 CAST(floor(datediff(day, dob, getdate())%365.25/30.42) as varchar(50))+'months and'+
	 CAST(floor(datediff(day, dob, getdate())%30.42) as varchar(20))+'Days old.' from athletes
 
	 --injuries
	 begin transaction 
	 update athletes set Injuries = 'Torn acl' where AthleteID=4
	 commit

	 begin transaction
	 update athletes set Injuries= 'Groin' where AthleteID=8
	 commit

	 begin transaction
	 update athletes set Injuries= 'African championship' where AthleteID=10
	 commit

	 begin transaction
	 update athletes set Injuries= ISNULL(injuries, 'NO-injuries')

	 --records
	 update athletes set Records= ISNULL(records, 'No-records')

	 select max(personalbest) from athletes

	 alter table athletes
	 drop column latestperformance

	 alter table athletes
	 add  latestperformnace2  decimal (10,2)

	alter table athletes
	add latestperformance1 int


	begin transaction
	update a
	set a.LatestPerformance1 = AC.latestperformance
	from athletes a
	join athletes_copy ac
	on a.AthleteID = aC.AthleteID

	commit

	select LatestPerformance
	into athletes
	from athletes_copy

	select cast(latestperformance1/100.0 as decimal(10,2))
	from athletes

	begin transaction
	update athletes
	set latestperformnace2 =cast(latestperformance1/100.0 as decimal(10,2))

	commit

	select *
	from athletes

	alter table athletes
	drop column latestperformance1

--temp tables
--local temp table

--create table #personaldetails(
--ID int,
--Name varchar,
--);
--select *from #personaldetails

--global temp tables
--create table ##publicdetails(
--id int,
--name varchar);
--select * from ##publicdetails