SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_MailingResponse]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(255),[ETL__multi_query_value_for_audit]) [MailingID_K]
	,CONVERT(NVARCHAR(MAX),[Subject]) [Subject]
	,CONVERT(NVARCHAR(MAX),[CountPurchased]) [CountPurchased]
	,CONVERT(NVARCHAR(MAX),[Delivered]) [Delivered]
	,CONVERT(NVARCHAR(MAX),[Clicked]) [Clicked]
	,CONVERT(NVARCHAR(MAX),[Opened]) [Opened]
	,CONVERT(NVARCHAR(MAX),[WebviewShared]) [WebviewShared]
	,CONVERT(NVARCHAR(MAX),[RecipientCount]) [RecipientCount]
	,CONVERT(NVARCHAR(MAX),[Sent]) [Sent]
	,CONVERT(NVARCHAR(MAX),[ClickedUnique]) [ClickedUnique]
	,CONVERT(NVARCHAR(MAX),[WebviewShareClicked]) [WebviewShareClicked]
	,CONVERT(NVARCHAR(MAX),[Shared]) [Shared]
	,CONVERT(NVARCHAR(MAX),[InProgress]) [InProgress]
	,CONVERT(NVARCHAR(MAX),[SumPurchased]) [SumPurchased]
	,CONVERT(NVARCHAR(MAX),[Forwarded]) [Forwarded]
	,CONVERT(NVARCHAR(MAX),[Name]) [Name]
	,CONVERT(NVARCHAR(MAX),[OptedOut]) [OptedOut]
	,CONVERT(NVARCHAR(MAX),[SignedUp]) [SignedUp]
	,CONVERT(NVARCHAR(MAX),[ShareClicked]) [ShareClicked]
	,CONVERT(NVARCHAR(MAX),[Bounced]) [Bounced]
FROM [src].[Emma_MailingResponse] WITH (NOLOCK)
GO
