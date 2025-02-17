create database query;
use query;
CREATE TABLE Employee (
  ID int primary key AUTO_INCREMENT,
  Name Varchar(100),
  Department varchar(100),
  Salary int,
  Age int
);
 
INSERT INTO Employee (Name, Department, Salary, Age) VALUES
('John Doe', 'IT', 60000, 29),
('Jane Smith', 'HR', 55000, 34),
('Emily Davis', 'IT', 62000, 31),
('Michael Brown', 'Sales', 52000, 45),
('Sarah Johnson', 'HR', 58000, 28),
('William Clark', 'IT', 63000, 30),
('Nancy Wilson', 'Finance', 59000, 42),
('Joseph Walker', 'IT', 61000, 33),
('Betty Martinez', 'Marketing', 65000, 39),
('Robert Johnson', 'IT', 60000, 32),
('Karen White', 'HR', 57000, 41),
('Daniel Moore', 'IT', 62500, 36),
('Patricia Taylor', 'Sales', 53500, 47),
('Paul Thomas', 'Finance', 61500, 50),
('Lisa White', 'Marketing', 64000, 29),
('Charles Miller', 'IT', 63000, 27),
('James Davis', 'HR', 56000, 44),
('George Wilson', 'IT', 62000, 34),
('Sandra Lee', 'Finance', 60000, 37),
('Edward Harris', 'IT', 61000, 38),
('Mary Clark', 'HR', 58000, 31),
('Steven Robinson', 'Sales', 54000, 35),
('Amy Martinez', 'Marketing', 65000, 40),
('Kevin Johnson', 'IT', 60000, 29),
('Angela Taylor', 'HR', 57000, 34),
('Brian Anderson', 'Finance', 59500, 41),
('Elizabeth Harris', 'IT', 63000, 30),
('Ronald Lee', 'Sales', 52000, 32),
('Laura White', 'HR', 56000, 33),
('Gregory Thomas', 'IT', 61000, 34),
('Dorothy Clark', 'Marketing', 64000, 36),
('Frank Lewis', 'Sales', 53000, 35),
('Barbara Martinez', 'Finance', 59000, 45),
('Raymond Johnson', 'IT', 62500, 31),
('Linda Wilson', 'HR', 58000, 40),
('Scott Taylor', 'IT', 62000, 32),
('Michelle Harris', 'Marketing', 65000, 28),
('Arthur Robinson', 'Sales', 54000, 33),
('Jennifer Davis', 'IT', 63000, 29),
('Kenneth White', 'Finance', 60000, 31),
('Betty Wilson', 'HR', 57000, 42),
('Timothy Martinez', 'IT', 61000, 28),
('Ashley Clark', 'Sales', 52000, 29),
('Andrew Lewis', 'Marketing', 64000, 34),
('Rebecca Johnson', 'HR', 58000, 38),
('Christopher Lee', 'IT', 62500, 27),
('Thomas Harris', 'Finance', 60000, 37),
('Susan Davis', 'Marketing', 65000, 33),
('Ruth Martinez', 'HR', 56000, 40),
('Anthony Robinson', 'IT', 61000, 31),
('Lisa Clark', 'Sales', 52000, 28),
('Matthew White', 'IT', 63000, 29),
('Margaret Wilson', 'Marketing', 64000, 31),
('Donald Taylor', 'IT', 60000, 32),
('Helen Johnson', 'HR', 57000, 35),
('Patricia Harris', 'Finance', 59500, 30),
('Joshua Lee', 'IT', 62000, 33),
('Karen Martinez', 'Sales', 53000, 29),
('Charles Clark', 'Marketing', 65000, 34),
('Pamela Wilson', 'HR', 58000, 37),
('Robert Harris', 'IT', 62500, 29),
('Emily White', 'Finance', 60000, 28),
('Virginia Taylor', 'Sales', 52000, 41),
('Donald Davis', 'Marketing', 64000, 35),
('Kenneth Martinez', 'IT', 63000, 30),
('Dorothy Johnson', 'HR', 57000, 27),
('Linda Harris', 'Finance', 59500, 32),
('Gregory Taylor', 'IT', 61000, 33),
('Nancy Clark', 'Sales', 53000, 34),
('Jeffrey White', 'Marketing', 65000, 29),
('Sarah Davis', 'HR', 58000, 30),
('Mark Wilson', 'IT', 62000, 35),
('Michael Harris', 'Sales', 54000, 28),
('Cynthia Johnson', 'Marketing', 64000, 31),
('Karen Lee', 'IT', 60000, 34),
('Anthony Robinson', 'Finance', 60000, 37),
('Edward Taylor', 'IT', 62500, 31),
('George Clark', 'HR', 57000, 40),
('Lisa Wilson', 'Sales', 52000, 32),
('Sandra Martinez', 'Marketing', 64000, 33),
('Paul Harris', 'IT', 63000, 29),
('Michael White', 'Finance', 61500, 42),
('Donald Lee', 'HR', 58500, 31),
('Sharon Green', 'Marketing', 64500, 36),
('Steven Clark', 'IT', 60500, 34),
('Daniel Taylor', 'Sales', 51500, 45),
('Laura Johnson', 'HR', 57000, 30),
('James Martinez', 'Finance', 61000, 38),
('Thomas Wilson', 'IT', 62000, 32),
('Betty Brown', 'Marketing', 65000, 28),
('John Harris', 'Sales', 53000, 29),
('Emily Robinson', 'Finance', 60000, 33),
('Nancy White', 'IT', 61500, 30),
('Paul Wilson', 'HR', 57500, 37),
('Lisa Martinez', 'Marketing', 64000, 31),
('Charles Clark', 'Sales', 54500, 32),
('George Brown', 'Finance', 59000, 35);
 
