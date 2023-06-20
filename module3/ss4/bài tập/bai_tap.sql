USE student_academy_management;
select *
from subject
where creadit = (SELECT MAX(creadit) FROM subject);
select *
from subject
join mark on mark.subject_id = subject.subject_id
where mark.mark = (SELECT MAX(mark.mark) FROM mark);
select student.student_name,student.address,student.phone,student.status,AVG(mark.mark) as mark_avg
from student
join mark on mark.StudentId = student.StudentId
group by student.student_id
order by mark_avg;
