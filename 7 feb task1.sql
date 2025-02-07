USE questions;
create table students(
first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob varchar (30),
    email VARCHAR(100) UNIQUE,
    phone varchar(10),
    enrollment_date date);
insert into students (first_name, last_name, dob, email, phone, enrollment_date)
values 
('John', 'Doe', '2002-05-15', 'john.doe@example.com', '1234567890', '2023-09-01'),
('Alice', 'Smith', '2001-08-20', 'alice.smith@example.com', '9876543210', '2023-09-01'),
('Bob', 'Johnson', '2000-12-10', 'bob.johnson@example.com', '5678901234', '2023-09-01');

create table courses(
course_name varchar (30),
course_description varchar (100),
credits int);

insert into  courses (course_name, course_description, credits)
values 
('Data Structures', 'Learn about linked lists, trees, and graphs.', 3),
('Database Systems', 'Introduction to relational databases and SQL.', 4),
('Operating Systems', 'Fundamentals of OS including processes and memory management.', 3),
('Computer Networks', 'Study of networking concepts, protocols, and security.', 3),
('Machine Learning', 'Introduction to ML algorithms and data science.', 4);

create table enrollments(
student_id int,
course_id int,
enrollment_date date,
grade varchar(5));
insert into enrollments (student_id, course_id, enrollment_date, grade)
values
(1, 1, '2023-09-05', 'A'),  -- John Doe in Data Structures
(1, 2, '2023-09-06', 'B'),  -- John Doe in Database Systems
(2, 2, '2023-09-07', 'A'),  -- Alice Smith in Database Systems
(2, 3, '2023-09-07', 'C'),  -- Alice Smith in Operating Systems
(3, 1, '2023-09-08', 'B'),  -- Bob Johnson in Data Structures
(3, 4, '2023-09-08', 'A');  -- Bob Johnson in Computer Networks

select student_id, s.first_name, s.last_name
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
where c.course_name = 'Data Structures';

select s.student_id, s.first_name, s.last_name, 
       avg(case 
            when e.grade = 'A' then 4.0
            when e.grade = 'B' then 3.0
            when e.grade = 'C' then 2.0
            when e.grade = 'D' then 1.0
            when e.grade = 'F' then 0.0
          end) as average_gpa
from students s
join enrollments e on s.student_id = e.student_id
group by s.student_id;

select c.course_id, c.course_name, COUNT(e.student_id) as total_students
from courses c
left join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name;

select s.student_id, s.first_name, s.last_name
from students s
join enrollments e on s.student_id = e.student_id
where e.grade = 'A'
group by s.student_id;

SELECT s.student_id, s.first_name, s.last_name
from students s
left join enrollments e on s.student_id = e.student_id
where e.student_id is null;

select c.course_id, c.course_name, COUNT(e.student_id) AS total_students
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_id
order by total_students desc
limit 1;

create index idx_enrollments_student on enrollments(student_id);
create index idx_enrollments_course on enrollments(course_id);
drop table courses;
