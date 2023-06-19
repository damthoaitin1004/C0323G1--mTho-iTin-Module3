USE student_academy_management;
select *
from Subject
where credit = (SELECT MAX(credit) FROM Subject);
select *
from Subject
join Mark on Mark.SubId = Subject.SubId
where Mark.Mark = (SELECT MAX(Mark.Mark) FROM Mark);
select Student.StudentName,Student.Address,Student.Phone,Student.Status,AVG(Mark.Mark) as mark_avg
from Student
join Mark on Mark.StudentId = Student.StudentId
group by Student.StudentId
order by mark_avg;
