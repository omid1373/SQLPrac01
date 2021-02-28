use MYDB
go
alter table ztest01 rebuild


use MYDB
go
declare @iterate nvarchar(10)
declare @i int
declare @name nvarchar(15)
declare @ContactNumber nvarchar(12)
declare @address nvarchar(20)
declare @year int
declare @baseId int
declare @roleId int
declare @value nvarchar(10)
set @i = 0;
set @year = 2000;
begin tran
while @i < 10000000
begin
	set @iterate = CAST(@i as nvarchar);
	set @name  = 'Ali ' + @iterate;
	set @address  = 'Vanak ' + @iterate;
	set @ContactNumber  =  @iterate;
	set @i = @i + 1;
	set @baseId = FLOOR(RAND()*1000000+1);
	set @roleId = FLOOR(RAND()*1000+1);
	set @value = '$ ' + CAST((@baseId - 20) as nvarchar)
	if @i % 1000 =1 
	begin
		commit tran
		begin tran
	end
	insert into ztest01 (Name , Address , ContactNumber , year , CreatedAt , UpdatedAt
		, BaseId , RoleId , value)
		values (@name , @address, @ContactNumber , @year, GETDATE() ,GETDATE()
			, @baseId , @roleId , @value)
end;
commit tran
go


use MYDB
go

set statistics io on
select z.testId , z.value from ztest01 as z
inner join students as s on s.StudentId = z.RoleId
 where BaseId = 5 --and RollId >= 500