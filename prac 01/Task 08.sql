/*
ãÚÏá ÓÇáÇäå
*/
use MYDB
go
create proc AnnualAvg08 @studentId int, @year int
as
select sc.StudentId , SUM(ss.Grade * c.Credit)/SUM(c.Credit) as Average
from student_courses as sc
inner join student_scores as ss on ss.StudentCourseId = sc.StudentCourseID
inner join course_terms as ct on ct.CourseTermId = sc.CourseTermId
inner join terms as t on t.TermID = ct.TermId
inner join courses as c on c.CourseId = ct.CourseId
where sc.StudentId = @studentId and t.Year = @year
group by sc.StudentId
go

------------------------Test----------------------

use MYDB
go
declare @year int
declare @studentId int
set @studentId = 2;
set @year = 2019;

exec AnnualAvg08 @studentId , @year;