SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_MemberActions] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_MemberActions] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[Timestamp] [datetime2](7) NULL,
[Type] [nvarchar](255) NULL,
[AccountID] [nvarchar](100) NULL,
[MemberID] [nvarchar](100) NULL,
[ResourceURL] [nvarchar](500) NULL,
[SignupFormID] [nvarchar](100) NULL,
[MailingID] [nvarchar](100) NULL,
[GroupID] [nvarchar](100) NULL,
[NewStatus] [nvarchar](255) NULL,
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
SELECT [Timestamp],[Type],[AccountID],[MemberID],[ResourceURL],[SignupFormID],[MailingID],[GroupID],[NewStatus],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [Timestamp],[Type],[AccountID],[MemberID],[ResourceURL],[SignupFormID],[MailingID],[GroupID],[NewStatus],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_MemberActions] t
	UNION ALL
	SELECT [Timestamp],[Type],[AccountID],[MemberID],[ResourceURL],[SignupFormID],[MailingID],[GroupID],[NewStatus],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_MemberActions]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
