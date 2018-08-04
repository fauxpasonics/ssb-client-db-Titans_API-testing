CREATE TABLE [ods].[Snapshot_Emma_Fields]
(
[Emma_FieldsSK] [int] NOT NULL IDENTITY(1, 1),
[ShortcutName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FieldType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Required] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FieldID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WidgetType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ColumnOrder] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeletedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_Fields] ADD CONSTRAINT [PK__Snapshot__294D2CB9FFC9C2BD] PRIMARY KEY CLUSTERED  ([Emma_FieldsSK])
GO
