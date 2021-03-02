/* -------------------Task 1

ÈÑÇ? åÑ ÊÑã åÑ ÏÇäÔ ÂãæÒ å ÏÑæÓ ÑÇ ÇäÊÎÇÈ ˜ÑÏå ÇÓÊ
*/
/*
create function func_studentCourses(@id int , @term int , @year int) 
returns TABLE
AS
return(select s.* ,c.Name as CourseName , c.Book , t.TermNumber 
, t.Year , sc.StudentCourseID , sc.CourseTermId
 from students s
inner join student_courses sc on s.StudentId = sc.StudentId
inner join course_terms ct on sc.CourseTermId = ct.CourseTermId 
inner join courses c on c.CourseId = ct.CourseId
inner join terms t on t.TermID = ct.TermId
where t.TermNumber = @term 
	and s.StudentId = @id
	and t.Year = @year
)
go
select * from func_studentCourses(3,2,2019)



-------------------------------Main---
use MYDB
go
create proc TakenCourses01 @termId int , @studentId int
as
 select s.* ,c.Name as CourseName , c.Book 
, sc.StudentCourseId , sc.CourseTermId , ct.CourseTermId
 from students s
inner join student_courses sc on s.StudentId = sc.StudentId
inner join course_terms ct on sc.CourseTermId = ct.CourseTermId 
inner join courses c on c.CourseId = ct.CourseId
where ct.TermId = @termId
	and s.StudentId = @studentId
go
*/
use MYDB
go
------------------------Test----------------------

exec TakenCourses01 @termId = 1 , @studentId = 1;