CREATE TABLE [ods].[Emma_Mailing_RecipientSearches]
(
[MailingID] [bigint] NOT NULL,
[RecipientSearchesSearchID] [bigint] NOT NULL,
[RecipientSearchesName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__36A700A2] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__379B24DB] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__388F4914] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__39836D4D] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_Mailing_RecipientSearchesUpdate] ON [ods].[Emma_Mailing_RecipientSearches]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_Mailing_RecipientSearches] t
	JOIN inserted i ON  t.[MailingID] = i.[MailingID] AND t.[RecipientSearchesSearchID] = i.[RecipientSearchesSearchID]

INSERT INTO [ods].[Snapshot_Emma_Mailing_RecipientSearches] ([MailingID],[RecipientSearchesSearchID],[RecipientSearchesName],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_Mailing_RecipientSearches] ADD CONSTRAINT [PK__Emma_Mai__554CE7637C6D65F7] PRIMARY KEY CLUSTERED  ([MailingID], [RecipientSearchesSearchID])
GO
