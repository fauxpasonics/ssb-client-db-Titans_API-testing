SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [apietl].[vw_Emma_Mailings_MissingDetails]
AS

SELECT DISTINCT m.Account, COALESCE(m.Parent, m.Mailing) Mailing
FROM ods.Emma_Mailings_AWS m (NOLOCK)
LEFT JOIN ods.Emma_MailingDetails md (NOLOCK)
	ON COALESCE(m.Parent, m.Mailing) = md.MailingID
LEFT JOIN etl.Emma_Mailings_MissingDetails mmd (NOLOCK)
	ON m.Mailing = mmd.MailingID
	AND m.Account = mmd.AccountID
WHERE md.MailingID IS NULL
	AND m.Mailing_Type IN ('m', 'f')
	AND (mmd.MailingID IS NULL
		OR DATEDIFF(dd,mmd.CreatedDate,mmd.UpdatedDate) < 15)




GO
