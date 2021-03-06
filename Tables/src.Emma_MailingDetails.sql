CREATE TABLE [src].[Emma_MailingDetails]
(
[SK] [bigint] NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendStarted] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SignupFormID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlainText] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientCount] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PublicWebviewURL] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingType] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingStatus] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sender] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendFinished] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendAt] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReplyTo] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HTMLBody] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recipient-members_] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HeadsUpEmailsSentTS] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HeadsUpEmail] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinksPlainText] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkTarget] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkOrder] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientSearchesSearchID] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecipientSearchesName] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
