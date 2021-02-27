use MYDB
go
create index ind_ztest on ztest01(Name);



set statistics io on
select * from ztest01 as z where z.Name like '%1500000%'
