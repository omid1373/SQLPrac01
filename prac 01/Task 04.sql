/* -------------------Task 4
„?«‰ê?‰ ‰„—«  œ«‰‘ ¬„Ê“«‰ œ— ¬‰ œ—” Â« çﬁœ— Â” 
*/
/*
use MYDB
go
declare @from datetime
declare @to datetime
set @from = GETDATE() - 10
set @to = GETDATE();

select fn.CourseId , AVG(ss.Grade) from func_examInterval(@from, @to) as fn
inner join student_scores as ss on ss.CourseExamId = fn.CourseExamId
inner join student_courses as sc on sc.StudentCourseId = ss.StudentCourseId
group by fn.CourseId
*/
use MYDB
go

create procedure AVGInterval04 @from datetime , @to datetime
as
begin
	select ce.CourseExamId , AVG(ss.Grade)
		from student_scores as ss 
		inner join course_exams as ce on ce.CourseExamId = ss.CourseExamId
		inner join course_terms as ct on ct.CourseTermId = ce.CourseTermId
		--inner join courses as c on c.CourseId = ct.CourseId
		where ce.CreatedAt between @from and @to
		group by ce.CourseExamId
end
go


------------------------Test----------------------

use MYDB
go
declare @from datetime
declare @to datetime
set @from = DATEADD( MINUTE , -100 ,GETDATE())
set @to = GETDATE();

exec AVGInterval04 @from , @to;