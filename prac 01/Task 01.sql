/* -------------------Task 1
How many Courses in one term for each Student?

create function func_studentCourses(@id int)
returns TABLE
AS
return(select s.* , c.Name , c.Term from students s 
inner join student_courses sc on s.StudentId = sc.StudentId
inner join courses c on sc.Cou = c.CourseId
)
go
*/
