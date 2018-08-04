CREATE TABLE [apietl].[Emma_MemberActions]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Emma_Memb__ETL____0F13F6FC] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NOT NULL CONSTRAINT [DF__Emma_Memb__IsLoa__10081B35] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
