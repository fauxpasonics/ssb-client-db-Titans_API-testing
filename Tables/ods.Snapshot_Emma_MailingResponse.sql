CREATE TABLE [ods].[Snapshot_Emma_MailingResponse]
(
[Emma_MailingResponseSK] [int] NOT NULL IDENTITY(1, 1),
[MailingID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_MailingResponse] ADD CONSTRAINT [PK__Snapshot__0A7CB9965836D83F] PRIMARY KEY CLUSTERED  ([Emma_MailingResponseSK])
GO
