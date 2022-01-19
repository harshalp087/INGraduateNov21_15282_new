--section 19
--create view 
--create view called customer_order

create view customer_order_details as
select companyname,orders.customerid,employeeid,shippeddate,
shipvia ,freight,shipname,shipcity,shipregion,shippostalcode,
shipcountry,order_details.*
from customers 
join orders on customers.customerid=orders.customerid
join order_details on orders.orderid=order_details.orderid

select * 
from customer_order_details
where customerid='TOMSP'

--create view called supplier_order
create view supplier_order_details as
select companyname,suppliers.supplierid,products.productid,
productname,order_details.unitprice,quantity,discount,orders.*
from suppliers
join products on suppliers.supplierid=products.supplierid
join order_details on order_details.productid=products.productid
join orders on order_details.orderid=orders.orderid


select *
from supplier_order_details
where supplierid=5

--how to modify views
--add contactname to customer_order_details

CREATE OR REPLACE VIEW customer_order_details AS
SELECT companyname, Orders.customerid,employeeid,shippeddate,
Shipvia,freight,shipname,shipcity,shipregion,shippostalcode,shipcountry,
order_details.*,contactname
FROM customers
JOIN orders on customers.customerid=orders.customerid
JOIN order_details on order_details.orderid=orders.orderid;

select * from customer_order_details
where customerid='TOMSP'

--
CREATE OR REPLACE VIEW supplier_order_details AS
SELECT companyname,suppliers.supplierid,
Products.productid,productname,
Order_details.unitprice,quantity,discount,
orders.*,phone
FROM suppliers
JOIN products ON suppliers.supplierid=products.supplierid
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON order_details.orderid=orders.orderid;


select * from supplier_order_details
where supplierid=5

--alter view
alter view customer_order_details
rename to customer_order_detail


alter view supplier_order_details
rename to supplier_order_detail

--create view 
create view north_america_customers as
select * 
from customers
where country in ('USA','Canada','Mexico')

--
insert into north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
values ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','USA','555-555-5555',null);

select * from north_america_customers
where customerid='CFDCM'

update north_america_customers
set fax='555-333-4444'
where customerid='CFDCM'

--create view for dairy products

create view protien_products as
select * from products
where categoryid  in (4,6,8)

select * from protien_products  

insert into protien_products
(productid,productname,supplierid,categoryid,discontinued)
values (78,'Kobe Beef',12,8,0)

update  protien_products
set unitprice=55
where productid=78

delete from protien_products
where productid=78




delete from protien_products
where productid=78

--drop view 
drop view if exists customer_order_detail
--drop supplier_order
drop view if exists supplier_order