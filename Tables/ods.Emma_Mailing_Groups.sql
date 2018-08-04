CREATE TABLE [ods].[Emma_Mailing_Groups]
(
[MailingID] [bigint] NOT NULL,
[GroupID] [bigint] NOT NULL,
[GroupName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__1A0AC1F4] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__1AFEE62D] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__1BF30A66] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__1CE72E9F] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_Mailing_GroupsUpdate] ON [ods].[Emma_Mailing_Groups]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_Mailing_Groups] t
	JOIN inserted i ON  t.[MailingID] = i.[MailingID] AND t.[GroupID] = i.[GroupID]

INSERT INTO [ods].[Snapshot_Emma_Mailing_Groups] ([MailingID],[GroupID],[GroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_Mailing_Groups] ADD CONSTRAINT [PK__Emma_Mai__930519EA0BAABC4A] PRIMARY KEY CLUSTERED  ([MailingID], [GroupID])
GO