-- Apply query optimization on table
 
create index Salary_index on employee(Salary);
create index Salary_Department_index on Employee (Salary,Department);
 
select ID,Name,Department,Salary 
from Employee 
where Salary >60000;
 
explain select ID,Name,Department,Salary 
from Employee 
where Salary >60000;
 
select ID,Name,Department,Salary,Age
from Employee
Where Salary >50000 and Department ='HR';
 
Explain select ID,Name,Department,Salary,Age
from Employee
Where Salary >50000 and Department ='HR';

-- partition in DBMS
CREATE TABLE Employeerange (
  ID int AUTO_INCREMENT,
  Name Varchar(100),
  Department varchar(100),
  Salary int,
  Age int,
  primary key(ID,Salary)
)
partition by range (Salary)
(partition s values less than (50000),
partition s1 values less than (60000),
partition s3 values less than (80000));

INSERT INTO Employeerange (Name, Department, Salary, Age) VALUES
('John Doe', 'IT', 60000, 29),
('Jane Smith', 'HR', 55000, 34),
('Emily Davis', 'IT', 62000, 31),
('Michael Brown', 'Sales', 52000, 45),
('Sarah Johnson', 'HR', 58000, 28),
('William Clark', 'IT', 63000, 30),
('Nancy Wilson', 'Finance', 59000, 42),
('Joseph Walker', 'IT', 61000, 33),
('Betty Martinez', 'Marketing', 65000, 39),
('Robert Johnson', 'IT', 60000, 32),
('Karen White', 'HR', 57000, 41),
('Daniel Moore', 'IT', 62500, 36),
('Patricia Taylor', 'Sales', 53500, 47),
('Paul Thomas', 'Finance', 61500, 50),
('Lisa White', 'Marketing', 64000, 29),
('Charles Miller', 'IT', 63000, 27),
('James Davis', 'HR', 56000, 44),
('George Wilson', 'IT', 62000, 34),
('Sandra Lee', 'Finance', 60000, 37),
('Edward Harris', 'IT', 61000, 38),
('Mary Clark', 'HR', 58000, 31),
('Steven Robinson', 'Sales', 54000, 35),
('Amy Martinez', 'Marketing', 65000, 40),
('Kevin Johnson', 'IT', 60000, 29),
('Angela Taylor', 'HR', 57000, 34),
('Brian Anderson', 'Finance', 59500, 41),
('Elizabeth Harris', 'IT', 63000, 30),
('Ronald Lee', 'Sales', 52000, 32),
('Laura White', 'HR', 56000, 33),
('Gregory Thomas', 'IT', 61000, 34),
('Dorothy Clark', 'Marketing', 64000, 36),
('Frank Lewis', 'Sales', 53000, 35),
('Barbara Martinez', 'Finance', 59000, 45),
('Raymond Johnson', 'IT', 62500, 31),
('Linda Wilson', 'HR', 58000, 40),
('Scott Taylor', 'IT', 62000, 32),
('Michelle Harris', 'Marketing', 65000, 28),
('Arthur Robinson', 'Sales', 54000, 33),
('Jennifer Davis', 'IT', 63000, 29),
('Kenneth White', 'Finance', 60000, 31),
('Betty Wilson', 'HR', 57000, 42),
('Timothy Martinez', 'IT', 61000, 28),
('Ashley Clark', 'Sales', 52000, 29),
('Andrew Lewis', 'Marketing', 64000, 34),
('Rebecca Johnson', 'HR', 58000, 38),
('Christopher Lee', 'IT', 62500, 27),
('Thomas Harris', 'Finance', 60000, 37),
('Susan Davis', 'Marketing', 65000, 33),
('Ruth Martinez', 'HR', 56000, 40),
('Anthony Robinson', 'IT', 61000, 31),
('Lisa Clark', 'Sales', 52000, 28),
('Matthew White', 'IT', 63000, 29),
('Margaret Wilson', 'Marketing', 64000, 31),
('Donald Taylor', 'IT', 60000, 32),
('Helen Johnson', 'HR', 57000, 35),
('Patricia Harris', 'Finance', 59500, 30),
('Joshua Lee', 'IT', 62000, 33),
('Karen Martinez', 'Sales', 53000, 29),
('Charles Clark', 'Marketing', 65000, 34),
('Pamela Wilson', 'HR', 58000, 37),
('Robert Harris', 'IT', 62500, 29),
('Emily White', 'Finance', 60000, 28),
('Virginia Taylor', 'Sales', 52000, 41),
('Donald Davis', 'Marketing', 64000, 35),
('Kenneth Martinez', 'IT', 63000, 30),
('Dorothy Johnson', 'HR', 57000, 27),
('Linda Harris', 'Finance', 59500, 32),
('Gregory Taylor', 'IT', 61000, 33),
('Nancy Clark', 'Sales', 53000, 34),
('Jeffrey White', 'Marketing', 65000, 29),
('Sarah Davis', 'HR', 58000, 30),
('Mark Wilson', 'IT', 62000, 35),
('Michael Harris', 'Sales', 54000, 28),
('Cynthia Johnson', 'Marketing', 64000, 31),
('Karen Lee', 'IT', 60000, 34),
('Anthony Robinson', 'Finance', 60000, 37),
('Edward Taylor', 'IT', 62500, 31),
('George Clark', 'HR', 57000, 40),
('Lisa Wilson', 'Sales', 52000, 32),
('Sandra Martinez', 'Marketing', 64000, 33),
('Paul Harris', 'IT', 63000, 29),
('Michael White', 'Finance', 61500, 42),
('Donald Lee', 'HR', 58500, 31),
('Sharon Green', 'Marketing', 64500, 36),
('Steven Clark', 'IT', 60500, 34),
('Daniel Taylor', 'Sales', 51500, 45),
('Laura Johnson', 'HR', 57000, 30),
('James Martinez', 'Finance', 61000, 38),
('Thomas Wilson', 'IT', 62000, 32),
('Betty Brown', 'Marketing', 65000, 28),
('John Harris', 'Sales', 53000, 29),
('Emily Robinson', 'Finance', 60000, 33),
('Nancy White', 'IT', 61500, 30),
('Paul Wilson', 'HR', 57500, 37),
('Lisa Martinez', 'Marketing', 64000, 31),
('Charles Clark', 'Sales', 54500, 32),
('George Brown', 'Finance', 59000, 35);
 
 select ID,Name,Department,Salary,Age
 from Employeerange
 where salary between 55000 and 65000;
 
 select ID,Name,Department,Salary,Age
 from Employeerange
 where salary between 60000 and Department='IT' ;
 
 select ID,Name,Department,Salary,Age
 from Employeerange
 where salary >60000 and age=35;
 
 Select Department, avg(salary) as Avg_salary
 from Employeerange
 group by Department;
 
 CREATE TABLE Employeelist (
  ID int AUTO_INCREMENT,
  Name Varchar(100),
  Department varchar(100),
  Salary int,
  Age int,
  primary key(ID,Department)
)
partition by List columns(Department)
(partition s values in ('IT'),
partition s1 values in ('HR'),
partition s2 values in ('SAles'),
partition s3 values in ('Finance'),
partition s4 values in ('Marketing'));
 
