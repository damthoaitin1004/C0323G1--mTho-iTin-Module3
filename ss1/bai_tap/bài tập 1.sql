create database `student_management`;
use `student_management`;
create table student (id int primary key auto_increment,
 `name` varchar(200),
 age int,
 country varchar(200));
 select *
 from student;
 insert into student (`name`,age,country)
 value ("Tin",26,"Việt Nam"),("Trí",28,"Việt Nam");
create table teacher (id int primary key auto_increment
, name varchar(200),
age int,
country varcharacter(200));
select *
from teacher;
insert into teacher(`name`,age,country)
value("Trung TVH",29,"Việt Nam"),("HẢi TT",26,"Việt Nam");
delete from teacher
where id = 1;
create table class(id int primary key auto_increment
, student varchar(200));

