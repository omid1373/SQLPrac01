/* -------------------Task 6
åÑ ãÚáã ÏÑ ÊÑã å ÏÑæÓ?¿
*/
use MYDB
go
declare @teacherId int
declare @termId int
set @teacherId = 2;
set @termId = 1;

select c.* from courses as c
inner join teacher_courses as tc on c.CourseId = tc.CourseId
inner join course_terms as ct on ct.CourseId = c.CourseId
where tc.TeacherId = @teacherId 
	and ct.TermId = @termId