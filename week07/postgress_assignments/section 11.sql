--section 11
--subquery using exists
select companyname
from customers 
where exists(select customerid from orders
			where orders.customerid=customers.customerid and 
			orderdate between '1997-04-01' and '1997-04-30') 

--find customers who didnt have an order in april 1997
select companyname
from customers 
where not exists(select customerid from orders
			where orders.customerid=customers.customerid and 
			orderdate between '1997-04-01' and '1997-04-30') 

--what product didnt have an order in april 1997
select productname
from products
where not exists(select productid from order_details
				join orders on orders.orderid=order_details.orderid
				where order_details.productid=products.productid and
				orderdate between '1997=04-01' and '1997-04-30' )

--find all suppliers wicth a product that costs more tahn 200
select companyname
from suppliers 
where exists(select productid from products
			where products.supplierid=suppliers.supplierid 
			and unitprice>200)
			
--find suppliers that dont have an order in december 1996

select companyname
from suppliers
where  not exists (select products.productid from products
                  join order_details on products.productid=order_details.productid
                  join orders on order_details.orderid=orders.orderid
             	  where suppliers.supplierid=products.supplierid and
                  orderdate between '1996-12-01' and '1996-12-31' );

--subquery using any and all
--order details with more than 50 items in single product
select companyname
from customers
where customerid = any (select customerid from orders
					   join order_details on orders.orderid=order_details.orderid
					   where quantity>50)
					   
--suppliers that have an order with1 item
select companyname
from suppliers
where supplierid=any (select products.supplierid from order_details
					 join products on products.productid=order_details.productid
					 where quantity=1)
					 
--which had order amounts that were higher than average of all products
select productname
from products
join order_details on products.productid=order_details.productid
where order_details.unitprice*quantity>all
		(select avg(order_details.unitprice*quantity)
		from order_details
		group by productid)
		
--find all distinct ustomers that orered more in one item 
--than the average order amount per item of all customers
select distinct companyname
from customers 
join orders on orders.customerid=customers.customerid
join order_details on orders.orderid=order_details.orderid
where order_details.unitprice*quantity>all
	(select avg(order_details.unitprice*quantity)
	from order_details
	join orders on orders.orderid=order_details.orderid
	group by orders.customerid)
	
--using in query 
--that in same countries as suppliers
select companyname
from customers 
where country in (select country from suppliers)

--find suppliers that are in same sity as a customer 
select companyname
from suppliers 
where city in (select city from customers)
