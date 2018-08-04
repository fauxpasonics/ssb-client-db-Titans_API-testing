CREATE TABLE [ods].[Emma_Groups]
(
[ActiveCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeletedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptoutCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberGroupID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PurgedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GroupName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Grou__ETL_C__0169315C] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Grou__ETL_C__025D5595] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Grou__ETL_U__035179CE] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Grou__ETL_U__04459E07] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_GroupsUpdate] ON [ods].[Emma_Groups]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_Groups] t
	JOIN inserted i ON  t.[MemberGroupID] = i.[MemberGroupID] AND t.[AccountID] = i.[AccountID]

INSERT INTO [ods].[Snapshot_Emma_Groups] ([ActiveCount],[DeletedAt],[ErrorCount],[OptoutCount],[GroupType],[MemberGroupID],[PurgedAt],[AccountID],[GroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_Groups] ADD CONSTRAINT [PK__Emma_Gro__ABEFA0F9EF8B4C8B] PRIMARY KEY CLUSTERED  ([MemberGroupID], [AccountID])
GO
