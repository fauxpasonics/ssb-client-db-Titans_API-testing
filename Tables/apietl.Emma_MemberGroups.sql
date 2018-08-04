CREATE TABLE [apietl].[Emma_MemberGroups]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Emma_Memb__ETL____3E723F9C] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NULL CONSTRAINT [DF__Emma_Memb__IsLoa__405A880E] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
