SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_Groups]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(255),[ActiveCount]) [ActiveCount]
	,CONVERT(NVARCHAR(MAX),[DeletedAt]) [DeletedAt]
	,CONVERT(NVARCHAR(MAX),[ErrorCount]) [ErrorCount]
	,CONVERT(NVARCHAR(MAX),[OptoutCount]) [OptoutCount]
	,CONVERT(NVARCHAR(MAX),[GroupType]) [GroupType]
	,CONVERT(NVARCHAR(255),[MemberGroupID]) [MemberGroupID_K]
	,CONVERT(NVARCHAR(MAX),[PurgedAt]) [PurgedAt]
	,CONVERT(NVARCHAR(MAX),[AccountID]) [AccountID_K]
	,CONVERT(NVARCHAR(MAX),[GroupName]) [GroupName]
FROM [src].[Emma_Groups] WITH (NOLOCK)
GO
