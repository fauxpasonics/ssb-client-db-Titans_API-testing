SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_MailingDetails]
AS

SELECT DISTINCT
	 CONVERT(BIGINT,[MailingID]) [MailingID_K]
	,CONVERT(NVARCHAR(250),[SendStarted]) [SendStarted]
	,CONVERT(BIGINT,[SignupFormID]) [SignupFormID]
	,CONVERT(NVARCHAR(MAX),[PlainText]) [PlainText]
	,CONVERT(INT,[RecipientCount]) [RecipientCount]
	,CONVERT(NVARCHAR(250),[PublicWebviewURL]) [PublicWebviewURL]
	,CONVERT(NVARCHAR(10),[MailingType]) [MailingType]
	,CONVERT(BIGINT,[AccountID]) [AccountID]
	,CONVERT(NVARCHAR(10),[MailingStatus]) [MailingStatus]
	,CONVERT(NVARCHAR(250),[Sender]) [Sender]
	,CONVERT(NVARCHAR(250),[Name]) [Name]
	,CONVERT(NVARCHAR(250),[SendFinished]) [SendFinished]
	,CONVERT(NVARCHAR(250),[SendAt]) [SendAt]
	,CONVERT(NVARCHAR(250),[ReplyTo]) [ReplyTo]
	,CONVERT(NVARCHAR(500),[Subject]) [Subject]
	,CONVERT(NVARCHAR(MAX),[HTMLBody]) [HTMLBody]
FROM [src].[Emma_MailingDetails] WITH (NOLOCK)
GO
