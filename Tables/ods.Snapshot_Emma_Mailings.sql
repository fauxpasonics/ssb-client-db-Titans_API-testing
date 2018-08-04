CREATE TABLE [ods].[Snapshot_Emma_Mailings]
(
[Emma_MailingsSK] [int] NOT NULL IDENTITY(1, 1),
[MailingType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendStarted] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingStatus] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Month] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReplyTo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Year] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartedorFinished] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Disabled] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedTS] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sender] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlaintextOnly] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hour] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentMailingID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FailureMessage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Day] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendFinished] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Datacenter] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SignupFormID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_Mailings] ADD CONSTRAINT [PK__Snapshot__3D335633551F4719] PRIMARY KEY CLUSTERED  ([Emma_MailingsSK])
GO
