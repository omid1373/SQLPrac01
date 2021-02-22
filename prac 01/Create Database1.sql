-- =============================================
-- Create database template
-- =============================================
USE master
GO

-- Drop the database if it already exists
IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'<MYDB, sysname, MYDB>'
)
DROP DATABASE MYDB, sysname, MYDB
GO

CREATE DATABASE MYDB
GO