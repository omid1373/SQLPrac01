/* -------------------Task 1
How many Courses in one term for each Student?
*/
create function func_studentCourses(@id int)
returns TABLE
AS
return(select s.* , c.Name , c.Term from students s 
inner join student_courses sc on s.StudentId = sc.StudentId
inner join courses c on sc.Cou = c.CourseId
)
go

-------------------------Data fake Generator
truncate table student_courses
go
truncate table students
go
truncate table courses
go
insert into students (FirstName,LastName ,NationalId )values
('mamad' , 'mamadian' , '3263659859'),
('naser' , 'naserian' , '5495959527'),
('ahmad' , 'ahmadian' , '0012195959')
go
insert into courses (Name, Book) values
('Literature' , 'Farsi'),
('Literature' , 'Arabic'),
('Math' , 'Algebra'),
('Math' , 'Geometry')
go
insert into terms(TermNumber,Year) values
(1,2020),
(2,2020),
(1,2021),
(2,2021)
go
insert into course_terms(CourseId,Ter) values
(1,1),
(1,2),
(1,3),
(2,1),
(2,2)
go
insert into student_courses (CourseTermId,StudentId) values
(1,1),
(1,2),
(1,3),
(2,1),
(2,2)

select * from students
go
select * from courses
go
select * from student_courses