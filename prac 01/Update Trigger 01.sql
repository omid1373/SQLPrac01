use MYDB
go
--------------- Trigger school
create trigger tr_U_school
on schools
after update
as
  update dbo.schools
  SET schools.UpdatedAt = GETDATE()
  FROM Inserted i
  WHERE schools.SchoolId = i.SchoolId
go 
/*
--------------- Trigger exam
create trigger tr_U_exam
on exams
after update
as
  update dbo.exams
  SET exams.UpdatedAt = GETDATE()
  FROM Inserted i
  WHERE exams.id = i.id
go */
--------------- Trigger course
create trigger tr_U_course
on courses
after update
as
  update dbo.courses
  SET courses.UpdatedAt = GETDATE()
  FROM Inserted i
  WHERE courses.CourseId = i.CourseId
go 
--------------- Trigger student
create trigger tr_U_student
on students
after update
as
  update dbo.students
  SET students.UpdatedAt = GETDATE()
  FROM Inserted i
  WHERE students.StudentId = i.StudentId
go 
--------------- Trigger teacher
create trigger tr_U_teacher
on teachers
after update
as
  update dbo.teachers
  SET teachers.UpdatedAt = GETDATE()
  FROM Inserted i
  WHERE teachers.TeacherId = i.TeacherId