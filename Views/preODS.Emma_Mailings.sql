SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_Mailings]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(MAX),[MailingType]) [MailingType]
	,CONVERT(NVARCHAR(MAX),[SendStarted]) [SendStarted]
	,CONVERT(NVARCHAR(255),[MailingID]) [MailingID_K]
	,CONVERT(NVARCHAR(MAX),[RecipientCount]) [RecipientCount]
	,CONVERT(NVARCHAR(MAX),[MailingStatus]) [MailingStatus]
	,CONVERT(NVARCHAR(MAX),[AccountID]) [AccountID]
	,CONVERT(NVARCHAR(MAX),[Month]) [Month]
	,CONVERT(NVARCHAR(MAX),[ReplyTo]) [ReplyTo]
	,CONVERT(NVARCHAR(MAX),[Year]) [Year]
	,CONVERT(NVARCHAR(MAX),[StartedorFinished]) [StartedorFinished]
	,CONVERT(NVARCHAR(MAX),[Subject]) [Subject]
	,CONVERT(NVARCHAR(MAX),[Disabled]) [Disabled]
	,CONVERT(NVARCHAR(MAX),[CreatedTS]) [CreatedTS]
	,CONVERT(NVARCHAR(MAX),[Sender]) [Sender]
	,CONVERT(NVARCHAR(MAX),[PlaintextOnly]) [PlaintextOnly]
	,CONVERT(NVARCHAR(MAX),[Name]) [Name]
	,CONVERT(NVARCHAR(MAX),[Hour]) [Hour]
	,CONVERT(NVARCHAR(MAX),[ParentMailingID]) [ParentMailingID]
	,CONVERT(NVARCHAR(MAX),[FailureMessage]) [FailureMessage]
	,CONVERT(NVARCHAR(MAX),[Day]) [Day]
	,CONVERT(NVARCHAR(MAX),[SendFinished]) [SendFinished]
	,CONVERT(NVARCHAR(MAX),[Datacenter]) [Datacenter]
	,CONVERT(NVARCHAR(MAX),[SendAt]) [SendAt]
	,CONVERT(NVARCHAR(MAX),[SignupFormID]) [SignupFormID]
FROM [src].[Emma_Mailings] WITH (NOLOCK)
GO
