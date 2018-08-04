CREATE TABLE [ods].[Snapshot_Emma_GroupMembers]
(
[Emma_GroupMembersSK] [int] NOT NULL IDENTITY(1, 1),
[GroupID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_GroupMembers] ADD CONSTRAINT [PK__Snapshot__F2A9734BCBAD8B4B] PRIMARY KEY CLUSTERED  ([Emma_GroupMembersSK])
GO
