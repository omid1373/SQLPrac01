/*
Missing Index Details from Test Table 01.sql - (local).MYDB (HAVADES2-PC\Administrator (55))
The Query Processor estimates that implementing the following index could improve the query cost by 61.1873%.
*/


USE [MYDB]
GO
CREATE NONCLUSTERED INDEX idx_1
ON [dbo].[ztest01] ([Address])
GO
