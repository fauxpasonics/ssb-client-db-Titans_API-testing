CREATE TABLE [apietl].[Emma_Members]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Emma_Memb__ETL____03F0984C] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[isLoaded] [bit] NOT NULL CONSTRAINT [DF__Emma_Memb__isLoa__0E6E26BF] DEFAULT ((0))
)
GO
