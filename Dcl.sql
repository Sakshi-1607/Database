create database Dcl;
-- Dcl - Data control
create table student(
std_id int auto_increment primary key,
F_name varchar (100),
L_name varchar (100),
Roll_no int);

insert into student(F_name,L_name,Roll_no) values
('sakshi','singh',101),
('Ramesh','pinaka',102),
('daya','kar',103),
('varun','Reddy',104),
('koushik','KTM',105);

create database DCL_Lib;
create table Books(
B_ID int primary key auto_increment,
Title varchar(100),
Author varchar(100),
Year int,
price int);

insert into Books(Title,Author,Year,Price) values
('Wings of Fire','Apj abdul kalam',1970,499),
('one Indian Girl','chetan bharat',2013,599),
('My Experiments with Truth','Mahatma gandhi',1943,799),
('Rich dad poor dad','Robert kiosaki',2022,999),
('Atomic habits','Robin sharma',1998,299);

create user 'NSTI_Librarian'@'localhost' identified by 'sakshi@123';
create user 'student'@'localhost' identified by 'Nsti@123';
create user 'sakshi'@'localhost' identified by 'sakshi@123';

-- permission to librarian
grant all privileges on dcl.* to 'Nsti_Librarian'@'localhost' with grant option;
grant all privileges on dcl.* to 'student'@'localhost' with grant option;

-- grant specific permission to students:
grant select, insert on Dcl.student to 'sakshi'@'localhost';
