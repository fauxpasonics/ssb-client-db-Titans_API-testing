CREATE TABLE [apietl].[Emma_MailingDetails]
(
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL____573DED66] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsLoaded] [bit] NULL CONSTRAINT [DF__Emma_Mail__IsLoa__5C02A283] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1)
)
GO
