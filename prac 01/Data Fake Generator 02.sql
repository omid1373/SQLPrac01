use MYDB
go

-------------------------Data fake Generator
insert into teachers (FirstName,LastName)values
('Javad' , 'Ezzati'),
('Behnam' , 'Baani'),
('Maryam','Mirzaakhani')
go
insert into school_teachers(SchoolId, TeacherId) values
(1,1),
(2,2),
(1,3),
(2,2)
go
insert into teacher_courses(TeacherId , CourseId) values
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6)
go
select * from teachers
go
select * from school_teachers
go
select * from teacher_courses
go