--section 15
--create table 
create table subscribers(
firstname varchar(200),
lastname varchar(200),
email varchar(250),
signupdate timestamp,
frequency integer,
iscustomer boolean
)

create table returns(
returnid serial,
customerid char(5),
datereturned timestamp,
quantity smallint,
orderid integer	
)

--Alter table 
alter table subscribers 
rename firstname to first_name

--rename returndate to return_date
alter table returns 
rename datereturned to return_date

--alter table name
alter table subscribers
rename to email_subscribers

alter table returns 
rename to bad_orders

--add table 
alter table email_subscribers 
add column last_visit_date timestamp

--add field in bad_orders
alter table bad_orders
add column reson text

--bad orders table remove reasin field
alter table bad_orders 
drop column reson

--resize email_subscribers table 
alter table email_subscribers
alter column email set data type varchar(225)

--bad _orders table change  
alter table bad_orders
alter column quantity set data type int

--drop table 
drop table email_subscribers

drop table bad_orders
