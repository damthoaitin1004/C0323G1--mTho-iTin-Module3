USE QuanLySinhVien;
-- --Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ 
select *
from Student
where StudentName like "h%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from Class
where  timestampdiff(MONTH,StartDate,curdate()) >11 ;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from Subject
where Credit >= 3 and Credit <= 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
select*
from student
where StudentName ="hung";
set sql_safe_updates = 0;
set sql_safe_updates = 1;
update student
set ClassId = 2
where StudentName = "hung";
select s.StudentName,j.SubName,m.Mark
from mark m
join student s on m.StudentId = s.StudentId
join subject j on m.SubId = j.SubId
order by m.Mark desc;