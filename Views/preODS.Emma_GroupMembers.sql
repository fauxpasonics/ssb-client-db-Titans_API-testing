SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_GroupMembers]
AS

SELECT DISTINCT
	convert(nvarchar(255),[ETL__multi_query_value_for_audit])[GroupID_K]
	,CONVERT(NVARCHAR(255),[MemberID]) [MemberID_k]
FROM [src].[Emma_GroupMembers] WITH (NOLOCK)
GO
