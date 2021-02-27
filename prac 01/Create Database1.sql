-- =============================================
-- Create database template
-- =============================================
USE master
GO

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'<MYDB, sysname, MYDB>'
)
DROP DATABASE MYDB, sysname, MYDB
GO

USE master; 
GO 
CREATE DATABASE  MYDB 
ON      ( NAME = MYDB, FILENAME = 'C:\Users\Administrator\Documents\DataBase\MYDB.mdf') 
LOG ON  ( NAME = MYDB, FILENAME = 'C:\Users\Administrator\Documents\DataBase\MYDB.ldf'); 
GO