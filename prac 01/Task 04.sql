/* -------------------Task 4
œ— »«“Â “„«‰? çÂ œ—Ê”? «„ Õ«‰ ê—› Â ‘œÂ «” 
*/
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