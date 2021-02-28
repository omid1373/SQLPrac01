use MYDB
go
drop type grade
go
create type grade from float NULL
go

drop rule grade_rule
go
create rule grade_rule
as
@grade >= 0
and @grade <= 20
go

exec sp_unbindrule 'grade';
go
exec sp_bindrule 'grade_rule' , 'grade'
go



use MYDB
go
create trigger tr_before_insert_score
on student_scores
INSTEAD OF insert
as
	declare @grade grade
	set @grade = (select grade from inserted);
	if @grade >=0 and @grade <= 20
		insert into student_scores (StudentCourseId ,CourseExamId , Grade) 
			select  StudentCourseId ,CourseExamId ,Grade 
			FROM Inserted i 
	else
		  RAISERROR (N'Grade range is between 0 to 20' ,11,1);  
		
go 