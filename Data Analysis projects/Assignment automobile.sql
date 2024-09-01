create database assignment;

use assignment;

-- question 1 (retrieve all records from the table)
select * from automobile_data

-- question 2 (display the unique of the "make" column)
select distinct make from automobile_data

-- question 3 (find the average horsepower for all automobiles)
select AVG (horsepower) as average_horsepower from automobile_data;

-- question 4 (count the number of automobiles for each fuel_type)
select fuel_type, COUNT(*) as countedAutomobiles from automobile_data
group by fuel_type;

-- question 5 (retreive the details of automobiles with the "city_mpg" greater than 30)
select * from automobile_data where city_mpg > 30

-- question 6 (Calculate the average, minimum, and maximum "price" of automobiles for each "num_of_doors.")
select num_of_doors,
               AVG(price) as average_price,
			   MIN(price) as minimum_price,
			   MAX(price) as maximum_price from automobile_data group by num_of_doors;

-- question 7 (Display the "make" of automobiles with the highest "horsepower" for each "make")
with HighestHorsepower as (
select make, max (horsepower) as HighestHorsepower from automobile_data  group by make)
select make, HighestHorsepower as horsepower from HighestHorsepower

--question 8 (Find the top 5 automobiles with the highest "highway_mpg" and their respective "make")
select top 5 make, highway_mpg from automobile_data
order by highway_mpg desc;

-- question 9 (Calculate the average "price" of automobiles with a "compression_ratio" greater than 10)
select AVG(price) as averge_price from automobile_data
where compression_ratio > 10;

--question 10 (Retrieve the "make," and "fuel_type" of automobiles with "horsepower" between 150 and 200 and "city_mpg" greater than 20)
select  make, fuel_type from automobile_data 
where horsepower between 150 and 200 and city_mpg > 20
