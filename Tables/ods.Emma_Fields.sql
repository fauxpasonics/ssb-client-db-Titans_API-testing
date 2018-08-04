CREATE TABLE [ods].[Emma_Fields]
(
[ShortcutName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisplayName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FieldType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Required] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FieldID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WidgetType] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ColumnOrder] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeletedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Fiel__ETL_C__2D47B39A] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Fiel__ETL_C__2E3BD7D3] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Fiel__ETL_U__2F2FFC0C] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Fiel__ETL_U__30242045] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_FieldsUpdate] ON [ods].[Emma_Fields]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_Fields] t
	JOIN inserted i ON  t.[AccountID] = i.[AccountID] AND t.[FieldID] = i.[FieldID]

INSERT INTO [ods].[Snapshot_Emma_Fields] ([ShortcutName],[DisplayName],[AccountID],[FieldType],[Required],[FieldID],[WidgetType],[ColumnOrder],[DeletedAt],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_Fields] ADD CONSTRAINT [PK__Emma_Fie__5816CA74A35141BF] PRIMARY KEY CLUSTERED  ([AccountID], [FieldID])
GO
