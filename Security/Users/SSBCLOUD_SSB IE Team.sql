IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SSBCLOUD\SSB IE Team')
CREATE LOGIN [SSBCLOUD\SSB IE Team] FROM WINDOWS
GO
CREATE USER [SSBCLOUD\SSB IE Team] FOR LOGIN [SSBCLOUD\SSB IE Team]
GO