INSERT INTO Employeelist (Name, Department, Salary, Age) VALUES
('John Doe', 'IT', 60000, 29),
('Jane Smith', 'HR', 55000, 34),
('Emily Davis', 'IT', 62000, 31),
('Michael Brown', 'Sales', 52000, 45),
('Sarah Johnson', 'HR', 58000, 28),
('William Clark', 'IT', 63000, 30),
('Nancy Wilson', 'Finance', 59000, 42),
('Joseph Walker', 'IT', 61000, 33),
('Betty Martinez', 'Marketing', 65000, 39),
('Robert Johnson', 'IT', 60000, 32),
('Karen White', 'HR', 57000, 41),
('Daniel Moore', 'IT', 62500, 36),
('Patricia Taylor', 'Sales', 53500, 47),
('Paul Thomas', 'Finance', 61500, 50),
('Lisa White', 'Marketing', 64000, 29),
('Charles Miller', 'IT', 63000, 27),
('James Davis', 'HR', 56000, 44),
('George Wilson', 'IT', 62000, 34),
('Sandra Lee', 'Finance', 60000, 37),
('Edward Harris', 'IT', 61000, 38),
('Mary Clark', 'HR', 58000, 31),
('Steven Robinson', 'Sales', 54000, 35),
('Amy Martinez', 'Marketing', 65000, 40),
('Kevin Johnson', 'IT', 60000, 29),
('Angela Taylor', 'HR', 57000, 34),
('Brian Anderson', 'Finance', 59500, 41),
('Elizabeth Harris', 'IT', 63000, 30),
('Ronald Lee', 'Sales', 52000, 32),
('Laura White', 'HR', 56000, 33),
('Gregory Thomas', 'IT', 61000, 34),
('Dorothy Clark', 'Marketing', 64000, 36),
('Frank Lewis', 'Sales', 53000, 35),
('Barbara Martinez', 'Finance', 59000, 45),
('Raymond Johnson', 'IT', 62500, 31),
('Linda Wilson', 'HR', 58000, 40),
('Scott Taylor', 'IT', 62000, 32),
('Michelle Harris', 'Marketing', 65000, 28),
('Arthur Robinson', 'Sales', 54000, 33),
('Jennifer Davis', 'IT', 63000, 29),
('Kenneth White', 'Finance', 60000, 31),
('Betty Wilson', 'HR', 57000, 42),
('Timothy Martinez', 'IT', 61000, 28),
('Ashley Clark', 'Sales', 52000, 29),
('Andrew Lewis', 'Marketing', 64000, 34),
('Rebecca Johnson', 'HR', 58000, 38),
('Christopher Lee', 'IT', 62500, 27),
('Thomas Harris', 'Finance', 60000, 37),
('Susan Davis', 'Marketing', 65000, 33),
('Ruth Martinez', 'HR', 56000, 40),
('Anthony Robinson', 'IT', 61000, 31),
('Lisa Clark', 'Sales', 52000, 28),
('Matthew White', 'IT', 63000, 29),
('Margaret Wilson', 'Marketing', 64000, 31),
('Donald Taylor', 'IT', 60000, 32),
('Helen Johnson', 'HR', 57000, 35),
('Patricia Harris', 'Finance', 59500, 30),
('Joshua Lee', 'IT', 62000, 33),
('Karen Martinez', 'Sales', 53000, 29),
('Charles Clark', 'Marketing', 65000, 34),
('Pamela Wilson', 'HR', 58000, 37),
('Robert Harris', 'IT', 62500, 29),
('Emily White', 'Finance', 60000, 28),
('Virginia Taylor', 'Sales', 52000, 41),
('Donald Davis', 'Marketing', 64000, 35),
('Kenneth Martinez', 'IT', 63000, 30),
('Dorothy Johnson', 'HR', 57000, 27),
('Linda Harris', 'Finance', 59500, 32),
('Gregory Taylor', 'IT', 61000, 33),
('Nancy Clark', 'Sales', 53000, 34),
('Jeffrey White', 'Marketing', 65000, 29),
('Sarah Davis', 'HR', 58000, 30),
('Mark Wilson', 'IT', 62000, 35),
('Michael Harris', 'Sales', 54000, 28),
('Cynthia Johnson', 'Marketing', 64000, 31),
('Karen Lee', 'IT', 60000, 34),
('Anthony Robinson', 'Finance', 60000, 37),
('Edward Taylor', 'IT', 62500, 31),
('George Clark', 'HR', 57000, 40),
('Lisa Wilson', 'Sales', 52000, 32),
('Sandra Martinez', 'Marketing', 64000, 33),
('Paul Harris', 'IT', 63000, 29),
('Michael White', 'Finance', 61500, 42),
('Donald Lee', 'HR', 58500, 31),
('Sharon Green', 'Marketing', 64500, 36),
('Steven Clark', 'IT', 60500, 34),
('Daniel Taylor', 'Sales', 51500, 45),
('Laura Johnson', 'HR', 57000, 30),
('James Martinez', 'Finance', 61000, 38),
('Thomas Wilson', 'IT', 62000, 32),
('Betty Brown', 'Marketing', 65000, 28),
('John Harris', 'Sales', 53000, 29),
('Emily Robinson', 'Finance', 60000, 33),
('Nancy White', 'IT', 61500, 30),
('Paul Wilson', 'HR', 57500, 37),
('Lisa Martinez', 'Marketing', 64000, 31),
('Charles Clark', 'Sales', 54500, 32),
('George Brown', 'Finance', 59000, 35);

