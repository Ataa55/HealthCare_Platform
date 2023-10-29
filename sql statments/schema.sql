SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[D_TIME](
	[Date_SK] [int] NOT NULL,
	[Day] [varchar](10) NOT NULL,
	[Month] [varchar](10) NOT NULL,
	[Quarter] [varchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[CDate] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
