SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_Fields] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_Fields] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[ShortcutName] [nvarchar](max) NULL,
[DisplayName] [nvarchar](max) NULL,
[AccountID] [nvarchar](255) NULL,
[FieldType] [nvarchar](max) NULL,
[Required] [nvarchar](max) NULL,
[FieldID] [nvarchar](255) NULL,
[WidgetType] [nvarchar](max) NULL,
[ColumnOrder] [nvarchar](max) NULL,
[DeletedAt] [nvarchar](max) NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)

AS
BEGIN

DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))

INSERT INTO @Results
SELECT [ShortcutName],[DisplayName],[AccountID],[FieldType],[Required],[FieldID],[WidgetType],[ColumnOrder],[DeletedAt],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [ShortcutName],[DisplayName],[AccountID],[FieldType],[Required],[FieldID],[WidgetType],[ColumnOrder],[DeletedAt],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_Fields] t
	UNION ALL
	SELECT [ShortcutName],[DisplayName],[AccountID],[FieldType],[Required],[FieldID],[WidgetType],[ColumnOrder],[DeletedAt],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_Fields]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
