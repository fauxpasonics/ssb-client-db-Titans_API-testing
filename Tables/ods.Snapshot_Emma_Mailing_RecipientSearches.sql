CREATE TABLE [ods].[Snapshot_Emma_Mailing_RecipientSearches]
(
[Emma_Mailing_RecipientSearchesSK] [int] NOT NULL IDENTITY(1, 1),
[MailingID] [bigint] NULL,
[RecipientSearchesSearchID] [bigint] NULL,
[RecipientSearchesName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_Mailing_RecipientSearches] ADD CONSTRAINT [PK__Snapshot__9D1703D3EC782997] PRIMARY KEY CLUSTERED  ([Emma_Mailing_RecipientSearchesSK])
GO
