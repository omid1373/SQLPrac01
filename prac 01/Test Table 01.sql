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
declare @name nvarchar(15)
declare @ContactNumber nvarchar(12)
declare @address nvarchar(20)
declare @year int
set @i = 0;
set @year = 2000;
begin tran
while @i < 1000000
begin
	set @iterate = CAST(@i as nvarchar);
	set @name  = 'Ali ' + @iterate;
	set @address  = 'Vanak ' + @iterate;
	set @ContactNumber  =  @iterate;
	set @i = @i + 1;
	if @i % 1000 =1 
	begin
		commit tran
		begin tran
	end
	insert into ztest01 (Name , Address , ContactNumber , year , CreatedAt , UpdatedAt)
		values (@name , @address, @ContactNumber , @year, GETDATE() ,GETDATE())
end;
commit tran
go

select  COUNT(*) as Z_Test_Table_01_Count from ztest01

select top 100 *  from ztest01 order by CreatedAt desc

set statistics io on
select * from ztest01 where Address like 'Vanak 269977'


update ztest01 set Address = Address + '.'