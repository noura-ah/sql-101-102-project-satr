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

insert into student values (1234567899,'Ahmed','1993-02-11','m','2021-02-17','ahmed@gmail.com',6,'scientific',5),
(1233567899,'huda','1993-05-11','f','2021-02-17','huda@gmail.com',5,'scientific',4.9),
(1234562199,'sara','1998-02-01','f','2021-02-17','sara@gmail.com',2,'scientific',3.5);
select * from student;

insert into teacher values (3245,'saleh','1880-02-11','m','saleh@gmail.com','36411932'),
(3246,'aziz','1883-02-11','m','aziz@gmail.com','36411932'),
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