select ID,Name,Department,Salary,Age
 from Employeelist
 where Department ='IT';
 
explain select ID,Name,Department,Salary,Age
 from Employeelist
 where Department ='IT';
 
 select ID,Name,Department,Salary,Age
 from Employeelist
 where age > 30;
 
 CREATE TABLE Employeehash (
  ID int primary key AUTO_INCREMENT,
  Name Varchar(100),
  Department varchar(100),
  Salary int,
  Age int
)
partition by hash (ID)
Partitions 4;

INSERT INTO Employeehash (Name, Department, Salary, Age) VALUES
('John Doe', 'IT', 60000, 29),
('Jane Smith', 'HR', 55000, 34),
('Emily Davis', 'IT', 62000, 31),
('Michael Brown', 'Sales', 52000, 45),
('Sarah Johnson', 'HR', 58000, 28),
('William Clark', 'IT', 63000, 30),
('Nancy Wilson', 'Finance', 59000, 42),
('Joseph Walker', 'IT', 61000, 33),
('Betty Martinez', 'Marketing', 65000, 39),
('Robert Johnson', 'IT', 60000, 32),
('Karen White', 'HR', 57000, 41),
('Daniel Moore', 'IT', 62500, 36),
('Patricia Taylor', 'Sales', 53500, 47),
('Paul Thomas', 'Finance', 61500, 50),
('Lisa White', 'Marketing', 64000, 29),
('Charles Miller', 'IT', 63000, 27),
('James Davis', 'HR', 56000, 44),
('George Wilson', 'IT', 62000, 34),
('Sandra Lee', 'Finance', 60000, 37),
('Edward Harris', 'IT', 61000, 38),
('Mary Clark', 'HR', 58000, 31),
('Steven Robinson', 'Sales', 54000, 35),
('Amy Martinez', 'Marketing', 65000, 40),
('Kevin Johnson', 'IT', 60000, 29),
('Angela Taylor', 'HR', 57000, 34),
('Brian Anderson', 'Finance', 59500, 41),
('Elizabeth Harris', 'IT', 63000, 30),
('Ronald Lee', 'Sales', 52000, 32),
('Laura White', 'HR', 56000, 33),
('Gregory Thomas', 'IT', 61000, 34),
('Dorothy Clark', 'Marketing', 64000, 36),
('Frank Lewis', 'Sales', 53000, 35),
('Barbara Martinez', 'Finance', 59000, 45),
('Raymond Johnson', 'IT', 62500, 31),
('Linda Wilson', 'HR', 58000, 40),
('Scott Taylor', 'IT', 62000, 32),
('Michelle Harris', 'Marketing', 65000, 28),
('Arthur Robinson', 'Sales', 54000, 33),
('Jennifer Davis', 'IT', 63000, 29),
('Kenneth White', 'Finance', 60000, 31),
('Betty Wilson', 'HR', 57000, 42),
('Timothy Martinez', 'IT', 61000, 28),
('Ashley Clark', 'Sales', 52000, 29),
('Andrew Lewis', 'Marketing', 64000, 34),
('Rebecca Johnson', 'HR', 58000, 38),
('Christopher Lee', 'IT', 62500, 27),
('Thomas Harris', 'Finance', 60000, 37),
('Susan Davis', 'Marketing', 65000, 33),
('Ruth Martinez', 'HR', 56000, 40),
('Anthony Robinson', 'IT', 61000, 31),
('Lisa Clark', 'Sales', 52000, 28),
('Matthew White', 'IT', 63000, 29),
('Margaret Wilson', 'Marketing', 64000, 31),
('Donald Taylor', 'IT', 60000, 32),
('Helen Johnson', 'HR', 57000, 35),
('Patricia Harris', 'Finance', 59500, 30),
('Joshua Lee', 'IT', 62000, 33),
('Karen Martinez', 'Sales', 53000, 29),
('Charles Clark', 'Marketing', 65000, 34),
('Pamela Wilson', 'HR', 58000, 37),
('Robert Harris', 'IT', 62500, 29),
('Emily White', 'Finance', 60000, 28),
('Virginia Taylor', 'Sales', 52000, 41),
('Donald Davis', 'Marketing', 64000, 35),
('Kenneth Martinez', 'IT', 63000, 30),
('Dorothy Johnson', 'HR', 57000, 27),
('Linda Harris', 'Finance', 59500, 32),
('Gregory Taylor', 'IT', 61000, 33),
('Nancy Clark', 'Sales', 53000, 34),
('Jeffrey White', 'Marketing', 65000, 29),
('Sarah Davis', 'HR', 58000, 30),
('Mark Wilson', 'IT', 62000, 35),
('Michael Harris', 'Sales', 54000, 28),
('Cynthia Johnson', 'Marketing', 64000, 31),
('Karen Lee', 'IT', 60000, 34),
('Anthony Robinson', 'Finance', 60000, 37),
('Edward Taylor', 'IT', 62500, 31),
('George Clark', 'HR', 57000, 40),
('Lisa Wilson', 'Sales', 52000, 32),
('Sandra Martinez', 'Marketing', 64000, 33),
('Paul Harris', 'IT', 63000, 29),
('Michael White', 'Finance', 61500, 42),
('Donald Lee', 'HR', 58500, 31),
('Sharon Green', 'Marketing', 64500, 36),
('Steven Clark', 'IT', 60500, 34),
('Daniel Taylor', 'Sales', 51500, 45),
('Laura Johnson', 'HR', 57000, 30),
('James Martinez', 'Finance', 61000, 38),
('Thomas Wilson', 'IT', 62000, 32),
('Betty Brown', 'Marketing', 65000, 28),
('John Harris', 'Sales', 53000, 29),
('Emily Robinson', 'Finance', 60000, 33),
('Nancy White', 'IT', 61500, 30),
('Paul Wilson', 'HR', 57500, 37),
('Lisa Martinez', 'Marketing', 64000, 31),
('Charles Clark', 'Sales', 54500, 32),
('George Brown', 'Finance', 59000, 35);
 
 select Department,avg(Salary) as salary_Age
 from Employeehash
 group by Department;
 
