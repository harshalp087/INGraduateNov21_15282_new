--section 13
--index--create lookup structure ordered on flields in h eindex
--unique index --same ordering but adds a check that prevents
--duplicattes to be entered

--cerate index
--emloyeeid should be unique
create unique index idx_employees_emloyeeid
on employees(employeeid)

--ordres create single index 2 fields custid and irderid
create unique index idx_employees_emloyeeid
on orders(customerid,orderid)

--drop index
drop index idx_employees_emloyeeid
drop index idx_orders_customerid_orderid

--kill runway queries 
drop table if exists performance_test
create table performance_test(
id serial,
lacation text)

insert into performance_test(lacation)
select 'Katmandu,Nepal' from generate_series(1,5000000000)

--above query took much time to execute 
--to stop the excution achek the status of query
--and stpos the execution of query 
select * from pg_stat_activity where state='active'

--polite way to stop
select pg_cancel_backend(20448)

--query planner 
drop table if exists performance_test;

create table performance_test (
  id serial,
  location text
);

insert into performance_test (location)
select md5(random()::text) FROM generate_series(1,10000000)

--Total query runtime: 325 msec.
SELECT COUNT(*) FROM performance_test;

--Total query runtime: 883 msec
SELECT * FROM performance_test
WHERE id = 2000000;

--sequential scan
EXPLAIN SELECT COUNT(*) FROM performance_test;

EXPLAIN SELECT * FROM performance_test
WHERE id = 2000000;

CREATE INDEX idx_performance_test_id ON performance_test (id);



drop table if exists performance_test

create table performance_test(
id serial,
lacation text)

insert into performance_test(lacation)
select md5(random()::text) FROM generate_series(1,10000000)


explain analyze select * from performance_test
where id=200000

-- ANALYZE emits progress messages to indicate which table is currently being processed
analyze performance_test

--plan cost calculated
set max_parallel_workers_per_gather=0

explain select *
from performance_test
where lacation like 'ab%'

--2 costs
--i/o costs -reading and writing 
--cpu costs -processing data

select pg_relation_size('performance_test'),
pg_size_pretty(pg_relation_size('performance_test'))

--find relation pages
select relpages 
from pg_class
where relname='performance_test'

--equal to size divided by 8192
select relpages,pg_relation_size('performance_test')/8192
from pg_class
where relname='performance_test'

--find cost 
show seq_page_cost

--total predicted i/o costs

from pg_class
where relname='perfomance_test'

--find cpu cost
show cpu_tuple_cost

show cpu_operator_cost

--max parallization 
set max_parallel_workers_per_gather=2

explain select *
from performance_test
where lacation like 'ab%'

--additional cost
show parallel_setup_cost

show parallel_tuple_cost

--secion 13 71
--create column
alter table performance_test
add column name text

update performance_test
set name=md5(lacation)

explain analyze select *
from performance_test
where lacation like 'df%' 

--create index on both columns
create index idc_performance_test_lacation_name
on performance_test(lacation,name);

explain analyze select *
from performance_test
where lacation like 'df%'

explain analyze select *
from performance_test
where name like 'cf%'

--section 13 72
--adventureworks
--epression indexes 
explain select *
from production.product
where upper(name) like 'Flat'

create index idx_product_upper_name
on production.product(upper(name))

--concatinate fields 
create index idx_person_fullname
on person.person((firstname|| ' '||lastname))

explain select *
from person.person
where firstname || ' ' || lastname='Terri Duffy'

--hash if you only use equals 

--only handle equal oerator(=)

--GIN Generalized inverted index 
--DATA types that have multi coumns
--(array,range types,jsonb,Hatore=key/value pairs)
--nothwind
--speeding up next macting 
create extension pg_trgn

create index trgn_idx_performance_test_lacation
on performance_test using gin(lacation gin_trgn_ops)

create index idx_performance_test_name
on performance_test(name)

explain analyze select lacation 
from performance_test
where name like 'dfe%'

explain analyze select lacation 
from performance_test
where lacation  like 'dfe%'



 






