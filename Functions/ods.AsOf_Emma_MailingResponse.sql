SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_MailingResponse] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_MailingResponse] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MailingID] [nvarchar](255) NULL,
[Subject] [nvarchar](max) NULL,
[CountPurchased] [nvarchar](max) NULL,
[Delivered] [nvarchar](max) NULL,
[Clicked] [nvarchar](max) NULL,
[Opened] [nvarchar](max) NULL,
[WebviewShared] [nvarchar](max) NULL,
[RecipientCount] [nvarchar](max) NULL,
[Sent] [nvarchar](max) NULL,
[ClickedUnique] [nvarchar](max) NULL,
[WebviewShareClicked] [nvarchar](max) NULL,
[Shared] [nvarchar](max) NULL,
[InProgress] [nvarchar](max) NULL,
[SumPurchased] [nvarchar](max) NULL,
[Forwarded] [nvarchar](max) NULL,
[Name] [nvarchar](max) NULL,
[OptedOut] [nvarchar](max) NULL,
[SignedUp] [nvarchar](max) NULL,
[ShareClicked] [nvarchar](max) NULL,
[Bounced] [nvarchar](max) NULL,
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
SELECT [MailingID],[Subject],[CountPurchased],[Delivered],[Clicked],[Opened],[WebviewShared],[RecipientCount],[Sent],[ClickedUnique],[WebviewShareClicked],[Shared],[InProgress],[SumPurchased],[Forwarded],[Name],[OptedOut],[SignedUp],[ShareClicked],[Bounced],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MailingID],[Subject],[CountPurchased],[Delivered],[Clicked],[Opened],[WebviewShared],[RecipientCount],[Sent],[ClickedUnique],[WebviewShareClicked],[Shared],[InProgress],[SumPurchased],[Forwarded],[Name],[OptedOut],[SignedUp],[ShareClicked],[Bounced],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_MailingResponse] t
	UNION ALL
	SELECT [MailingID],[Subject],[CountPurchased],[Delivered],[Clicked],[Opened],[WebviewShared],[RecipientCount],[Sent],[ClickedUnique],[WebviewShareClicked],[Shared],[InProgress],[SumPurchased],[Forwarded],[Name],[OptedOut],[SignedUp],[ShareClicked],[Bounced],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_MailingResponse]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