Explain select Department,avg(Salary) as salary_Age
 from Employeehash
 group by Department;
 
 CREATE TABLE Employeekey (
  ID int primary key AUTO_INCREMENT,
  Name Varchar(100),
  Department varchar(100),
  Salary int,
  Age int
)
partition by key (ID)
Partitions 4;

INSERT INTO Employeekey (Name, Department, Salary, Age) VALUES
('John Doe', 'IT', 60000, 29),
('Jane Smith', 'HR', 55000, 34),
('Emily Davis', 'IT', 62000, 31),
('Michael Brown', 'Sales', 52000, 45),
('Sarah Johnson', 'HR', 58000, 28),
('William Clark', 'IT', 63000, 30),
('Nancy Wilson', 'Finance', 59000, 42),
('Joseph Walker', 'IT', 61000, 33),
('Betty Martinez', 'Marketing', 65000, 39),
('Robert Johnson', 'IT', 60000, 32),
('Karen White', 'HR', 57000, 41),
('Daniel Moore', 'IT', 62500, 36),
('Patricia Taylor', 'Sales', 53500, 47),
('Paul Thomas', 'Finance', 61500, 50),
('Lisa White', 'Marketing', 64000, 29),
('Charles Miller', 'IT', 63000, 27),
('James Davis', 'HR', 56000, 44),
('George Wilson', 'IT', 62000, 34),
('Sandra Lee', 'Finance', 60000, 37),
('Edward Harris', 'IT', 61000, 38),
('Mary Clark', 'HR', 58000, 31),
('Steven Robinson', 'Sales', 54000, 35),
('Amy Martinez', 'Marketing', 65000, 40),
('Kevin Johnson', 'IT', 60000, 29),
('Angela Taylor', 'HR', 57000, 34),
('Brian Anderson', 'Finance', 59500, 41),
('Elizabeth Harris', 'IT', 63000, 30),
('Ronald Lee', 'Sales', 52000, 32),
('Laura White', 'HR', 56000, 33),
('Gregory Thomas', 'IT', 61000, 34),
('Dorothy Clark', 'Marketing', 64000, 36),
('Frank Lewis', 'Sales', 53000, 35),
('Barbara Martinez', 'Finance', 59000, 45),
('Raymond Johnson', 'IT', 62500, 31),
('Linda Wilson', 'HR', 58000, 40),
('Scott Taylor', 'IT', 62000, 32),
('Michelle Harris', 'Marketing', 65000, 28),
('Arthur Robinson', 'Sales', 54000, 33),
('Jennifer Davis', 'IT', 63000, 29),
('Kenneth White', 'Finance', 60000, 31),
('Betty Wilson', 'HR', 57000, 42),
('Timothy Martinez', 'IT', 61000, 28),
('Ashley Clark', 'Sales', 52000, 29),
('Andrew Lewis', 'Marketing', 64000, 34),
('Rebecca Johnson', 'HR', 58000, 38),
('Christopher Lee', 'IT', 62500, 27),
('Thomas Harris', 'Finance', 60000, 37),
('Susan Davis', 'Marketing', 65000, 33),
('Ruth Martinez', 'HR', 56000, 40),
('Anthony Robinson', 'IT', 61000, 31),
('Lisa Clark', 'Sales', 52000, 28),
('Matthew White', 'IT', 63000, 29),
('Margaret Wilson', 'Marketing', 64000, 31),
('Donald Taylor', 'IT', 60000, 32),
('Helen Johnson', 'HR', 57000, 35),
('Patricia Harris', 'Finance', 59500, 30),
('Joshua Lee', 'IT', 62000, 33),
('Karen Martinez', 'Sales', 53000, 29),
('Charles Clark', 'Marketing', 65000, 34),
('Pamela Wilson', 'HR', 58000, 37),
('Robert Harris', 'IT', 62500, 29),
('Emily White', 'Finance', 60000, 28),
('Virginia Taylor', 'Sales', 52000, 41),
('Donald Davis', 'Marketing', 64000, 35),
('Kenneth Martinez', 'IT', 63000, 30),
('Dorothy Johnson', 'HR', 57000, 27),
('Linda Harris', 'Finance', 59500, 32),
('Gregory Taylor', 'IT', 61000, 33),
('Nancy Clark', 'Sales', 53000, 34),
('Jeffrey White', 'Marketing', 65000, 29),
('Sarah Davis', 'HR', 58000, 30),
('Mark Wilson', 'IT', 62000, 35),
('Michael Harris', 'Sales', 54000, 28),
('Cynthia Johnson', 'Marketing', 64000, 31),
('Karen Lee', 'IT', 60000, 34),
('Anthony Robinson', 'Finance', 60000, 37),
('Edward Taylor', 'IT', 62500, 31),
('George Clark', 'HR', 57000, 40),
('Lisa Wilson', 'Sales', 52000, 32),
('Sandra Martinez', 'Marketing', 64000, 33),
('Paul Harris', 'IT', 63000, 29),
('Michael White', 'Finance', 61500, 42),
('Donald Lee', 'HR', 58500, 31),
('Sharon Green', 'Marketing', 64500, 36),
('Steven Clark', 'IT', 60500, 34),
('Daniel Taylor', 'Sales', 51500, 45),
('Laura Johnson', 'HR', 57000, 30),
('James Martinez', 'Finance', 61000, 38),
('Thomas Wilson', 'IT', 62000, 32),
('Betty Brown', 'Marketing', 65000, 28),
('John Harris', 'Sales', 53000, 29),
('Emily Robinson', 'Finance', 60000, 33),
('Nancy White', 'IT', 61500, 30),
('Paul Wilson', 'HR', 57500, 37),
('Lisa Martinez', 'Marketing', 64000, 31),
('Charles Clark', 'Sales', 54500, 32),
('George Brown', 'Finance', 59000, 35);
 
 select Department,avg(Salary) as salary_Age
 from Employeekey
 group by Department;
 
 Explain  select Department,avg(Salary) as salary_Age
 from Employeekey
 group by Department;
 
