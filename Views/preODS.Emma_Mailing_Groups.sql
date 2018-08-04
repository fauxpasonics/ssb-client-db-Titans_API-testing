SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_Mailing_Groups]
AS

SELECT DISTINCT
	 CONVERT(BIGINT,[MailingID]) [MailingID_K]
	,CONVERT(BIGINT,[GroupID]) [GroupID_K]
	,CONVERT(NVARCHAR(250),[GroupName]) [GroupName]
FROM [src].[Emma_MailingDetails] WITH (NOLOCK)
WHERE GroupID IS NOT NULL
GO