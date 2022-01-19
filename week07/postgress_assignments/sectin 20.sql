--section 20
--when stmt
select companyname,country,
case when country in('Austria','Germany','Poland') then 'Europe'
	when country in ('mexico','USA','Canada') then 'North AAmerica'
	when country in ('Brazil','Venezuala','Argentina') then 'South America'
	else country
end as continent
from customers

--list of product name unit price range of unitprice

select productname,unitprice,
case when unitprice<10 then 'inexpensive'
	 when unitprice>10 and unitprice<=50 then 'mid-range'
	 when unitprice>50 then 'primium'
end as quality
from products

--give suppliers city nickname 
select companyname,city,
case city when 'New oeleans' then 'Big Easy'
		  when 'Paris' then 'City of Lights'
		  else 'Needs nickname'
end as nickname
from suppliers

--
select orderid,customerid,
case date_part('year',orderdate)
	when 1996 then 'year1'
	when 1997 then 'year2'
	when 1998 then 'year3'
end 
from orders

--coalesce
--it returns first non-nul value 
--return 'N/A' for region 
select customerid,coalesce(shipregion,'N/A')
from orders

--return list of supplier companyname and hoepage 
select companyname,coalesce(homepage,'Call to find')
from suppliers

--null if 
--used to return 2 values are equal
update suppliers
set homepage=' '
where homepage is null

--
select companyname,phone,
coalesce(homepage,'need to call')
from suppliers

--need confirmation list of customers return fax number
select companyname,
coalesce(fax,phone) as confirmation
from customers

