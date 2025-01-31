----------- 1NF
create database BookstoreDMS;

create Table Denormalized_Books(
Book_ID int,
Book_TItle varchar(225),
Author_Name varchar(255),
publisher_Name varchar(255),
publisher_Address varchar(255),
category varchar(100),
price decimal(10,2));

insert into Denormalized_Books(Book_ID,Book_Title,Author_Name,Publisher_Name,Publisher_Address,category,price)
values
(1,'Database Design','Aryan Gopal','Techbooks Inc.','123 Tech st.','Education',50),
(2,'Web Development','jyoti chirag','codebooks Ltd.','456 code Ave.','Programing',40),
(3,'Database Design','Aryan Gopal','Techbooks Inc.','123 Tech st.','Education',50);

use BookstoreDMS;
create Table Books_1NF(
Book_ID int,
Book_TItle varchar(225),
Author_Name varchar(255),
publisher_Name varchar(255),
publisher_Address varchar(255),
category varchar(100),
price decimal(10,2),
primary key(Book_ID,Author_Name));

use BookstoreDMS;
insert into Books_1NF(Book_ID,Book_Title,Author_Name,Publisher_Name,Publisher_Address,category,price)
values
(1,'Database Design','Aryan Gopal','Techbooks Inc.','123 Tech st.','Education',50.00),
(1,'Database Design','jyoti chirag','Techbooks Inc.','123 Tech st.','Education',50.00),
(3,'Web Development','Aryan Gopal','Techbooks Inc.','123 Tech st.','Education',40.00);

use BookstoreDMS;
select * from Books_1NF;

----------- 2NF 




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    