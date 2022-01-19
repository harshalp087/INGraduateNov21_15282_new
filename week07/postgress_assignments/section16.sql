--section 16
--table contraints
--no null constraints
--frop practices ad 2 columns in it
DROP TABLE Practices

CREATE TABLE practices(
	practiceid integer NOT NULL,
	practice_field varchar(50) NOT NULL
)

--add not null constraint to products table 
alter table products
alter unitprice set not null 

--add not null to lastname field in employees table 
alter table employees
alter lastname set not null

--unique constraints
drop table Practices

CREATE TABLE practices(
	practiceid integer UNIQUE,
	practicefield varchar(50) NOT NULL
)

--create tale pets with 2 fields
drop table pets

create table pets(
	petid integer unique,
	name varchar(50) not null
)

--to regiondescription field in region table 
alter table region 
add constraint regoindescription_region unique (regiondescription)

--make comapyname of shippers as unique 
alter table shippers
add constraint companyname_shippers unique(companyname)

--primary key
drop table practices

create table practices(
	practiceid integer primary key,
	fieldname varchar(50) not null
)

insert into practices(practiceid,fieldname)
values(2,'red ')

--drop old table pets 

drop table pets

create table pets(
	petid integer primary key,
	name varchar(50) not null
)

alter table practices
drop constraint practices_pkey

alter table practices
add primary key(practiceid)

--drop primary key pets 
alter table pets
drop constraint pets_pkey

alter table pets
add primary key(petid)

--foreign key 
drop table practices

create table practices(
	practiceid integer primary key,
	practicefield varchar(50) not null,
	employeeid integer not null,
	foreign key (employeeid) references employees(employeeid)
)

--add 3 fields in pets with foreing key
drop table pets




--add forieng key to exising table 
drop table practices 

create table practices(
	practiceid integer primary key,
	practicefield varchar(50) not null,
	employeeid integer not null,
	foreign key (employeeid) references employees(employeeid)
)

alter table practices
drop constraint practices_employeeid_fkey


 --drop foreignkey fro customerid in pets
 drop table pets
 
 create table pets(
	petid integer primary key,
	name varchar(25) not null,
	customerid char(5) not null,
	foreign key (customerid) references customers(customerid)
)

alter table pets
drop constraint pets_customerid_fkey

alter table pets 
add constraint pets_customerid_fkey
foreign key(customerid) references customers(customerid)

--check constraint
drop table practices 

create table practices(
	practiceid integer primary key,
	practicefield varchar(50) not null,
	employeeid integer not null,
	cost integer constraint practices_cost check(cost>=0 and cost<=1000), 
	foreign key (employeeid) references employees(employeeid)
)

--voialated check constraint 
insert into practices(practiceid,practicefield,employeeid,cost)
values(1,'some',1,500)

insert into practices(practiceid,practicefield,employeeid,cost)
values(1,'some',1,500)

--set check constraint to pets table 
drop table pets
 
create table pets(
	petid integer primary key,
	name varchar(25) not null,
	customerid char(5) not null,
	 weight integer constraint pets_weight check(weight>0 and weight<200),
	foreign key (customerid) references customers(customerid)
)

--to order table that freight must be mpre tahn 0
alter table orders
add constraint orders_freight check(freight>0)

--add check constrsint to producs 
alter table products
add constraint products_unitprice check(unitprice>0)

--default constraint
drop table practices 

create table practices(
	practiceid integer primary key,
	practicefield varchar(50) not null,
	employeeid integer not null,
	cost integer default 50 constraint practices_cost check(cost>=0 and cost<=1000), 
	foreign key (employeeid) references employees(employeeid)
)

--petss table
 drop table pets
 
create table pets(
	petid integer primary key,
	name varchar(25) not null,
	customerid char(5) not null,
	weight integer default 5 constraint pets_weight check(weight>0 and weight<200),
	foreign key (customerid) references customers(customerid)
)

--to orders table shipvia defults to 1
alter table orders 
alter column shipvia set default 1

--o orders reorderlevel to 5
alter table products 
alter column reorderlevel set default 5

--changing column default values 
--drop reorderlevel from products
alter table products 
alter column reorderlevel drop default

--make suppliers homepage default of NA
alter table suppliers
alter column homepage set default  'N/A'
--remove homepage default from suppliers 
alter table suppliers
alter column homepage drop default

--addin gand removing column constraints 
alter table products 
add check (reorderlevel >= 0)

update products 
set reorderlevel=0
where reorderlevel is null or reorderlevel<0

--alter table name column name 
alter table products
alter column discontinued set not null

--drop recordlevel constraint 
alter table products
drop constraint products_recordlevel_check

alter table products
alter column discontinued drop not null

--add check constrint to unto price as>0
alter table order_details
add check(unitprice>0)

--add not null constaint to discount column
alter table order_details
alter column discount set not null

--remove constriants
alter table order_details
drop constraint order_details_unitprice_check


  


