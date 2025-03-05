create database sakshi;
use sakshi;
create table record(
id int primary key,
name varchar (100),
address varchar (100),
trade varchar(10));

insert into record(id, name ,address, trade) values
(101,'sakshi singh','bihar','AIPA'),(102,'saumya singh','a.bad','AI');

delete from record where id=102;
select id,name,address, trade from record where id= 101;


