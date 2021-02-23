SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, 
CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;
SET NUMERIC_ROUNDABORT OFF;
GO

:setvar path C:\Users\Administrator\Documents\SQL Server Management Studio\Projects\solution prac 01\prac 01
:r $(path)\Drop Tables 01.sql
exec clientreport

/*go
:r $(path)\Drop Tables 02.sql
go
:r $(path)\Create Table 01.sql
go
:r $(path)\Create Table 02.sql/*
:r $(path)\Insert Trigger 01.sql
:r $(path)\Insert Trigger 02.sql
:r $(path)\Update Trigger 01.sql
:r $(path)\Update Trigger 02.sql
*/