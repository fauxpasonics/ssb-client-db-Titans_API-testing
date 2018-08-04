CREATE TABLE [ods].[Emma_MemberActions]
(
[Timestamp] [datetime2] NOT NULL,
[Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AccountID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MemberID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ResourceURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SignupFormID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MailingID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GroupID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NewStatus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_C__20C19E9E] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_C__21B5C2D7] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_U__22A9E710] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_U__239E0B49] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_MemberActionsUpdate] ON [ods].[Emma_MemberActions]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_MemberActions] t
	JOIN inserted i ON  t.[Timestamp] = i.[Timestamp] AND t.[Type] = i.[Type] AND t.[AccountID] = i.[AccountID] AND t.[MemberID] = i.[MemberID] AND t.[ResourceURL] = i.[ResourceURL] AND t.[SignupFormID] = i.[SignupFormID] AND t.[MailingID] = i.[MailingID] AND t.[GroupID] = i.[GroupID]

INSERT INTO [ods].[Snapshot_Emma_MemberActions] ([Timestamp],[Type],[AccountID],[MemberID],[ResourceURL],[SignupFormID],[MailingID],[GroupID],[NewStatus],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_MemberActions] ADD CONSTRAINT [PK__Emma_Mem__8831387C2764AD6B] PRIMARY KEY CLUSTERED  ([Timestamp], [Type], [AccountID], [MemberID], [ResourceURL], [SignupFormID], [MailingID], [GroupID])
GO
