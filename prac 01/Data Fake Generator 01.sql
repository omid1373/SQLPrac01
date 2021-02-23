use MYDB
go

-------------------------Data fake Generator
insert into schools (Name,ContactNumber,Principal)values
('Fargam' , '02165698541' , 'Mamadian'),
('Laleh' , '021656932145' , 'Rezaeeian')
go
insert into students (SchoolId,FirstName,LastName ,NationalId )values
( 1 ,'mamad' , 'mamadian' , '3263659859'),
(1 ,'naser' , 'naserian' , '5495959527'),
(2 ,'ahmad' , 'ahmadian' , '0012195959'),
(2 ,'omid' , 'omidian' , '5656568888'),
(2 ,'abbas' , 'abbasian' , '0012222222')
go
insert into courses (Name, Book) values
('Literature' , 'Farsi'),
('Literature' , 'Arabic'),
('Math' , 'Algebra'),
('Math' , 'Geometry'),
('Physics','Electonics'),
('Physics','Mechanics')
go
insert into terms(TermNumber,Year) values
(1,2019),
(2,2019),
(1,2020),
(2,2020),
(1,2021),
(2,2021)
go
insert into course_terms(CourseId,TermId) values
(1,1),
(1,2),
(1,3),
(3,1),
(2,2),
(5,4),
(4,5),
(6,6),
(3,3)
go
insert into student_courses (StudentId , CourseTermId) values
(1,1),
(1,4),
(1,2),
(1,3),
(1,5),
(2,4),
(2,1),
(2,6),
(5,7),
(4,8),
(2,3),
(3,2)
go
select * from schools
go
select * from students
go
select * from courses
go
select * from terms
go 
select * from course_terms
go 
select * from student_courses