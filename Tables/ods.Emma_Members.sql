CREATE TABLE [ods].[Emma_Members]
(
[Status] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberID] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberStatusID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlainTextPreferred] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberSince] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BounceCount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeletedAt] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSBID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Source] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostalCode] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyBusinessName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArchticsAcctID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WhenIsTheBestTimeForUsToContactYou-] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StreetAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentGuardianPhone] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CokeHOFPhotoshoot] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalMember1_Birthday] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentGuardianFirstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalMember1_FirstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentGuardianAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentGuardianLastName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KidsClubMemberFirstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KidsClubMemberBirthday] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalComments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalMember2_Birthday] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalMember2_FirstName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_C__4B4DE324] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_C__4C42075D] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_U__4D362B96] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Memb__ETL_U__4E2A4FCF] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_MembersUpdate] ON [ods].[Emma_Members]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_Members] t
	JOIN inserted i ON  t.[MemberID] = i.[MemberID]

INSERT INTO [ods].[Snapshot_Emma_Members] ([Status],[AccountID],[MemberID],[LastModifiedAt],[MemberStatusID],[PlainTextPreferred],[MemberSince],[BounceCount],[DeletedAt],[Email],[FirstName],[City],[LastName],[SSBID],[Source],[State],[PostalCode],[CompanyBusinessName],[ArchticsAcctID],[Gender],[WhenIsTheBestTimeForUsToContactYou-],[Phone],[StreetAddress],[ParentGuardianPhone],[Birthday],[CokeHOFPhotoshoot],[AdditionalMember1_Birthday],[ParentGuardianFirstName],[AdditionalMember1_FirstName],[ParentGuardianAddress],[ParentGuardianLastName],[KidsClubMemberFirstName],[KidsClubMemberBirthday],[AdditionalComments],[AdditionalMember2_Birthday],[AdditionalMember2_FirstName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_Members] ADD CONSTRAINT [PK__Emma_Mem__0CF04B38E774A04B] PRIMARY KEY CLUSTERED  ([MemberID])
GO
