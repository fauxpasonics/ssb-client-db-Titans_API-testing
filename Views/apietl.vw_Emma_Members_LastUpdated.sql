SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [apietl].[vw_Emma_Members_LastUpdated]
AS

WITH MaxAllUpdated
AS (
	SELECT MAX([Timestamp]) [Timestamp]
	FROM ods.Emma_MemberActions
	WHERE MemberID = ''
)

	SELECT a.AccountID, a.MemberID, MAX(a.[Timestamp]) SSB_API_LastUpdatedDate
	FROM (
		SELECT ma.AccountID, ma.MemberID, MAX(ma.[Timestamp]) [Timestamp]
		FROM ods.Emma_MemberActions ma
		WHERE ma.MemberID <> ''
		GROUP BY ma.AccountID, ma.MemberID
		
		UNION ALL

		SELECT m.AccountID, m.MemberID, mau.[Timestamp]
		FROM MaxAllUpdated mau
		JOIN ods.Emma_Members m
			ON m.MemberID = m.MemberID
		) a
	GROUP BY a.AccountID, a.MemberID

--9 minutes





GO
