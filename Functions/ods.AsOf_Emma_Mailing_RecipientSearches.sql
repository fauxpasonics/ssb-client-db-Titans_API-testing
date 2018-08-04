SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_Mailing_RecipientSearches] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_Mailing_RecipientSearches] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MailingID] [bigint] NULL,
[RecipientSearchesSearchID] [bigint] NULL,
[RecipientSearchesName] [nvarchar](200) NULL,
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
SELECT [MailingID],[RecipientSearchesSearchID],[RecipientSearchesName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MailingID],[RecipientSearchesSearchID],[RecipientSearchesName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_Mailing_RecipientSearches] t
	UNION ALL
	SELECT [MailingID],[RecipientSearchesSearchID],[RecipientSearchesName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_Mailing_RecipientSearches]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
