/* -------------------Task 1
‰„—Â „?«‰ —„ Ê Å«?«‰ —„ À» 
*/
/*
use MYDB
go
declare @studentId as int
declare @term as int
declare @grade as int
declare @year as int
set @studentId = 100;
set @term = 1;
set @grade = 15;
set @year = 2019;
declare @StudentCourseID int
declare @CourseExamId int

select  @StudentCourseID = fn.StudentCourseID ,@CourseExamId = ce.CourseExamId 
from func_studentCourses(@studentId , @term , @year) as fn
inner join course_exams as ce on ce.CourseTermId = fn.CourseTermId
--select * from temp

insert into student_scores (StudentCourseId , CourseExamId , Grade)
select @StudentCourseID , @CourseExamId , @grade
*/


use MYDB
go
--@courseTermId from prevoius step
create proc InsertGrades02 @studentId int
	, @courseTermId int , @examId int, @grade grade
as
declare @CourseExamId int
declare @StudentCourseId int
set @StudentCourseId = 0;
select @StudentCourseId = sc.StudentCourseId from student_courses as sc
	where sc.StudentId = @studentId and sc.CourseTermId = @courseTermId;
	
if not exists(select 1 from students as s where s.StudentId = @studentId)
	RAISERROR ('Student with this ID does not exists !!!',16,1);
else if (@StudentCourseId = 0)
	RAISERROR ('Student has not taken this course D:',11,1);
else
begin
	select top 1 @CourseExamId = ce.CourseExamId from course_exams as ce
	where ce.ExamId = @examId and ce.CourseTermId = @courseTermId
	
	insert into student_scores (StudentCourseId , CourseExamId , Grade)
	  values (@studentCourseId , @CourseExamId , @grade)
	 
	 print 'Data Inserted !!!';
	 select top 1 * from student_scores as ss
	order by ss.CreatedAt desc
end
go


------------------------Test----------------------
set statistics io on
exec InsertGrades02 @studentId = 1, @courseTermId = 2 , @examId = 1 , @grade = 515.5;



select * from student_scores order by CreatedAt desc