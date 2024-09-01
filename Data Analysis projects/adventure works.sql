use AdventureWorks2022
--How have sales evolved over different months or years Are there any noticeable seasonal trends
select * from sales.SalesOrderDetail
select * from sales.SalesOrderHeader

SELECT year (SOH.orderDate) as salesyear,
       month (SOH.orderDate) as salesmonth,
       sum(SOD.orderqty*SOD.Unitprice) as totalsales
from sales.SalesOrderDetail  SOD
join sales.SalesOrderHeader SOH
on SOH.salesorderID = SOD.SalesOrderID
group by year  (SOH.orderDate),
         month (SOH.orderDate)
order by totalsales desc;


--What are the highest and lowest sales months/years? Are there any factors that might explain these fluctuations?
with salespermonth as (
SELECT year (SOH.orderDate) as salesyear,
       month (SOH.orderDate) as salesmonth,
       sum(SOD.orderqty*SOD.Unitprice) as totalsalesAmount
from sales.SalesOrderDetail  SOD
join sales.SalesOrderHeader SOH
on SOH.salesorderID = SOD.SalesOrderID
group by year  (SOH.orderDate),
         month (SOH.orderDate)
)
select salesyear,
       salesmonth,
	   totalsalesAmount,
	   ROW_NUMBER()over(order by totalsalesAmount desc) as rankhigst,
	   ROW_NUMBER()over(order by totalsalesAmount asc) as ranklowest
from salespermonth
order by totalsalesAmount desc;

select * from sales.SalesOrderDetail

--correlation (Is there a correlation between sales and specific events or promotions)
with corr_coef as (
select avg (UnitPriceDiscount) as  averagediscount,
STDEV (UnitPriceDiscount) as STDEVdiscount,
AVG(linetotal) as averagesales,
STDEV(linetotal) as STdevsales
from sales.salesorderDetail
)

select sum ((unitpricediscount - averagediscount) * (linetotal - averagesales))/
(count(*)*stdevdiscount*Stdevsales) as correlation
from sales.salesorderDetail
cross join corr_coef
group by averagediscount, STDEVdiscount, averagesales,  STdevsales