CREATE TABLE [ods].[Snapshot_Emma_MailingDetails]
(
[Emma_MailingDetailsSK] [int] NOT NULL IDENTITY(1, 1),
[MailingID] [bigint] NULL,
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
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_MailingDetails] ADD CONSTRAINT [PK__Snapshot__D1FAF23F824E6FAD] PRIMARY KEY CLUSTERED  ([Emma_MailingDetailsSK])
GO
