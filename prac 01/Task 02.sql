/* -------------------Task 1
‰„—Â „?«‰ —„ Ê Å«?«‰ —„ À» 
*/
use MYDB
go
declare @studentId as int
declare @term as int
declare @grade as int
declare @year as int
set @studentId = 1;
set @term = 1;
set @grade = 15;
set @year = 2019;

select fn.StudentCourseID , ce.CourseExamId into temp 
from func_studentCourses(@studentId , @term , @year) as fn
inner join course_exams as ce on ce.CourseTermId = fn.CourseTermId
--select * from temp

insert into student_scores (StudentCourseId , CourseExamId , Grade) 
select * , @grade from temp

drop table temp