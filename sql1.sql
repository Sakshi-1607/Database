-- alter table abc rename column mobile to phone_no;

-- alter table abc drop column age;

-- alter table abc add age int;

-- use aipa;
-- insert into abc(id,name,phone_no,Address,age) value (1,"Sakshi",9876543234,"BIHAR",19),
-- (2,"Saumya",8978648694,"Abad",17),
-- (3,"Harsh",9876597548,"Abad",15),
-- (4,"Ankit",8796864586,"Bihar",25),
-- (5,"Deepak",9795867465,"Hyd",22),
-- (6,"Aditya",7865476895,"Hyd",23);

-- select name,Address from abc where age >20;

-- select * from abc;
-- select name from abc order by age asc;
-- select name, Address from abc where id=1;
-- select count(*) from abc;

-- update abc set Address = 'Bihar' where name = 'Harsh';

-- use aipa;
-- create table record(
-- name varchar (50),
-- age tinyint,
-- salary smallint,
-- height real
-- );

-- insert into record(name,age,salary,height) value ("sakshi",100,31000,55.5),("saumya",110,28000,53.5);
-- alter table record add column Gender varchar(10);
-- alter table record add column email varchar(30) after age;
-- insert into record(email,Gender) value ('sakshisingh@gmail.com','female');
-- alter table record add column Address tinytext after age;
-- insert into record (Address) value ('Ramanthapur Hyd')

use sakshi; 
create table employees(
id int Auto_Increment primary key,
name varchar(100),
salary decimal(10,2),
Address varchar(100),
phone_number varchar(10),
pincode int(10) );
insert into employees(id,name,salary,Address,phone_number,pincode) values (1,"Sakshi",35000.00,"Ramanthapur",9876545678,500013),
(2,"saumya",50000.00,"Bihar",9876785487,824101),(3,"khushi",23000.00,"Noida",8796576789,678567);

alter table employees add column email varchar(30) after phone_number;
insert into employees(email) value ('sakshisingh@gmail.com');
update employees set email="singhrajput@gmail.com" where name="sakshi" and id=1;
update employees set email="saumyasingh@gmail.com" where name="saumya" and id=2;
update employees set email="khu0shisingh@gmail.com" where name="khushi" and id=3;
delete from employees where name="khushi" and id=3;
alter table employees drop column pincode;

alter table abc
add column data DATE,
add column Datetime DATETIME,
add column Timestmp timestamp,
add column Time Time ,
add column year Year;

insert into abc(DATE,DATETIME,timestamp,Time,Year)
values('2025-2-28','2025-1-28', '12:06:30',current_timestmp,'12:07:45','2025');

alter table abc add column images longblob;

insert into abc (images) values (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/wallpaper.jpg"));

create table sqlEmp(
Department varchar(50),
name varchar(50),
salary int);
insert into sqlEmp(Department,name,salary)
values ("MTS","Daya",50000),
("Cashier","Ramesh",600000),
("Training officer","Aadil",100000),
("principal","Vamshi",10000),
("Training officer","Varun",60000);

select count(*) as Total_data from sqlEmp;
select sum(salary) from sqlEmp;
select avg(salary) as  Average_salary from sqlEmp;
select max(salary) as Maximum_salary from sqlEmp;
select min(salary) as Minimum_salary from sqlEmp;
select name, salary from sqlEmp where salary=(select max(salary) as Maximum_salary from sqlEmp);
select name, salary from sqlEmp where salary=(select min(salary) as Manimum_salary from sqlEmp);
select name,salary,Department from sqlEmp where salary=(select min(salary) as Minimum_salary from sqlEmp);
select count(name) as Training_Officer from sqlemp where Department="Training officer";
select Department, Max(salary) as Max_salary from sqlEmp group by department;
select Department, Min(salary) as Min_salary from sqlEmp group by department;
select Department,count(name) as Total_number from sqlEmp group by Department;
select Department, name, sum(salary) as total_salary from sqlEmp group by Department ,name;
select Department, avg(salary) as Avg_sal from sqlEmp group by Department Having avg(salary)>60000;
-- -------------------------------------------------------------------------------------------- 
create database ER;
use ER;
create table book(
B_id int primary key,
Title varchar(50),
Author Varchar (50),
price varchar(10),
publisher_name varchar(50),
foreign key (publisher_name) references publisher (Name));

create table publisher(
Name varchar(50) primary key,
Address varchar(50),
Phone varchar(11));

create table Library(
Name varchar(50) primary key,
Address varchar (100));

create table Borrower(
Lib_card int primary key,
Name varchar (50),
Address varchar (100),
phone varchar(11));

create table Copies (
Book_id int,
Branch_id varchar(50),
No_of_copies int,
foreign key(Book_id) references book(B_id),
foreign key(branch_id) references Library(name));

insert into publisher(Name,Address,Phone) 
values ('Ajanta','Hyderabad',9876543456),
('Pearson','Delhi',9988776678),
('RD sharma','Mumbai',678765678);


insert into book(B_id,Title,Author,price,publisher_name) values
(1,"Life without trees","Ankit Tiwari",150,"Ajanta"),
(2,"The White Tiger","Arvind Adiga",499,"Pearson"),
(3,"Machine Learning","Amit kumar Das",299,"RD Sharma");

insert into Library(Name,Address) values
("Nalanda Library","Nalanda"),
("Ramanthapur Library","Hyderabad");

insert into borrower(Lib_card,name,Address,phone) values
(18,"Vamshi","New Zealand",8976567846),
(43,"Daya","Hyderabad",9872345678);

insert into Copies(Book_id,Branch_id,no_of_copies) values
(1,"Nalanda Library",4),
(2,"Ramanthapur Library",5);

select * from book;
select b.B_id,b.Title,b.Author,b.price
from book b
join publisher p on b.publisher_name=p.Name;

select publisher_name,count(*)as total_books
from book
group by publisher_name;
select * from Borrower;
 
select * from Borrower where Lib_card=43;



