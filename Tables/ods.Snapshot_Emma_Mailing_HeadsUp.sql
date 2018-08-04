CREATE TABLE [ods].[Snapshot_Emma_Mailing_HeadsUp]
(
[Emma_Mailing_HeadsUpSK] [int] NOT NULL IDENTITY(1, 1),
[MailingID] [bigint] NULL,
[HeadsUpEmail] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HeadsUpEmailsSentTS] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_Mailing_HeadsUp] ADD CONSTRAINT [PK__Snapshot__1E6D9B0F8C7B4CBE] PRIMARY KEY CLUSTERED  ([Emma_Mailing_HeadsUpSK])
GO
