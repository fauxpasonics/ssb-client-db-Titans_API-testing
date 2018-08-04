SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [preODS].[Emma_Mailing_RecipientSearches]
AS

SELECT DISTINCT
	 CONVERT(BIGINT,[MailingID]) [MailingID_K]
	,CONVERT(BIGINT,[RecipientSearchesSearchID]) [RecipientSearchesSearchID_K]
	,CONVERT(NVARCHAR(200),[RecipientSearchesName]) [RecipientSearchesName]
FROM [src].[Emma_MailingDetails] WITH (NOLOCK)
WHERE RecipientSearchesSearchID IS NOT NULL

GO
