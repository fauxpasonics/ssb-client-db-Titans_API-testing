SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_MemberGroups]
AS

SELECT DISTINCT
	 CONVERT(NVARCHAR(100),[ETL__multi_query_value_for_audit]) [MemberID_K]
	,CONVERT(NVARCHAR(100),[GroupID]) [GroupID_K]
	,CONVERT(NVARCHAR(255),[GroupName]) [GroupName]
	,CONVERT(NVARCHAR(255),[GroupType]) [GroupType]
	,CONVERT(NVARCHAR(100),[AccountID]) [AccountID]
FROM [src].[Emma_MemberGroups] WITH (NOLOCK)
GO
