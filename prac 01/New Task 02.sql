use MYDB
go

create proc presentedCourses02 @termId int , @studentId int
as
begin
	select s.FirstName , s.LastName , c.Name as CourseName , c.Book , c.Credit
		, t.TermNumber ,t.Year , AVG(ss.Grade) as Grade
		 from course_terms as ct
		inner join courses as c on c.CourseId = ct.CourseId
		inner join terms as t on t.TermID = ct.TermId
		left join (
			student_courses as sc
			inner join students as s on s.StudentId = sc.StudentId
			left join student_scores as ss on ss.StudentCourseId = sc.StudentCourseId
			) on sc.CourseTermId = ct.CourseTermId
				and s.StudentId = @studentId
		where ct.TermId = @termId 
		group by c.Name , c.Book , c.Credit , t.TermNumber ,t.Year
			, s.FirstName , s.LastName 
end
go

use MYDB
go
declare @termId int
declare @studentId int
set @studentId = 3;
set @termId = 1;

execute presentedCourses02 @termId , @studentId

select * from course_terms as ct where ct.TermId = @termId
