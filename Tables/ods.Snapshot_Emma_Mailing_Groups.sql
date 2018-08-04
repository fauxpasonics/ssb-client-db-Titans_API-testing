CREATE TABLE [ods].[Snapshot_Emma_Mailing_Groups]
(
[Emma_Mailing_GroupsSK] [int] NOT NULL IDENTITY(1, 1),
[MailingID] [bigint] NULL,
[GroupID] [bigint] NULL,
[GroupName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_Mailing_Groups] ADD CONSTRAINT [PK__Snapshot__A48A588767DE69FA] PRIMARY KEY CLUSTERED  ([Emma_Mailing_GroupsSK])
GO
