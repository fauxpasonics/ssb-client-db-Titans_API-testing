CREATE TABLE [ods].[Emma_MailingResponse]
(
[MailingID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Subject] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountPurchased] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Delivered] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Clicked] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Opened] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WebviewShared] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sent] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClickedUnique] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WebviewShareClicked] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shared] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InProgress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SumPurchased] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Forwarded] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptedOut] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SignedUp] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShareClicked] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bounced] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__4D2051A6] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__4E1475DF] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__4F089A18] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__4FFCBE51] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_MailingResponseUpdate] ON [ods].[Emma_MailingResponse]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_MailingResponse] t
	JOIN inserted i ON  t.[MailingID] = i.[MailingID]

INSERT INTO [ods].[Snapshot_Emma_MailingResponse] ([MailingID],[Subject],[CountPurchased],[Delivered],[Clicked],[Opened],[WebviewShared],[RecipientCount],[Sent],[ClickedUnique],[WebviewShareClicked],[Shared],[InProgress],[SumPurchased],[Forwarded],[Name],[OptedOut],[SignedUp],[ShareClicked],[Bounced],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_MailingResponse] ADD CONSTRAINT [PK__Emma_Mai__224CB6DA7C8B53EE] PRIMARY KEY CLUSTERED  ([MailingID])
GO
