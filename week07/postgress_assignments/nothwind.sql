-- SELECT DISTINCT COUNTRY,CITY
-- FROM SUPPLIERS
-- ORDER BY COUNTRY ASC,
-- CITY DESC

-- select productname,unitprice
-- from products
-- order by unitprice DESC, productname ASC 

--Min Max function
-- select min(orderdate)
-- from orders
-- where shipcountry='Italy'

-- select max(orderdate)
-- from orders 
-- where shipcountry='Canada'

-- select max(shippeddate-orderdate)
-- from orders
-- where shipcountry='France'

--Avg function 
-- select avg(freight)
-- from orders
-- where shipcountry='Brazil'

-- select sum(quantity)
-- from order_details
-- where productid=14

-- select avg(quantity)
-- from order_details
-- where productid=35

--LIKE to match patterns
-- select companyname,contactname
-- from customers
-- where contactname like 'D%'

-- select companyname
-- from suppliers
-- where companyname like '_or%'

-- select companyname
-- from customers
-- where companyname like '%er'

--renaming columns
-- select unitprice*unitsinstock as TotalInventory
-- from products
-- order by TotalInventory desc

--Limit to control number 
-- select productid,unitprice*quantity as Totalcost
-- from order_details 
-- order by totalcost desc
-- limit 3

-- select productname,unitprice*unitsinstock as Totalinventory
-- from products
-- order by Totalinventory asc
-- limit 2

--null value
-- select count(*)
-- from customers
-- where region is null

-- select count(*)
-- from suppliers
-- where region is not null

-- select count(*)
-- from orders
-- where shipregion is null


SELECT name,weight,productnumber
FROM production.product
ORDER BY weight ASC;














