/* -------------------Task 1
‰„—Â „?«‰ —„ Ê Å«?«‰ —„
*/
use MYDB
go
create function func_studentCourses(@id int) 
returns TABLE
AS
return(select s.* from students s
inner join student_courses sc on s.StudentId = sc.StudentId
where 
)
go

select * from func_studentCourses(3,2,2019)