SELECT * FROM EmployeeKEY WHERE Department = 'IT';
SELECT * FROM EmployeeKEY WHERE Age BETWEEN 30 AND 40;
SELECT * FROM EmployeeKEY WHERE Salary > 60000;

SELECT Department, AVG(Salary) AS AvgSalary 
FROM EmployeeKEY 
GROUP BY Department;

SELECT Department, COUNT(*) AS EmployeeCount 
FROM EmployeeKEY 
GROUP BY Department;

-- Question -1 You have a table students with the following structure:
-- Write an optimized query to fetch all students from the "Computer Science" department with a GPA greater than 3.5. Also, suggest and apply an index that can improve the performance of this query.

CREATE TABLE Student (
  ID int primary key AUTO_INCREMENT,
  Name Varchar(100),
  Department varchar(100),
  Grade float(3,2)
);
INSERT INTO Student (Name, Department, Grade) VALUES
('John Doe', 'Computer Science', 8.75), ('Jane Smith', 'Mathematics', 9.10),
('Emily Davis', 'Physics', 7.80), ('Michael Brown', 'Engineering', 8.20),
('Sarah Johnson', 'Biology', 9.50), ('William Clark', 'Computer Science', 7.90),
('Nancy Wilson', 'Chemistry', 8.40), ('Joseph Walker', 'Engineering', 8.60),
('Betty Martinez', 'Mathematics', 9.00), ('Robert Johnson', 'Physics', 7.70),
('Karen White', 'Biology', 9.20), ('Daniel Moore', 'Computer Science', 8.30),
('Patricia Taylor', 'Engineering', 8.50), ('Paul Thomas', 'Mathematics', 8.95),
('Lisa White', 'Biology', 9.40), ('Charles Miller', 'Physics', 7.60),
('James Davis', 'Chemistry', 8.25), ('George Wilson', 'Computer Science', 8.70),
('Sandra Lee', 'Mathematics', 9.15), ('Edward Harris', 'Physics', 7.85),
('Mary Clark', 'Biology', 9.60), ('Steven Robinson', 'Engineering', 8.10),
('Amy Martinez', 'Chemistry', 8.55), ('Kevin Johnson', 'Computer Science', 8.90),
('Angela Taylor', 'Mathematics', 9.05), ('Brian Anderson', 'Physics', 7.75),
('Elizabeth Harris', 'Engineering', 8.35), ('Ronald Lee', 'Biology', 9.30),
('Laura White', 'Chemistry', 8.60), ('Gregory Thomas', 'Computer Science', 8.50),
('Dorothy Clark', 'Mathematics', 9.25), ('Frank Lewis', 'Physics', 7.95),
('Barbara Martinez', 'Engineering', 8.45), ('Raymond Johnson', 'Biology', 9.10),
('Linda Wilson', 'Chemistry', 8.20), ('Scott Taylor', 'Computer Science', 8.80),
('Michelle Harris', 'Mathematics', 9.00), ('Arthur Robinson', 'Physics', 7.90),
('Jennifer Davis', 'Biology', 9.35), ('Kenneth White', 'Engineering', 8.40),
('Betty Wilson', 'Chemistry', 8.50), ('Timothy Martinez', 'Computer Science', 8.60),
('Ashley Clark', 'Mathematics', 9.20), ('Andrew Lewis', 'Physics', 7.85),
('Rebecca Johnson', 'Biology', 9.55), ('Christopher Lee', 'Chemistry', 8.15),
('Thomas Harris', 'Engineering', 8.30), ('Susan Davis', 'Computer Science', 8.75),
('Ruth Martinez', 'Mathematics', 9.10), ('Anthony Robinson', 'Physics', 7.70),
('Alan Scott', 'Computer Science', 4.75), ('Betty Cooper', 'Mathematics', 4.60),
('Charlie Adams', 'Physics', 4.50), ('Diana King', 'Engineering', 4.20),
('Ethan Brooks', 'Biology', 4.80), ('Fiona Clarke', 'Chemistry', 4.30),
('George Harris', 'Computer Science', 4.90), ('Hannah Lewis', 'Engineering', 4.10),
('Isaac Miller', 'Mathematics', 4.40), ('Julia Nelson', 'Physics', 4.85),
('Kevin Parker', 'Biology', 4.70), ('Lily Roberts', 'Chemistry', 4.55),
('Mark Stewart', 'Computer Science', 4.35), ('Nancy Turner', 'Mathematics', 4.25),
('Oscar Wallace', 'Physics', 4.05), ('Paula Young', 'Engineering', 4.45),
('Quentin Baker', 'Biology', 4.95), ('Rachel Carter', 'Chemistry', 4.50),
('Samuel Davis', 'Computer Science', 4.15), ('Tina Evans', 'Mathematics', 4.65),
('Umar Franklin', 'Physics', 4.30), ('Vanessa Green', 'Engineering', 4.75),
('Walter Hall', 'Biology', 4.85), ('Xavier Ingram', 'Chemistry', 4.00),
('Yvonne Jenkins', 'Computer Science', 4.20), ('Zachary Knight', 'Mathematics', 4.35),
('Abigail Morgan', 'Physics', 4.10), ('Benjamin Norton', 'Engineering', 4.70),
('Catherine Owens', 'Biology', 4.55), ('David Peterson', 'Chemistry', 4.25);

