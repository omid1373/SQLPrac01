use MYDB
go 
alter proc CV01 @year int, @studentId int
as
begin
	declare @total nvarchar(20)
	declare @CV nvarchar(10)
	set @total = 'Total Average :';
	set @CV = '---CV---';
	
	select * from students where StudentId = @studentId;
	with cte_CV
	as(
	select c.Name as CourseName ,c.Book, AVG(ss.Grade) as Grade , c.Credit , t.TermNumber
		, case
		when AVG(ss.Grade)<10 then 'Failed'
		else 'Passed'
		end 
		 as CourseStatus
		from student_scores as ss
		inner join student_courses as sc on sc.StudentCourseId = ss.StudentCourseId
		inner join students as s on s.StudentId = sc.StudentId
		inner join course_terms as ct on ct.CourseTermId = sc.CourseTermId
		inner join courses as c on c.CourseId = ct.CourseId
		inner join terms as t on t.TermID = ct.TermId
		where t.Year = @year and s.StudentId = @studentId
		group by c.CourseId , c.Credit ,c.Name ,c.Book, t.TermNumber
	)
	select * from cte_CV 
	union 
	select @CV , @total , SUM(Grade*Credit)/SUM(Credit) , SUM(Credit) , @year 
		, Case
			when SUM(Grade*Credit)/SUM(Credit) < 12 then 'ãÔÑæØ'
			else 'ÞÈæá'
			end
		from cte_CV 
end
go



use MYDB
go 
declare @year int
declare @studentId int
set @year = 2019;
set @studentId = 1;

exec CV01 @year , @studentId;