Create database employee_management;
use employee_management;
create table employees(
employee_id int auto_increment primary key,
name varchar(100) not null,
department varchar (50),
salary decimal (10,2),
hire_date date,
create_at timestamp default current_timestamp
);
insert into employees(name,department,salary,hire_date) values
('Amit sharma','Finance',75000,'2020-06-15'),
('Rajesh gupta','IT',45000,'2018-04-10'),
('Priya iyer','HR',55000,'2021-03-20'),
('Ankit Rao','Sales',62000,'2019-11-01'),
('vikram singh','Finance',47000,'2020-01-25');
select * from employees;
create view high_salary_employees as
select employee_id, name,department,salary 
from employees
where salary > 50000;
select * from high_salary_employees;
select * from high_salary_employees where department ='Finance';
DELIMITER $$
create procedure getemployeesbydepartment(in dept_name varchar(50))
BEGIN
    select employee_id,name,salary
    from employees
    where department = dept_name;
End $$
DELIMITER ;
CALL employeesbydepartment('HR');
CALL getemployeesbydepartment('Finance');

DELIMITER $$
CREATE FUNCTION GETAVERAGESALARY()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    declare avg_salary decimal(10,2);
    select avg(salary) into avg_salary from employees;
    return avg_salary;
End$$
DELIMITER ;
select getaveragesalary() as average_salary;


create table employees_logs(
log_id int auto_increment primary key,
employee_id int,
log_message varchar(255),
create_at timestamp default current_timestamp
);
DELIMITER $$
CREATE trigger AFTER_EMPLOYEE_INSERT
aFTER INSERT ON employees
for each row
BEGIN
    insert into employee_logs(employee_id,log_message)
    values(new.employee_id, concat('New employee added:',new.name));
End$$
DELIMITER ;
insert into employees(name, department, salary, hire_date) values
('Sruthy','IT',60000,'2022-12-01');
select * from employees where employee_id = (SELECT employees where name ='sruthy');
insert into employees(name,department, salary, hire_date) values
('manisha singh','Finance',70000,'2023-01-15');
select * from employees;
create index idx_department on employees(department);
create index idx_salary on employees(salary);
Explain select * from employees where department ='Finance';

create table employees(
employee_id int auto_increment primary key,
name varchar(100) not null,
department varchar (50),
salary decimal (10,2),
hire_date date,
create_at timestamp default current_timestamp
);



