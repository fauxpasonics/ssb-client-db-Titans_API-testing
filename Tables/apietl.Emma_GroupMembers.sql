CREATE TABLE [apietl].[Emma_GroupMembers]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Emma_Grou__ETL____2E194444] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NULL CONSTRAINT [DF__Emma_Grou__IsLoa__2F0D687D] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
