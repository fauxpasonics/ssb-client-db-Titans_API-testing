SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_Emma_Members] (@AsOfDate)
*/

CREATE FUNCTION [ods].[AsOf_Emma_Members] (@AsOfDate DATETIME)

RETURNS @Results TABLE
(
[Status] [nvarchar](max) NULL,
[AccountID] [nvarchar](max) NULL,
[MemberID] [nvarchar](250) NULL,
[LastModifiedAt] [nvarchar](max) NULL,
[MemberStatusID] [nvarchar](max) NULL,
[PlainTextPreferred] [nvarchar](max) NULL,
[MemberSince] [nvarchar](max) NULL,
[BounceCount] [nvarchar](max) NULL,
[DeletedAt] [nvarchar](max) NULL,
[Email] [nvarchar](max) NULL,
[FirstName] [nvarchar](max) NULL,
[City] [nvarchar](max) NULL,
[LastName] [nvarchar](max) NULL,
[SSBID] [nvarchar](max) NULL,
[Source] [nvarchar](max) NULL,
[State] [nvarchar](max) NULL,
[PostalCode] [nvarchar](max) NULL,
[CompanyBusinessName] [nvarchar](max) NULL,
[ArchticsAcctID] [nvarchar](max) NULL,
[Gender] [nvarchar](max) NULL,
[WhenIsTheBestTimeForUsToContactYou-] [nvarchar](max) NULL,
[Phone] [nvarchar](max) NULL,
[StreetAddress] [nvarchar](max) NULL,
[ParentGuardianPhone] [nvarchar](max) NULL,
[Birthday] [nvarchar](max) NULL,
[CokeHOFPhotoshoot] [nvarchar](max) NULL,
[AdditionalMember1_Birthday] [nvarchar](max) NULL,
[ParentGuardianFirstName] [nvarchar](max) NULL,
[AdditionalMember1_FirstName] [nvarchar](max) NULL,
[ParentGuardianAddress] [nvarchar](max) NULL,
[ParentGuardianLastName] [nvarchar](max) NULL,
[KidsClubMemberFirstName] [nvarchar](max) NULL,
[KidsClubMemberBirthday] [nvarchar](max) NULL,
[AdditionalComments] [nvarchar](max) NULL,
[AdditionalMember2_Birthday] [nvarchar](max) NULL,
[AdditionalMember2_FirstName] [nvarchar](max) NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)

AS
BEGIN

DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))

INSERT INTO @Results
SELECT [Status],[AccountID],[MemberID],[LastModifiedAt],[MemberStatusID],[PlainTextPreferred],[MemberSince],[BounceCount],[DeletedAt],[Email],[FirstName],[City],[LastName],[SSBID],[Source],[State],[PostalCode],[CompanyBusinessName],[ArchticsAcctID],[Gender],[WhenIsTheBestTimeForUsToContactYou-],[Phone],[StreetAddress],[ParentGuardianPhone],[Birthday],[CokeHOFPhotoshoot],[AdditionalMember1_Birthday],[ParentGuardianFirstName],[AdditionalMember1_FirstName],[ParentGuardianAddress],[ParentGuardianLastName],[KidsClubMemberFirstName],[KidsClubMemberBirthday],[AdditionalComments],[AdditionalMember2_Birthday],[AdditionalMember2_FirstName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
	(
	SELECT [Status],[AccountID],[MemberID],[LastModifiedAt],[MemberStatusID],[PlainTextPreferred],[MemberSince],[BounceCount],[DeletedAt],[Email],[FirstName],[City],[LastName],[SSBID],[Source],[State],[PostalCode],[CompanyBusinessName],[ArchticsAcctID],[Gender],[WhenIsTheBestTimeForUsToContactYou-],[Phone],[StreetAddress],[ParentGuardianPhone],[Birthday],[CokeHOFPhotoshoot],[AdditionalMember1_Birthday],[ParentGuardianFirstName],[AdditionalMember1_FirstName],[ParentGuardianAddress],[ParentGuardianLastName],[KidsClubMemberFirstName],[KidsClubMemberBirthday],[AdditionalComments],[AdditionalMember2_Birthday],[AdditionalMember2_FirstName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
	FROM [ods].[Emma_Members] t
	UNION ALL
	SELECT [Status],[AccountID],[MemberID],[LastModifiedAt],[MemberStatusID],[PlainTextPreferred],[MemberSince],[BounceCount],[DeletedAt],[Email],[FirstName],[City],[LastName],[SSBID],[Source],[State],[PostalCode],[CompanyBusinessName],[ArchticsAcctID],[Gender],[WhenIsTheBestTimeForUsToContactYou-],[Phone],[StreetAddress],[ParentGuardianPhone],[Birthday],[CokeHOFPhotoshoot],[AdditionalMember1_Birthday],[ParentGuardianFirstName],[AdditionalMember1_FirstName],[ParentGuardianAddress],[ParentGuardianLastName],[KidsClubMemberFirstName],[KidsClubMemberBirthday],[AdditionalComments],[AdditionalMember2_Birthday],[AdditionalMember2_FirstName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
	FROM [ods].[Snapshot_Emma_Members]
	) a
WHERE
	@AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
	AND [ETL_CreatedOn] <= @AsOfDate

RETURN

END
GO
