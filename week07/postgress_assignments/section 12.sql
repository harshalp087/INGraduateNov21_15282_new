--section 12

select * from orders
where employeeid=5

INSERT INTO orders
(orderid,customerid, employeeid, orderdate, requireddate, shipvia,
 freight, shipname, shipaddress, shipcity, shippostalcode,shipcountry)
VALUES (11078,'VINET', 4, '2017-09-16','2017-09-30',3,
        42.5, 'Vins et alcools Chevalier',
        '59 rue de l''Abbaye','Reims','51100','France');
		
SELECT MAX(orderid)
FROM orders;

--insert an order details fro order we created.make it an quantity of 20
--of queso cabraleswith price of $14
select *
from products
where productname like 'Queso'

insert into order_details
(orderid, productid, unitprice,quantity,discount)
values(11078,11,14,20,0)

--update
--2017-09-20(10 days earlier) and shiping cost will increase to $50
update orders 
set requireddate='2017-09-20',freight=50
where orderid=11078

--40 Queso cabrales instead of 20 and we giing discount of 0.5
update order_Details
set quantity=40,discount=0.5
where orderid=11078 and productid=11

--delete
--cancel order so let first delete the order_detail 
delete from order_details
where orderid=11078 and productid=11

--delete order fro the customerusing order id
delete from orders
where orderid=11078

--select into 
--backup all our suppliers in north america
select *
into suppliers_northamerica
from suppliers
where country in ('USA','Canada')

--backup orders in the 1997 to new table orders 1997
select *
from orders
where orderdate between '1997-12-01' and '1997-12-31'

--returning data from update,delete and insert
--insert new employee returing the employeeid
insert into employees
(firstname,lastname,title,employeeid,reportsto)
values('Bob','Smith','Mr Big',50,2)
returning employeeid

--insert into table(who use orderid=500) an return orderid
insert into orders
(customerid,employeeid,requireddate,shippeddate,orderid)
values('VINET',5,'1996-08-01','1996-08-10',500)
returning orderid

--increase the unit price of chai(productid=1) by 20%
--and retrn new price of product id
update products
set unitprice=unitprice*1.2
where productid=1
returning productid,unitprice as new_price

--update order details fro orderid 10248 and prosuctid 11 
--to the double quantity orderd and retur new quantity
update order_details
set quantity=quantity*2
where orderid=10248 and productid=11
returning quantity as new_quantity

---delete employee (employeeid=50) ad return all rows
delete from employees
where employeeid=50
returning *

--delete orderid=500 return all fields
delete from orders
where orderid=500
returning *












