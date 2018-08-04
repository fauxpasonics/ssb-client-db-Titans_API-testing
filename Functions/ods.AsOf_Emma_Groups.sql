SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_Groups] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_Groups] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[ActiveCount] [nvarchar](255) NULL,
[DeletedAt] [nvarchar](max) NULL,
[ErrorCount] [nvarchar](max) NULL,
[OptoutCount] [nvarchar](max) NULL,
[GroupType] [nvarchar](max) NULL,
[MemberGroupID] [nvarchar](255) NULL,
[PurgedAt] [nvarchar](max) NULL,
[AccountID] [nvarchar](max) NULL,
[GroupName] [nvarchar](max) NULL,
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
SELECT [ActiveCount],[DeletedAt],[ErrorCount],[OptoutCount],[GroupType],[MemberGroupID],[PurgedAt],[AccountID],[GroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [ActiveCount],[DeletedAt],[ErrorCount],[OptoutCount],[GroupType],[MemberGroupID],[PurgedAt],[AccountID],[GroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_Groups] t
	UNION ALL
	SELECT [ActiveCount],[DeletedAt],[ErrorCount],[OptoutCount],[GroupType],[MemberGroupID],[PurgedAt],[AccountID],[GroupName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_Groups]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
