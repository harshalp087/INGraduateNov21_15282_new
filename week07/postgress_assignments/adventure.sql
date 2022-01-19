-- SELECT name,weight,productnumber
-- FROM production.product
-- ORDER BY weight ASC;

-- SELECT *
-- FROM purchasing.productvendor
-- WHERE productid=407
-- ORDER BY averageleadtime ASC;

-- select *
-- from sales.salesorderdetail
-- where productid=799 
-- order by orderqty desc

-- select max(discountpct)
-- from sales.specialoffer

-- select min(sickleavehours)
-- from humanresources.employee;

-- select avg(rate)
-- from humanresources.employeepayhistory;

-- select avg(standardcost)
-- from production.productcosthistory
-- where productid=738

-- select sum(scrappedqty)
-- from production.workorder
-- where productid=529

-- select name
-- from purchasing.vendor
-- where name like 'G%'

-- select name
-- from purchasing.vendor
-- where name like '%Bike%'

-- select firstname 
-- from person.person
-- where firstname like '_t%'

-- select *  
-- from person.emailaddress
-- limit 20

-- select * 
-- from production.productcategory
-- limit 2

-- select count(*) 
-- from production.product
-- where weight is null

-- select count(*)
-- from person.person
-- where additionalcontactinfo is not null


