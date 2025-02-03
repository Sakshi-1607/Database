-- indexing in Database --

create database Demo;
use Demo;
create table IndexingDB(
EmpID int auto_increment primary key,
Name varchar(100),
DepID int,
joining date,
salary int);

insert into IndexingDB(Name,DepID,joining,salary) values
('Ramesh',101,'2024-09-07',50000),
('Daya',102,'2020-05-01',60000),
('Kaushik',103,'2015-4-17',55000),
('Ankit',104,'2000-05-13',65000),
('Varun',101,'2024-09-07',50000),
('sampath',102,'2020-05-01',60000),
('Aadil',103,'2015-04-17',55000),
('Deepak',104,'2000-05-13',65000),
('Sakshi',101,'2020-5-01',60000),
('fareesha',102,'2020-05-01',60000),
('Afsha',103,'2015-04-17',55000),
('Sadvika',104,'2000-05-13',65000);

select * from IndexingDB;
create index idx_emp on IndexingDB(joining);
show index from indexingDB;

-- multi-column index
create index emp_salary_date on IndexingDB(salary,joining);
select * from indexingDB
where salary>60000 and joining>25-01-01;

-- clustered index for range indexingdb
select EmpID,NAme,DepID,joining,salary
from IndexingDB
where joining >='2024-01-01'
order by joining;

use demo;
create table webpage(
id int auto_increment primary key,
Name varchar(100),
age int,
mobile varchar(12),
Address text);


