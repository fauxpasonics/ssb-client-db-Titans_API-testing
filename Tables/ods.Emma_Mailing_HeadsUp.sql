CREATE TABLE [ods].[Emma_Mailing_HeadsUp]
(
[MailingID] [bigint] NOT NULL,
[HeadsUpEmail] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HeadsUpEmailsSentTS] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__23942C2E] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__24885067] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__257C74A0] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__267098D9] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_Mailing_HeadsUpUpdate] ON [ods].[Emma_Mailing_HeadsUp]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_Mailing_HeadsUp] t
	JOIN inserted i ON  t.[MailingID] = i.[MailingID] AND t.[HeadsUpEmail] = i.[HeadsUpEmail]

INSERT INTO [ods].[Snapshot_Emma_Mailing_HeadsUp] ([MailingID],[HeadsUpEmail],[HeadsUpEmailsSentTS],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_Mailing_HeadsUp] ADD CONSTRAINT [PK__Emma_Mai__AB4DA2A501649769] PRIMARY KEY CLUSTERED  ([MailingID], [HeadsUpEmail])
GO
