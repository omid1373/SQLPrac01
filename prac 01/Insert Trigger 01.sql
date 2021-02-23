use MYDB
go
--------------- Trigger school
create trigger tr_C_school
on schools
after insert
as
  update dbo.schools
  SET schools.CreatedAt = GETDATE()
  FROM Inserted i
  WHERE schools.SchoolId = i.SchoolId
go
 /*
--------------- Trigger exam
create trigger tr_C_exam
on exams
after insert
as
  update dbo.exams
  SET exams.CreatedAt = GETDATE()
  FROM Inserted i
  WHERE exams.id = i.id
go */
--------------- Trigger course
create trigger tr_C_course
on courses
after insert
as
  update dbo.courses
  SET courses.CreatedAt = GETDATE()
  FROM Inserted i
  WHERE courses.CourseId = i.CourseId
go 
--------------- Trigger student
create trigger tr_C_student
on students
after insert
as
  update dbo.students
  SET students.CreatedAt = GETDATE()
  FROM Inserted i
  WHERE students.StudentId = i.StudentId
go 
--------------- Trigger teacher
create trigger tr_C_teacher
on teachers
after insert
as
  update dbo.teachers
  SET teachers.CreatedAt = GETDATE()
  FROM Inserted i
  WHERE teachers.TeacherId = i.TeacherId