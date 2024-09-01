create database Elysian

use Elysian;

CREATE TABLE Elysian (
CustomerID VARCHAR(20),
SalesID	VARCHAR(20),
ProductName VARCHAR(20),
Sentiment VARCHAR(20),
Category VARCHAR(20),
UserType VARCHAR(20),
Gender	VARCHAR(20),
Age	INT,
Price DECIMAL(10, 4),
CostPrice DECIMAL(10,4),
Quantity	INT,
PaymentMethod VARCHAR(20),
City VARCHAR(20),
Country	VARCHAR(20),
BottleSize VARCHAR(15),
Discount DECIMAL(10,4),
PurchaseDate VARCHAR(20),
Rating	VARCHAR(20),
OilContentPercentage VARCHAR(20)
)



BULK INSERT Elysian
FROM 'C:\Users\user\Documents\messy_dataset.csv' --specify the path of where your messy data is, remove mine and put yours
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
	FIRSTROW = 2 --skip the first row header
);


--HOW TO BACKUP YOUR DATABASE
-- example;
BACKUP DATABASE Elysian
TO Disk = 'C:\Backups\Elysian.bak';--Specify the filepath you would want to backup to and use .bak as file format

--A
select * from messy_dataset;
select * from Elysian
--B
select * into Elysian_copy from Elysian

--C
select trim(productname) from Elysian
update Elysian set ProductName = trim(productname)

--D
select distinct sentiment from Elysian
update Elysian set Sentiment = 'Neutral' where Sentiment = 'ambivalent'

--E
select distinct usertype from Elysian
update Elysian set UserType ='MEN' where UserType= 'man'
update Elysian set UserType ='women' where UserType= 'woman'
update Elysian set UserType ='unisex' where UserType= 'uni'

--F
select distinct gender from Elysian
update Elysian set Gender = 'F' where Gender = 'f'
update Elysian set Gender = 'F' where Gender = 'fenale'
update Elysian set Gender = 'F' where Gender = 'female'
update Elysian set Gender = 'M' where Gender = 'm'
update Elysian set Gender = 'M' where Gender = 'male'

--G
select avg(age) from Elysian
update Elysian set age =(select avg(age) from Elysian) where age ='150'
select distinct age from Elysian

--H
select count (*) from Elysian
where Quantity is null
select avg(quantity) from Elysian
update Elysian set Quantity=(select avg(Quantity) from Elysian) where Quantity is null
select distinct quantity from Elysian

--I
update Elysian set Country = (select max(country) from (select city, max(country) 
as country from Elysian
group by 
where max_country.City=elysian.city)
where country is null

--J
update Elysian
set purchase_date = case
when isdate(purchase_date) = 1 then cast(purchase_date AS DATE) else '2019-09-22'
end;

--K
update Elysian
set Rating =case Rating when 2022 then 2 when 2021 then 1 when 10 then 1 when 12 then 2 else Rating
end;

--L
update Elysian
set Oil_Content_Percentage = replace(Oil_Content_Percentage, '%', '');

--M
update Elysian
SET discount = isnull(discount, 0);
