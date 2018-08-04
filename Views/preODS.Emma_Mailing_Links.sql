SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_Mailing_Links]
AS

SELECT DISTINCT
	 CONVERT(BIGINT,[MailingID]) [MailingID]
	,CONVERT(BIGINT,[LinkID]) [LinkID_K]
	,CONVERT(NVARCHAR(250),[LinkName]) [LinkName]
	,CONVERT(NVARCHAR(20),[LinksPlainText]) [LinksPlainText]
	,CONVERT(NVARCHAR(500),[LinkTarget]) [LinkTarget]
	,CONVERT(INT,[LinkOrder]) [LinkOrder]
FROM [src].[Emma_MailingDetails] WITH (NOLOCK)
WHERE LinkID IS NOT NULL
GO
