CREATE TABLE [ods].[Snapshot_Emma_MemberActions]
(
[Emma_MemberActionsSK] [int] NOT NULL IDENTITY(1, 1),
[Timestamp] [datetime2] NULL,
[Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ResourceURL] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SignupFormID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewStatus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NULL,
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_UpdatedOn] [datetime] NULL,
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordEndDate] [datetime] NULL
)
GO
ALTER TABLE [ods].[Snapshot_Emma_MemberActions] ADD CONSTRAINT [PK__Snapshot__F587916015E542D7] PRIMARY KEY CLUSTERED  ([Emma_MemberActionsSK])
GO
