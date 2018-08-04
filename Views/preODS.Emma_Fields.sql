SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_Fields]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(MAX),[ShortcutName]) [ShortcutName]
	,CONVERT(NVARCHAR(MAX),[DisplayName]) [DisplayName]
	,CONVERT(NVARCHAR(255),[AccountID]) [AccountID_K]
	,CONVERT(NVARCHAR(max),[FieldType]) [FieldType]
	,CONVERT(NVARCHAR(MAX),[Required]) [Required]
	,CONVERT(NVARCHAR(255),[FieldID]) [FieldID_K]
	,CONVERT(NVARCHAR(MAX),[WidgetType]) [WidgetType]
	,CONVERT(NVARCHAR(MAX),[ColumnOrder]) [ColumnOrder]
	,CONVERT(NVARCHAR(MAX),[DeletedAt]) [DeletedAt]
FROM [src].[Emma_Fields] WITH (NOLOCK)
GO
