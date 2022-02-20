-- 101
create database school;
use school;
create table student(
student_id int primary key,
student_name varchar(255),
birthdate date,
student_gender char (1) check (student_gender in ('F','M')),
joining_date date,
student_email varchar(255),
student_level int check (student_level in (1,2,3,4,5,6)),
student_major  varchar(10) check (student_major in ("scientific","humanities")),
gpa double);

create table teacher (
teacher_id int primary key,
teacher_name varchar(255),
birthdate date,
teacher_gender char (1) check (teacher_gender in ('F','M')),
teacher_email varchar(255),
office_nember varchar (10));

create table course (
course_id int primary key,
course_name varchar(255));

use school;
show tables;

insert into student values (1234567899,'Ahmed','1999-02-11','m','2021-02-17','ahmed@gmail.com',6,'scientific',100),
(1233567899,'deem','1993-05-11','f','2021-02-17','deem@gmail.com',5,'scientific',93),
(1234562199,'sara','1998-02-01','f','2021-02-17','sara@gmail.com',2,'humanities',59);
select * from student;

insert into teacher values (3245,'ali','1880-02-11','m','ali@gmail.com','36411932'),
(3246,'reem','1883-02-11','m','reem@gmail.com','36411932'),
(3247,'norah','1879-02-11','f','norah@gmail.com','36411932');
select * from teacher;

insert into course values (01,'math'),(02,'CS'),(03,'history');
select * from course;

select student_id,student_name as name_ ,birthdate,student_gender,joining_date,student_email,student_major,student_level,gpa  from student  ;

update student 
set student_email='huda1@gmail.com'
where student_id=  1233567899;
select * from student;

update teacher
set office_nember='3641199'
where teacher_id=3245;
select * from teacher;

alter table course 
rename courses;

-- 102
-- create table for student above 90  
create table excellent_students 
select * from student where gpa>90;

-- create table for student less than 60
create table failing_students
select * from student where gpa<60;

-- show students name start with A
select student_name from student 
where student_name like "A%";

-- show students name with four letters
select student_name from student 
where student_name like "____";
 
 -- use min, max, and avg on gpa and explain each one 
 
 -- min to show the least gpa 
 select min(gpa) from student;
 
 -- max to show the best gpa 
 select max(gpa) from student;
 
 -- avg to show the average gpa for all students
 select avg(gpa) from student;
 
 -- show students in level 6 that got full mark== 100 gpa
 select * from student 
 where student_level=6 and gpa=100;
 
 -- show student in level 1 and their age are 15 and 16 
SELECT DATEDIFF(CURRENT_DATE(), birthdate ) div 365 AS Date_Diff 
from student
having Date_Diff in (15,16);

-- show students at level 2
select * from student 
where student_level=2;

-- show majors of students without repetition
select distinct student_major from student;

-- show course names in upperclass
select upper(course_name) from courses;

-- show gpa avg then round the number to nearest less number using without using avg function
select round(sum(gpa) div count(student_id)) from student;

-- change f and m with female and male using string functions
alter table student
modify student_gender varchar(255);

alter table student 
drop check student_chk_1 ;

update student
set student_gender = concat('f','emale')
where student_gender='f';

update student
set student_gender = concat('m','ale')
where student_gender='m';

-- add 5 marks to all student who have less than 60
update student 
set gpa = gpa+5
where gpa<60;
