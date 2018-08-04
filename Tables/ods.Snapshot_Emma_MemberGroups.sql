CREATE TABLE [ods].[Snapshot_Emma_MemberGroups]
(
[Emma_MemberGroupsSK] [int] NOT NULL IDENTITY(1, 1),
[MemberID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_MemberGroups] ADD CONSTRAINT [PK__Snapshot__3E7F169575AC3B25] PRIMARY KEY CLUSTERED  ([Emma_MemberGroupsSK])
GO
