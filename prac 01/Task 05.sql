/* -------------------Task 5
ò«—‰«„Â  —„?
*/
use MYDB
go

create proc TermicAvg05 @termId int
as
select sc.StudentId ,SUM(ss.Grade*c.Credit)/SUM(c.Credit) as TermicAverage from student_courses as sc
inner join course_terms as ct on ct.CourseTermId = sc.CourseTermId
inner join courses as c on c.CourseId = ct.CourseId
inner join student_scores as ss on ss.StudentCourseId = sc.StudentCourseID
where ct.TermId = @termId
group by sc.StudentId
go 

------------------------Test----------------------
use MYDB
go
declare @termId int
set @termId = 1;


exec TermicAvg05 @termId;