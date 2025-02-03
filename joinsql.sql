-- SQL JOINS

create database sqljoins;
use sqljoins;
create table employees(
Emp_ID int,
Name varchar(50),
DepartmentID int,
Salary int);

insert into employees(Emp_ID,Name,DepartmentID,salary) Values 
(1,'Ramesh',101,100000),
(2,'Daya',102,200000),
(3,'Varun',103,300000),
(4,'Kaushik',104,350000),
(5,'Vamshi',105,300000);

select * from employees;

create table Department(
DepID int,
DepName Varchar(50));

insert into Department(DepID,DepName) values
(102,"Admin"),
(101,"HR"),
(104,"Sales");

-- inner join 

select Emp.Name,emp.salary,D.DepName from employees Emp
inner join Department D on Emp.DepartmentID=D.DepID;

select * from Employees;
select * from Department;

select Emp.NAme,Emp.Salary,D.DepNAme
from Employees Emp
left join Department D
on Emp.DepartmentID=D.DepID;

select Emp.NAme,Emp.Salary,D.DepNAme
from Employees Emp
right join Department D
on Emp.DepartmentID=D.DepID;