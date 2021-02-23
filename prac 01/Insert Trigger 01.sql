use MYDB
go
--------------- Trigger school
create trigger tr_C_school
on schools
after insert
as
  update dbo.schools
  SET schools.created_at = GETDATE()
  FROM Inserted i
  WHERE schools.id = i.id
go 
--------------- Trigger exam
create trigger tr_C_exam
on exams
after insert
as
  update dbo.exams
  SET exams.created_at = GETDATE()
  FROM Inserted i
  WHERE exams.id = i.id
go 
--------------- Trigger course
create trigger tr_C_course
on courses
after insert
as
  update dbo.courses
  SET courses.created_at = GETDATE()
  FROM Inserted i
  WHERE courses.id = i.id
go 
--------------- Trigger student
create trigger tr_C_student
on students
after insert
as
  update dbo.students
  SET students.created_at = GETDATE()
  FROM Inserted i
  WHERE students.id = i.id
go 
--------------- Trigger teacher
create trigger tr_C_teacher
on teachers
after insert
as
  update dbo.teachers
  SET teachers.created_at = GETDATE()
  FROM Inserted i
  WHERE teachers.id = i.id