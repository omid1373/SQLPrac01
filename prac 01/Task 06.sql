/* -------------------Task 6
Â— „⁄·„ œ—  —„ çÂ œ—Ê”?ø
*/
use MYDB
go

create proc TeacherCourses06 @termId int, @TeacherId int
as
select tc.TeacherId  ,ct.TermId , c.CourseId , c.Name , c.Book , c.Credit
,tc.CreatedAt , tc.UpdatedAt
from courses as c
inner join teacher_courses as tc on c.CourseId = tc.CourseId
inner join course_terms as ct on ct.CourseId = c.CourseId
where tc.TeacherId = @teacherId 
	and ct.TermId = @termId
go

declare @teacherId int
declare @termId int
set @teacherId = 3;
set @termId = 4;

exec TeacherCourses06 @termId , @TeacherId
