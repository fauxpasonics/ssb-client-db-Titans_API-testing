SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[Load_Emma_Mailings_MissingDetails]
AS

MERGE etl.Emma_Mailings_MissingDetails AS TARGET
USING (
	SELECT Account
		, Mailing
		, GETDATE() AS UpdatedDate
		, GETDATE() AS CreatedDate
	FROM apietl.vw_Emma_Mailings_MissingDetails
	) AS SOURCE
ON (	TARGET.AccountID = SOURCE.Account
		AND TARGET.MailingID = SOURCE.Mailing
	)
WHEN NOT MATCHED THEN
	INSERT	( AccountID
			, MailingID
			, CreatedDate
			, UpdatedDate
			, IsDeleted
			, DeletedDate
			)
	VALUES	( SOURCE.Account
			, SOURCE.Mailing
			, SOURCE.CreatedDate
			, SOURCE.UpdatedDate
			, 0
			, NULL
			)

WHEN MATCHED AND SOURCE.UpdatedDate > TARGET.UpdatedDate THEN
UPDATE SET TARGET.UpdatedDate = SOURCE.UpdatedDate
;


UPDATE mmd
SET mmd.IsDeleted = 1
	, mmd.DeletedDate = GETDATE()
--SELECT *
FROM etl.Emma_Mailings_MissingDetails mmd (NOLOCK)
JOIN ods.Emma_MailingDetails md (NOLOCK)
	ON mmd.AccountID = md.AccountID
	AND mmd.MailingID = md.MailingID

	
;

GO
