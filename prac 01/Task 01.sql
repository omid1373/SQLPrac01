/* -------------------Task 1
How many Courses in one term for each Student?
*/
create function func_studentCourses(@id int)
returns TABLE
AS
return(select s.* , c.name , c.term from students s 
inner join student_courses sc on s.id = sc.student_id
inner join courses c on sc.course_id = c.id
)
go

-------------------------Data fake Generator
truncate table students
go
truncate table student_courses
go
truncate table courses
go
insert into students (first_name,last_name ,national_id )values
('mamad' , 'mamadian' , '3263659859'),
('naser' , 'naserian' , '5495959527'),
('ahmad' , 'ahmadian' , '0012195959')
go
insert into courses (name,book,term) values
('Literature' , 'Farsi' , 'First'),
('Literature' , 'Arabic' , 'Second'),
('Math' , 'Algebra' , 'First'),
('Math' , 'Geometry' , 'Second')
go
insert into student_courses (course_id,student_id) values
(1,1),
(1,2),
(1,3),
(3,1),
(2,2)

select * from students
go
select * from courses
go
select * from student_courses