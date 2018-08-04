CREATE TABLE [ods].[Snapshot_Emma_Groups]
(
[Emma_GroupsSK] [int] NOT NULL IDENTITY(1, 1),
[ActiveCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeletedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptoutCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberGroupID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PurgedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_Groups] ADD CONSTRAINT [PK__Snapshot__3A5FF4099A9CD146] PRIMARY KEY CLUSTERED  ([Emma_GroupsSK])
GO
