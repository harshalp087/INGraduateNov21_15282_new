--section 23
--compoite types
create type address as(
	street_address varchar(50),
	street_address2 varchar(50),
	city varchar(50),
	state_regin varchar(50),
	country varchar(50),
	posatlcade varchar(15)
)

--add composite type to table 
create table friends(
	first_name varchar(50),
	last_name varchar(50),
	address address
)


select array[2,3,4] = array[2,3,4] as compare
--remove composite type from table
drop type address cascade

drop table friends

--full name composite type recreate address type 
--add to bothe new tables
---full name composite type
create type fullname as(
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50)
)

--address composite type
create type address as(
	street_address varchar(50),
	street_address2 varchar(50),
	city varchar(50),
	state_regin varchar(50),
	country varchar(50),
	posatlcade varchar(15)
)

create table friends(
	name fullname,
	address address
)

--drop both types and friends table 
drop type address cascade
drop type fullname cascade

drop table friends

--using composite types 
--firends with some additional fields
create type fullname as(
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50)
)

create type address as(
	street_address varchar(50),
	street_address2 varchar(50),
	city varchar(50),
	state_regin varchar(50),
	country varchar(50),
	posatlcade varchar(15)
)
create type dates_to_remember as (
 	birthdate date,
	 age integer,
	 aniversary date
 )
create table friends(
	name fullname,
	address address,
	dates_to_remember dates_to_remember
)

--
insert into friends (name,address,dates_to_remember)
values (row('Boyd','M','Gregory'),row('7777','','Boise','Idaho','USA','99999'),row('1969-02-01',49,'2001-07-15'));

select * from friends;

select name from friends;

select(address).city,(dates_to_remember).birthdate
from friends

--
select name from friends
where(name).first_name='Boyd'

--
select (address).state_regin,(name).middle_name,(dates_to_remember).age 
from friends
where (name).last_name='Gregory'

