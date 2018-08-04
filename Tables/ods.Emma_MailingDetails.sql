CREATE TABLE [ods].[Emma_MailingDetails]
(
[MailingID] [bigint] NOT NULL,
[SendStarted] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SignupFormID] [bigint] NULL,
[PlainText] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientCount] [int] NULL,
[PublicWebviewURL] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingType] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [bigint] NULL,
[MailingStatus] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sender] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendFinished] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendAt] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReplyTo] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HTMLBody] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__40306ADC] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__41248F15] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__4218B34E] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__430CD787] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_MailingDetailsUpdate] ON [ods].[Emma_MailingDetails]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_MailingDetails] t
	JOIN inserted i ON  t.[MailingID] = i.[MailingID]

INSERT INTO [ods].[Snapshot_Emma_MailingDetails] ([MailingID],[SendStarted],[SignupFormID],[PlainText],[RecipientCount],[PublicWebviewURL],[MailingType],[AccountID],[MailingStatus],[Sender],[Name],[SendFinished],[SendAt],[ReplyTo],[Subject],[HTMLBody],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_MailingDetails] ADD CONSTRAINT [PK__Emma_Mai__224CB6DA09FBB1D4] PRIMARY KEY CLUSTERED  ([MailingID])
GO
