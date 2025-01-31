-- Creating inf Table
create database college;  
use college;
create Table std_enroll(
std_id int,
name varchar(50),
CourseID int,
CourseName varchar(50),
InstructorID int,
InstructorName Varchar(50));

insert into std_enroll(std_id,Name,CourseID,courseName,InstructorID,InstructorName)
values(1,'Sakshi',101,'AIPA',10,'Shailesh'),
(2,'Daya',102,'CSA',11,'Pramod sir'),
(3,'Varun',103,'CHNM',12,'Adarsh'),
(4,'Divakar',104,'Drone',13,'Mahesh');

select * from std_Enroll;

create Table student1(
studentID int,
studentName Varchar(50));

insert into student1(studentID,studentName) values
(1,'Sakshi'),
(2,'Daya'),
(3,'Varun'),
(4,'Divakar');

select * from student1;

create table course(
CourseID int primary key,
courseName varchar(100),
InstructorID int);

insert into course (CourseID,CourseName) values
(1,'AIPA'),
(2,'CSA'),
(3,'CHNM'),
(4,'Drone');

create table Admission(
studentID int,
CourseID int,
Primary key (studentID,courseID));

insert into Admission(StudentID,courseID) values
(1,101),
(2,102),
(3,103),
(4,104);

select * from student1;
select * from Course;
select * from Admission;

-------------- BENF------------ 

create table student2(
StudentID int primary key,
studentName Varchar(50));

insert into student2( StudentID,studentName) values
(1,'Sakshi'),(2,'Daya'),(3,'Varun'),(4,'Divakar');

create table Instructors(
InstructorID int primary key,
InstructorName varchar (50));
 
insert into Instructors (InstructorID,InstructorName) values 
(10,"Shailesh"),
(11,"Pramod Sir"),
(12,"Adharsh"),
(13,"Rakesh");
 
create table Courses(
CourseID int primary key,
CourseName varchar(50),
InstructorID int,
foreign key(InstructorID) references Instructors(InstructorID));
 
insert into Courses( CourseID,CourseName,InstructorID) values 
(101,"AIPA",10),
(102,"CSA",11),
(103,"CHNM",12),
(104,"Drone",13);
 
-- creating relation between StudentsID & Course ID
 
create table Admission1 (
StudentID int,
CourseID int,
primary key (StudentID,CourseID),
foreign key (StudentID) references student2(StudentID),
foreign key (CourseID) references Courses(CourseID));
 
insert into Admission1 (StudentID,CourseID) values 
(1,101),
(2,102),
(3,103),
(4,104);