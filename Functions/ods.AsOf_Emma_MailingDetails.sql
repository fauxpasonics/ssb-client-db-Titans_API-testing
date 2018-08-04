SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_MailingDetails] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_MailingDetails] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MailingID] [bigint] NULL,
[SendStarted] [nvarchar](250) NULL,
[SignupFormID] [bigint] NULL,
[PlainText] [nvarchar](max) NULL,
[RecipientCount] [int] NULL,
[PublicWebviewURL] [nvarchar](250) NULL,
[MailingType] [nvarchar](10) NULL,
[AccountID] [bigint] NULL,
[MailingStatus] [nvarchar](10) NULL,
[Sender] [nvarchar](250) NULL,
[Name] [nvarchar](250) NULL,
[SendFinished] [nvarchar](250) NULL,
[SendAt] [nvarchar](250) NULL,
[ReplyTo] [nvarchar](250) NULL,
[Subject] [nvarchar](500) NULL,
[HTMLBody] [nvarchar](max) NULL,
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
SELECT [MailingID],[SendStarted],[SignupFormID],[PlainText],[RecipientCount],[PublicWebviewURL],[MailingType],[AccountID],[MailingStatus],[Sender],[Name],[SendFinished],[SendAt],[ReplyTo],[Subject],[HTMLBody],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MailingID],[SendStarted],[SignupFormID],[PlainText],[RecipientCount],[PublicWebviewURL],[MailingType],[AccountID],[MailingStatus],[Sender],[Name],[SendFinished],[SendAt],[ReplyTo],[Subject],[HTMLBody],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_MailingDetails] t
	UNION ALL
	SELECT [MailingID],[SendStarted],[SignupFormID],[PlainText],[RecipientCount],[PublicWebviewURL],[MailingType],[AccountID],[MailingStatus],[Sender],[Name],[SendFinished],[SendAt],[ReplyTo],[Subject],[HTMLBody],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_MailingDetails]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
