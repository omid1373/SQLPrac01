/* -------------------Task 7
ò«—‰«„Â œ—”?
*/
use MYDB
go
declare @termId int
set @termId = 6;

select ct.CourseId , AVG(ss.Grade) as Average from course_terms as ct
inner join course_exams as ce on ce.CourseTermId = ct.CourseTermId
inner join student_scores as ss on ss.CourseExamId = ce.CourseExamId
where ct.TermId = @termId
group by ct.CourseId