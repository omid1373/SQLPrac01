/* -------------------Task 7
ò«—‰«„Â œ—”?
*/
/*
use MYDB
go
declare @termId int
set @termId = 6;

select ct.CourseId , AVG(ss.Grade) as Average from course_terms as ct
inner join course_exams as ce on ce.CourseTermId = ct.CourseTermId
inner join student_scores as ss on ss.CourseExamId = ce.CourseExamId
where ct.TermId = @termId
group by ct.CourseId
*/
use MYDB
go

create procedure AvgCourse07 @courseId int , @termId int
as
select sc.StudentId ,SUM(ss.Grade * c.Credit)/SUM(c.Credit) as Average
from student_scores as ss 
inner join student_courses as sc on sc.StudentCourseId = ss.StudentCourseId 
inner join course_terms as ct on sc.CourseTermId = (
	select top 1 ct.CourseTermId from course_terms as ct 
	where ct.CourseId = @courseId and ct.TermId = @termId
	order by ct.CreatedAt desc)
inner join courses as c on c.CourseId = @courseId
group by sc.StudentId
go


------------------------Test----------------------

use MYDB
go
declare @courseId int
declare @termId int
set @courseId = 1;
set @termId = 2;


exec AvgCourse07 @courseId , @termId;