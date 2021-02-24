/* -------------------Task 5
ò«—‰«„Â  —„?
*/
use MYDB
go
declare @termId int
declare @studentId int
set @termId = 1;
set @studentId = 1;

select ct.CourseId , AVG(ss.Grade) as Average from course_terms as ct
inner join courses as c on c.CourseId = ct.CourseId
inner join student_courses as sc on sc.CourseTermId = ct.CourseId
inner join student_scores as ss on ss.StudentCourseId = sc.StudentCourseID
where ct.TermId = @termId and sc.StudentId = @studentId
group by ct.CourseId