CREATE TABLE [ods].[Snapshot_Emma_Mailing_Links]
(
[Emma_Mailing_LinksSK] [int] NOT NULL IDENTITY(1, 1),
[MailingID] [bigint] NULL,
[LinkID] [bigint] NULL,
[LinkName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinksPlainText] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkTarget] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkOrder] [int] NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_Mailing_Links] ADD CONSTRAINT [PK__Snapshot__154C51A5C444D104] PRIMARY KEY CLUSTERED  ([Emma_Mailing_LinksSK])
GO
