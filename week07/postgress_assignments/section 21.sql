--section 21
---date time and timestamp 
--inputting timestapm concatination of date and time 
show Datestyle

set Datestyle='ISO,DMY'

--inputting times
create table test_time(
startdate date,
startstamp timestamp,
starttime time)
--
insert into test_time (startdate, startstamp,starttime)
values ('epoch','infinity','allballs');

select * from test_time
--
insert into test_time (startdate, startstamp,starttime)
values ('-infinity','epoch','allballs');

select * from test_time
--
insert into test_time (startdate, startstamp)
values ('now','today')

select * from test_time

--time zones
select * from pg_timezone_names
select * from pg_timezone_abbrevs

--set time zone for session 
show time zone

set time zone 'US/Pacific'

select * from test_time

--interval data type
--add interval type to test_time
alter table test_time
add column span interval

delete from test_time

insert into test_time(span)
values('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS')

insert into test_time (span)
values ('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS ')

select span from test_time

--do 2 inputs 
insert into test_time (span)
values ('4 32:12:10')

insert into test_time (span)
values ('1-2')

select span from test_time

--ISO 8061 Format

INSERT INTO test_time (span)
VALUES ('P25-2-30T17:33:10')

set intervalstyle='postgres_verbose'
select * from test_time

set intervalstyle='sql_standard'
select * from test_time

set intervalstyle='iso_8601'
select * from test_time

set intervalstyle='postgres'
select * from test_time


--date arithmatic
select date '2018-09-28' +interval '5 days 1 hour'

select time '5:30:10' +interval '07 minutes 80 seconds'

select timestamp '1917-06-20 12:0:222' +interval '30 years 5 months 7 days 3hours 3 seconds'

--how many old employye
select  extract (year from age (birthdate)),firstname,lastname
from employees

--find the part of the ship date
select date_part('day',shippeddate)
from orders

--how many decades old each emloyee is
select extract(decade from age(birthdate)),firstname,lastname
from employees


--converting data type
select hiredate::timestamp
from employees

select cast (hiredate as timestamp)
from employees

--
select ceil(unitprice*quantity)::text ||'dollars spend'
from order_details

--
select cast ('2015-10-03 ' as  date),375::text


