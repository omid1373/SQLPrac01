create trigger tr_C_school
on schools
after insert
as
  update dbo.schools
  SET schools.created_at = GETDATE()
  FROM Inserted i
  WHERE schools.id = i.id
go 
create trigger tr_U_school
on schools
after update
as
  update dbo.schools
  SET schools.updated_at = GETDATE()
  FROM Inserted i
  WHERE schools.id = i.id
go

insert into schools (name,address,contact_number)
values ('pop ddup','bjnlgbdtihjeptgepgio','09121234567')
,('pop pppppp','fgsogjsdoiosrjio','09121234555')

update schools set name = 'grgrt' 
where address = 'bjnlgbdtihjeptgepgio'

select * from schools