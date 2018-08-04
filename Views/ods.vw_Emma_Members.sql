SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [ods].[vw_Emma_Members]
AS

SELECT

[Status],
 AccountID, 
 MemberID, 
 LastModifiedAt, 
 MemberStatusID, 
 PlainTextPreferred, 
 MemberSince, BounceCount, 
 DeletedAt, Email, FirstName, City, LastName, SSBID, Source, 
 [State], PostalCode, CompanyBusinessName, ArchticsAcctID, Gender, [WhenIsTheBestTimeForUsToContactYou-] AS WhenIsTheBestTimeForUsToContactYou , 
 Phone, StreetAddress, ParentGuardianPhone, Birthday, CokeHOFPhotoshoot, AdditionalMember1_Birthday, 
 ParentGuardianFirstName, AdditionalMember1_FirstName, ParentGuardianAddress, ParentGuardianLastName, 
 KidsClubMemberFirstName, KidsClubMemberBirthday, AdditionalComments, AdditionalMember2_Birthday, 
 AdditionalMember2_FirstName, ETL_CreatedOn, ETL_CreatedBy, ETL_UpdatedOn, ETL_UpdatedBy

 FROM [ods].[Emma_Members]

GO
