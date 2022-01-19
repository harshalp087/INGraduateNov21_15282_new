--section 17
--crate sequence
create sequence test_sequence

select nextval('test_sequence')

select currval('test_sequence')

select lastval()

--set value ut next value will increament
select setval('test_sequence',14)

select nextval('test_sequence')

--create sequence if not exists
create sequence if not exists test_sequence_2 increment 5

select nextval('test_sequence_2')

--create sequence if not exists
create sequence if not exists test_sequence_3
increment 50
minvalue 350
maxvalue 5000
start with 550

select nextval('test_sequence_3')

--create test_sequence_4 
create sequence if not exists test_sequence_4
increment 7 start  with 33

select nextval('test_sequence_4')

--create sequence name
select max(employeeid) from employees

create sequence if not exists employees_employeeid_seq
start with 10 owned by employees.employeeid

--null value in column "employeeid" of relation "employees" 
--violates not-null constraint
insert into employees
(lastname,firstname,title,reportsto)
values('Smith','Bob','Assistant',2)

alter table employees 
alter column employeeid set default nextval('employees_employeeid_seq') 

--create sequence and attach to orders field
select max(orderid) from orders

create sequence if not exists orders_orderid_seq start with 11070

alter table orders
alter column orderid set default nextval('orders_orderid_seq')

insert into orders(customerid,employeeid,requireddate,shippeddate)
values('VINET',5,'1996-08-01','1996-08-06') returning orderid


--alter and delete sequences
--set emp seq start with 1000

alter sequence employees_employeeid_seq restart with 1000
select nextval('employees_employeeid_seq')

--set order_orderid_seq with 200000
alter sequence orders_orderid_seq restart with 200000
select nextval('orders_orderid_seq')

--change name of sequence 
alter sequence test_sequence rename to test_sequence_1

--rename test_sequence _4
alter sequence test_sequence_4 rename to test_sequence_four

--remove sequence_1
drop sequence test_sequence_1
--remove sequence_four
drop sequence test_sequence_four

--using serial datatypes
--create table with 2 fields and make one as a serial
drop table if exists exes

create table exes(
	exid serial,
	name varchar(255)
)

insert into exes (name) values('Canada') returning exid

--create table pets 
drop table pets

create table pets(
	petid serial,
	name varchar(255)
)

insert into pets (name) values('Fluffy') returning petid

insert into pets (name) values('Gluffy') returning petid

