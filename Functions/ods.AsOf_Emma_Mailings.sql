SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_Mailings] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_Mailings] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[MailingType] [nvarchar](max) NULL,
[SendStarted] [nvarchar](max) NULL,
[MailingID] [nvarchar](255) NULL,
[RecipientCount] [nvarchar](max) NULL,
[MailingStatus] [nvarchar](max) NULL,
[AccountID] [nvarchar](max) NULL,
[Month] [nvarchar](max) NULL,
[ReplyTo] [nvarchar](max) NULL,
[Year] [nvarchar](max) NULL,
[StartedorFinished] [nvarchar](max) NULL,
[Subject] [nvarchar](max) NULL,
[Disabled] [nvarchar](max) NULL,
[CreatedTS] [nvarchar](max) NULL,
[Sender] [nvarchar](max) NULL,
[PlaintextOnly] [nvarchar](max) NULL,
[Name] [nvarchar](max) NULL,
[Hour] [nvarchar](max) NULL,
[ParentMailingID] [nvarchar](max) NULL,
[FailureMessage] [nvarchar](max) NULL,
[Day] [nvarchar](max) NULL,
[SendFinished] [nvarchar](max) NULL,
[Datacenter] [nvarchar](max) NULL,
[SendAt] [nvarchar](max) NULL,
[SignupFormID] [nvarchar](max) NULL,
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
SELECT [MailingType],[SendStarted],[MailingID],[RecipientCount],[MailingStatus],[AccountID],[Month],[ReplyTo],[Year],[StartedorFinished],[Subject],[Disabled],[CreatedTS],[Sender],[PlaintextOnly],[Name],[Hour],[ParentMailingID],[FailureMessage],[Day],[SendFinished],[Datacenter],[SendAt],[SignupFormID],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [MailingType],[SendStarted],[MailingID],[RecipientCount],[MailingStatus],[AccountID],[Month],[ReplyTo],[Year],[StartedorFinished],[Subject],[Disabled],[CreatedTS],[Sender],[PlaintextOnly],[Name],[Hour],[ParentMailingID],[FailureMessage],[Day],[SendFinished],[Datacenter],[SendAt],[SignupFormID],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_Mailings] t
	UNION ALL
	SELECT [MailingType],[SendStarted],[MailingID],[RecipientCount],[MailingStatus],[AccountID],[Month],[ReplyTo],[Year],[StartedorFinished],[Subject],[Disabled],[CreatedTS],[Sender],[PlaintextOnly],[Name],[Hour],[ParentMailingID],[FailureMessage],[Day],[SendFinished],[Datacenter],[SendAt],[SignupFormID],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_Mailings]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