create index Grade_index on Student(Grade);
create index Grade_Department_index on student(Grade,Department);

select ID,Name,Department,Grade
from student
where Grade>3.5;
 
explain select ID,Name,Department,Grade 
from student
where Grade>3.5;
 
 
-- Question -2  Implementing Range Partitioning
-- Create a table exam_results that stores student scores, partitioned by score ranges:
-- 0-49 (Fail)
-- 50-74 (Pass)
-- 75-100 (Distinction)
-- Write the SQL code to create the partitioned table and insert sample data.

CREATE TABLE Exam_results (
    std_id INT AUTO_INCREMENT,
    s_name VARCHAR(50),
    trade_name VARCHAR(50),
    score INT,
    primary key(std_id,score)
    )
    partition by range(score)
(partition fail values less than(50),
partition pass values less than (75),
partition Distinction values less than (101));
    
INSERT INTO Exam_results (s_name, trade_name, score) VALUES
('John Doe', 'Computer Science', 85),
('Jane Smith', 'Mathematics', 92),
('Emily Davis', 'Physics', 78),
('Michael Brown', 'Engineering', 89),
('Sarah Johnson', 'Biology', 95),
('William Clark', 'Computer Science', 76),
('Nancy Wilson', 'Chemistry', 82),
('Joseph Walker', 'Engineering', 88),
('Betty Martinez', 'Mathematics', 91),
('Robert Johnson', 'Physics', 74),
('Karen White', 'Biology', 93),
('Daniel Moore', 'Computer Science', 80),
('Patricia Taylor', 'Engineering', 85),
('Paul Thomas', 'Mathematics', 90),
('Lisa White', 'Biology', 94),
('Charles Miller', 'Physics', 79),
('James Davis', 'Chemistry', 84),
('George Wilson', 'Computer Science', 83),
('Sandra Lee', 'Mathematics', 91),
('Edward Harris', 'Physics', 77),
('Mary Clark', 'Biology', 96),
('Steven Robinson', 'Engineering', 78),
('Amy Martinez', 'Chemistry', 80),
('Kevin Johnson', 'Computer Science', 88),
('Angela Taylor', 'Mathematics', 90),
('Brian Anderson', 'Physics', 75),
('Elizabeth Harris', 'Engineering', 82),
('Ronald Lee', 'Biology', 86),
('Laura White', 'Chemistry', 84),
('Gregory Thomas', 'Computer Science', 81),
('Dorothy Clark', 'Mathematics', 89),
('Frank Lewis', 'Physics', 73),
('Barbara Martinez', 'Engineering', 83),
('Raymond Johnson', 'Biology', 87),
('Linda Wilson', 'Chemistry', 79),
('Scott Taylor', 'Computer Science', 80),
('Michelle Harris', 'Mathematics', 92),
('Arthur Robinson', 'Physics', 76),
('Jennifer Davis', 'Biology', 90),
('Kenneth White', 'Engineering', 81),
('Betty Wilson', 'Chemistry', 75),
('Timothy Martinez', 'Computer Science', 82),
('Ashley Clark', 'Mathematics', 88),
('Andrew Lewis', 'Physics', 80),
('Rebecca Johnson', 'Biology', 89),
('Christopher Lee', 'Chemistry', 77),
('Thomas Harris', 'Engineering', 84),
('Susan Davis', 'Computer Science', 85),
('Ruth Martinez', 'Mathematics', 86),
('Anthony Robinson', 'Physics', 78);

select * from exam_results
where score < 90;
select ID,Name,Salary,Age
from exam_results
where score between 100 and 75;