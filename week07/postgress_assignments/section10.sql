--section 10
--union 
--get list of all customers and supplier company name
SELECT companyname
FROM customers
UNION 
SELECT companyname
FROM suppliers

--union all
--remove duplicates
--all customers and suppliers with one record fro each copany city
SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers

--distinct countries of all customer and supplier in alpha order
select country
from customers
union 
select country
from suppliers
order by country desc

--list of all countries of suppliers and customers with record fro each one
select country
from customers
union all
select country
from suppliers
order by country desc

--intersect(removes duplicates)
select country
from customers
intersect
select country 
from suppliers

--find the number of customers and suppliers pairs from same country
select count(*)from
(select country
from customers
intersect all
select country 
from suppliers) as supplier

--distinct cities that we have supplier and customers located in 
select city
from customers
intersect
select city 
from suppliers

--count number of customers and supplier pairs from same city
select count(*)from
(select city
from customers
intersect
select city 
from suppliers) as same_city

--Except
--find all countries that we customers but not in suppliers 
select country from customers
except
select country from suppliers

--number of customers thwt in county wthut suppliers
select count(*) from
(select country from customers
except all
select country from suppliers) as lonely_customer

--cities we have suppliers with no customer
select city from suppliers 
except 
select city from customers 

--customers in cities without supplirs
select count(*)from
(select city from customers 
except all
select city from suppliers) as lonely_customers








