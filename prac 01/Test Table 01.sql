use MYDB
go
DROP TABLE ztest01;
go
Create table ztest01(
	testId int identity(1,1) PRIMARY KEY not null,
	Name nvarchar(30) null,
	Address nvarchar(100) null,
	ContactNumber nvarchar(12) null,
	year nvarchar(4) null,
	CreatedAt datetime null,
	UpdatedAt datetime null
)
go

declare @iterate nvarchar(10)
declare @i int
declare @name nvarchar(10)
declare @ContactNumber nvarchar(10)
declare @address nvarchar(10)
declare @year int
set @i = 0;
set @year = 2000;

while @i < 1000000
begin
	set @iterate = CAST(@i as nvarchar);
	set @name  = 'Ali ' + @iterate;
	set @address  = 'Vanak ' + @iterate;
	set @ContactNumber  =  @iterate;
	set @i = @i + 1;
	insert into ztest01 (Name , Address , ContactNumber , year , CreatedAt , UpdatedAt)
		values (@name , @address, @ContactNumber , @year, GETDATE() ,GETDATE())
end;
go


select  COUNT(*) as Z_Test_Table_01_Count from ztest01

