CREATE TABLE [apietl].[Emma_Mailings]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL____4242D080] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NULL CONSTRAINT [DF__Emma_Mail__IsLoa__4336F4B9] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
