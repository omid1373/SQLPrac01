/* -------------------Task 3
œ— »«“Â “„«‰? çÂ œ—Ê”? «„ Õ«‰ ê—› Â ‘œÂ «” 
*/
use MYDB
go

create function func_examInterval(@begin datetime, @end datetime) 
returns TABLE
AS
return(select c.* , e.*, ce.CourseExamId from course_exams as ce
inner join course_terms as ct on ct.CourseTermId = ce.CourseTermId
inner join courses as c on c.CourseId = ct.CourseId
inner join exams as e on e.ExamID = ce.ExamId
where ce.CreatedAt between @begin and @end 
)
go

use MYDB
go

declare @from datetime
declare @to datetime
set @from = DATEADD( DAY , -10 ,GETDATE())
set @to = GETDATE();

select * from func_examInterval(@from , @to)