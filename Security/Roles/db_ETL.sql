CREATE ROLE [db_ETL]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'db_ETL', N'svcssbrp'
GO
GRANT EXECUTE TO [db_ETL]
