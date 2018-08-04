CREATE TABLE [ods].[Emma_Mailing_Links]
(
[MailingID] [bigint] NULL,
[LinkID] [bigint] NOT NULL,
[LinkName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinksPlainText] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkTarget] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LinkOrder] [int] NULL,
[ETL_CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__2D1D9668] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_CreatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_C__2E11BAA1] DEFAULT (suser_sname()),
[ETL_UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__2F05DEDA] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[ETL_UpdatedBy] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Emma_Mail__ETL_U__2FFA0313] DEFAULT (suser_sname())
)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------- CREATE TRIGGER -----------
CREATE TRIGGER [ods].[Snapshot_Emma_Mailing_LinksUpdate] ON [ods].[Emma_Mailing_Links]
AFTER UPDATE, DELETE

AS
BEGIN

DECLARE @ETL_UpdatedOn DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS DATETIME2(0))))
DECLARE @ETL_UpdatedBy NVARCHAR(400) = (SELECT SYSTEM_USER)

UPDATE t SET
[ETL_UpdatedOn] = @ETL_UpdatedOn
,[ETL_UpdatedBy] = @ETL_UpdatedBy
FROM [ods].[Emma_Mailing_Links] t
	JOIN inserted i ON  t.[LinkID] = i.[LinkID]

INSERT INTO [ods].[Snapshot_Emma_Mailing_Links] ([MailingID],[LinkID],[LinkName],[LinksPlainText],[LinkTarget],[LinkOrder],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate])
SELECT a.*,dateadd(s,-1,@ETL_UpdatedOn)
FROM deleted a

END
GO
ALTER TABLE [ods].[Emma_Mailing_Links] ADD CONSTRAINT [PK__Emma_Mai__2D122155000FD546] PRIMARY KEY CLUSTERED  ([LinkID])
GO
