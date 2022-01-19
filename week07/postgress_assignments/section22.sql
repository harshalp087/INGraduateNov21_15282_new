--section 22
--windows function
--find out prices in a category compared to average for category
select categoryname,productname,unitprice,
avg(unitprice) over (partition by categoryname)
from products
join categories on categories.categoryid=products.categoryid
order by categoryname,unitprice desc

--strange orders of the product 'Alice mutton'
--find all records of order_details
select productname,quantity,
avg(quantity) over (partition by order_details.productid)
from products
join order_details on order_details.productid=products.productid
where productname='ALice Mutton'
order by quantity desc

--compare each product order quantity commpare to avg(order)
select productname,orderid,quantity,
avg(quantity) over (partition by order_details.productid)
from products
join order_details on products.productid=order_details.productid
order by quantity desc

--using windows function with subqueries
select companyname,orders.orderid,amount,average_order
from
(select companyname,orders.orderid,amount,avg(amount) over(partition by categoryname) as average_order
from
(select companyname,orders.orderid,sum(unitprice*quantity) as amount 
from customers
join orders on orders.customerid=customers.customerid
join order_details on orders.orderid=order_details.orderid
group by companyname,orders.orderid)as order_amounts) as order_average
where amount>average_order*5


--find dsupliers that have 3 times normal quantity of orders of all products

SELECT companyname,month,year,total_orders,average_monthly
FROM (
SELECT companyname,total_orders,month,year,
AVG(total_orders) OVER (PARTITION BY companyname) as average_monthly
FROM (
SELECT companyname,SUM(quantity) as total_orders,date_part('month',orderdate) as month,date_part('year',orderdate) as year
FROM order_details
JOIN products ON order_details.productid = products.productid
JOIN suppliers ON suppliers.supplierid=products.supplierid
JOIN orders ON orders.orderid=order_details.orderid
GROUP BY companyname,month,year)  as order_by_month) as average_monthly
WHERE total_orders > 3 * average_monthly

--using rank 
--top 2 results
select * from
(select orders.orderid,productid,unitprice,quantity,
rank() 
over (partition by order_details.orderid 
	  order by (quantity*unitprice) desc) as rank_amount
from orders
natural join order_details) as ranked
where rank_amount<=2
 
 
--find 3 least expensive products from ach supplier
select companyname,productname,unitprice from
(select companyname,productname,unitprice,
rank() over (partition by products.supplierid order by unitprice ASC) AS price_rank
from suppliers
natural join products) as ranked_products
where price_rank <=3;






