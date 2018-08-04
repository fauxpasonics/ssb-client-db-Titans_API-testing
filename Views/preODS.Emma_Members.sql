SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [preODS].[Emma_Members]
AS

SELECT DISTINCT

	CONVERT(NVARCHAR(MAX),[Status]) [Status]
	,CONVERT(NVARCHAR(MAX),[AccountID]) [AccountID]
	,CONVERT(NVARCHAR(250),[MemberID]) [MemberID_K]
	,CONVERT(NVARCHAR(MAX),[LastModifiedAt]) [LastModifiedAt]
	,CONVERT(NVARCHAR(MAX),[MemberStatusID]) [MemberStatusID]
	,CONVERT(NVARCHAR(MAX),[PlainTextPreferred]) [PlainTextPreferred]
	,CONVERT(NVARCHAR(MAX),[MemberSince]) [MemberSince]
	,CONVERT(NVARCHAR(MAX),[BounceCount]) [BounceCount]
	,CONVERT(NVARCHAR(MAX),[DeletedAt]) [DeletedAt]
	,CONVERT(NVARCHAR(MAX),[Email]) [Email]
	,CONVERT(NVARCHAR(MAX),[FirstName]) [FirstName]
	,CONVERT(NVARCHAR(MAX),[City]) [City]
	,CONVERT(NVARCHAR(MAX),[LastName]) [LastName]
	,CONVERT(NVARCHAR(MAX),[SSBID]) [SSBID]
	,CONVERT(NVARCHAR(MAX),[Source]) [Source]
	,CONVERT(NVARCHAR(MAX),[State]) [State]
	,CONVERT(NVARCHAR(MAX),[PostalCode]) [PostalCode]
	,CONVERT(NVARCHAR(MAX),[CompanyBusinessName]) [CompanyBusinessName]
	,CONVERT(NVARCHAR(MAX),[ArchticsAcctID]) [ArchticsAcctID]
	,CONVERT(NVARCHAR(MAX),[Gender]) [Gender]
	,CONVERT(NVARCHAR(MAX),[WhenIsTheBestTimeForUsToContactYou-]) [WhenIsTheBestTimeForUsToContactYou-]
	,CONVERT(NVARCHAR(MAX),[Phone]) [Phone]
	,CONVERT(NVARCHAR(MAX),[StreetAddress]) [StreetAddress]
	,CONVERT(NVARCHAR(MAX),[ParentGuardianPhone]) [ParentGuardianPhone]
	,CONVERT(NVARCHAR(MAX),[Birthday]) [Birthday]
	,CONVERT(NVARCHAR(MAX),[CokeHOFPhotoshoot]) [CokeHOFPhotoshoot]
	,CONVERT(NVARCHAR(MAX),[AdditionalMember1_Birthday]) [AdditionalMember1_Birthday]
	,CONVERT(NVARCHAR(MAX),[ParentGuardianFirstName]) [ParentGuardianFirstName]
	,CONVERT(NVARCHAR(MAX),[AdditionalMember1_FirstName]) [AdditionalMember1_FirstName]
	,CONVERT(NVARCHAR(MAX),[ParentGuardianAddress]) [ParentGuardianAddress]
	,CONVERT(NVARCHAR(MAX),[ParentGuardianLastName]) [ParentGuardianLastName]
	,CONVERT(NVARCHAR(MAX),[KidsClubMemberFirstName]) [KidsClubMemberFirstName]
	,CONVERT(NVARCHAR(MAX),[KidsClubMemberBirthday]) [KidsClubMemberBirthday]
	,CONVERT(NVARCHAR(MAX),[AdditionalComments]) [AdditionalComments]
	,CONVERT(NVARCHAR(MAX),[AdditionalMember2_Birthday]) [AdditionalMember2_Birthday]
	,CONVERT(NVARCHAR(MAX),[AdditionalMember2_FirstName]) [AdditionalMember2_FirstName]
FROM [src].[Emma_Members] WITH (NOLOCK)
GO
