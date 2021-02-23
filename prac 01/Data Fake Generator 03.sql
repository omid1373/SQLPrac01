use MYDB
go

-------------------------Data fake Generator
insert into exams (ExamType)values
('Mid Term'),
('Final')
go
insert into course_exams(ExamId,CourseTermId) values
(1,1),
(1,2),
(1,3),
(1,6),
(1,7),
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7)
go
insert into student_scores(StudentCourseId,CourseExamId,Grade) values
(1,1,10), (1,2,12), (2,3,14.85), (2,4,15), (3,5,9), (3,6,8.5),
(2,12,10.6), (5,11,16), (5,10,15.5), (4,9,20), (4,8,17), (4,7,10),
(6,1,15), (6,2,18), (6,3,12.5), (6,4,14.6), (3,5,13.8), (1,6,18),
(8,12,10), (8,11,11.75), (7,10,12), (7,9,14.5), (5,8,15), (3,7,16),
(8,2,10), (8,1,11.2), (9,4,13), (9,5,11), (9,3,18), (5,6,16.5),
(4,9,20), (4,7,19), (5,8,18), (3,8,18.5), (1,12,17.8), (2,10,19.2)
go
select * from exams
go
select * from course_exams
go
select * from student_scores
go