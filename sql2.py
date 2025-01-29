# create database ER;
# use ER;
# create table book(
# B_id int primary key,
# Title varchar(50),
# Author Varchar (50),
# price varchar(10),
# publisher_name varchar(50),
# foreign key (publisher_name) references publisher (Name));

# create table publisher(
# Name varchar(50) primary key,
# Address varchar(50),
# Phone varchar(11));

# create table Library(
# Name varchar(50) primary key,
# Address varchar (100));

# create table Borrower(
# Lib_card int primary key,
# Name varchar (50),
# Address varchar (100),
# phone varchar(11));

# create table Copies (
# Book_id int,
# Branch_id varchar(50),
# No_of_copies int,
# foreign key(Book_id) references book(B_id),
# foreign key(branch_id) references Library(name));

# insert into publisher(Name,Address,Phone) 
# values ('Ajanta','Hyderabad',9876543456),
# ('Pearson','Delhi',9988776678),
# ('RD sharma','Mumbai',678765678);


# insert into book(B_id,Title,Author,price,publisher_name) values
# (1,"Life without trees","Ankit Tiwari",150,"Ajanta"),
# (2,"The White Tiger","Arvind Adiga",499,"Pearson"),
# (3,"Machine Learning","Amit kumar Das",299,"RD Sharma");

# insert into Library(Name,Address) values
# ("Nalanda Library","Nalanda"),
# ("Ramanthapur Library","Hyderabad");

# insert into borrower(Lib_card,name,Address,phone) values
# (18,"Vamshi","New Zealand",8976567846),
# (43,"Daya","Hyderabad",9872345678);

# insert into Copies(Book_id,Branch_id,no_of_copies) values
# (1,"Nalanda Library",4),
# (2,"Ramanthapur Library",5);

# select * from book;
# select b.B_id,b.Title,b.Author,b.price
# from book b
# join publisher p on b.publisher_name=p.Name;

# select publisher_name,count(*)as total_books
# from book
# group by publisher_name;
# select * from Borrower;
 
# select * from Borrower where Lib_card=43;
