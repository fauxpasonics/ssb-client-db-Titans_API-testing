CREATE TABLE [ods].[Snapshot_Emma_MailingMembers]
(
[Emma_MailingMembersSK] [int] NOT NULL IDENTITY(1, 1),
[MailingID] [bigint] NULL,
[MemberID] [bigint] NULL,
[Email] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_MailingMembers] ADD CONSTRAINT [PK__Snapshot__B0340DCE3AD97571] PRIMARY KEY CLUSTERED  ([Emma_MailingMembersSK])
GO
