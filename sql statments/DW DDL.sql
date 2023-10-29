USE [HealthcareDW]
GO

/****** Object:  Table [dbo].[DimEpisodes]    Script Date: 03.09.2023 18:36:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimEpisodes](
	[Episode_Key_SK] [int] IDENTITY(1,1) NOT NULL,
	[Episode_Key_BK] [int] NOT NULL,
	--[Patient_ID] [int] NULL,
	[Start_Date] [datetime] NULL,
	[End_Date] [datetime] NULL,
	[Episode_Type_Key] [int] NULL,
	[Episode_Type] [nvarchar](255) NULL,
	[Bed_Key] [int] NULL,
	[Bed_Clinic] [nvarchar](255) NULL,
	--[Doctor_Key] [int] NULL,
	[_ValidFrom] [datetime] NULL,
	[_ValidTo] [datetime] NULL,
 CONSTRAINT [PK_Episodes] PRIMARY KEY CLUSTERED 
(
	[Episode_Key_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------

USE [HealthcareDW]
GO

/****** Object:  Table [dbo].[DimPatient]    Script Date: 03.09.2023 18:37:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimPatients](
	[patient_id_SK] [int] IDENTITY(1,1) NOT NULL,
	[patient_id_BK] [int] NOT NULL,
	[Gov_Code] [int] NULL,
	[Governance] [nvarchar](255) NULL,
	[Gender_Key] [int] NULL,
	[gender] [nvarchar](255) NULL,
	[Nationality] [nvarchar](255) NULL,
	[Nationality_Code] [int] NULL,
	[Arabic_Name] [nvarchar](255) NULL,
	[English_Name] [nvarchar](255) NULL,
	[PatType] [int] NULL,
	[Patient_Type] [nvarchar](255) NULL,
	[FileID] [int] NULL,
	[mobile_phone] [int] NULL,
	[district_key] [int] NULL,
	[District_Name] [nvarchar](255) NULL,
	[pat_nrst_relv] [nvarchar](255) NULL,
	[pat_addr] [nvarchar](255) NULL,
	[_ValidFrom] [datetime] NULL,
	[_ValidTo] [datetime] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[patient_id_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------

USE [HealthcareDW]
GO

/****** Object:  Table [dbo].[DimServices]    Script Date: 03.09.2023 18:37:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimServices](
	[Service_SK] [int] IDENTITY(1,1) NOT NULL,
	[Category_Key_BK] [int] NOT NULL,
	[Category_Name] [nvarchar](255) NULL,
	[Service_Key_BK] [int] NOT NULL,
	[Service_Name] [nvarchar](255) NULL,
	[_ValidFrom] [datetime] NULL,
	[_ValidTo] [datetime] NULL,
 CONSTRAINT [PK_Service_1] PRIMARY KEY CLUSTERED 
(
	[Service_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------

USE [HealthcareDW]
GO

/****** Object:  Table [dbo].[Fact_Billings]    Script Date: 03.09.2023 18:37:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactBillings](
	[Service_SK] [int] NULL,
	[patient_id_SK] [int] NULL,
	[Episode_Key_SK] [int] NULL,
	[DateSK] [int] NULL,
	[Cash_Amount] [float] NULL,
	[Credit_Amount] [float] NULL,
	[Total_Amount] [float] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactBillings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bill_Items_DimDate] FOREIGN KEY([DateSK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[FactBillings] CHECK CONSTRAINT [FK_Fact_Bill_Items_DimDate]
GO

ALTER TABLE [dbo].[FactBillings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bill_Items_DimEpisodes] FOREIGN KEY([Episode_Key_SK])
REFERENCES [dbo].[DimEpisodes] ([Episode_Key_SK])
GO

ALTER TABLE [dbo].[FactBillings] CHECK CONSTRAINT [FK_Fact_Bill_Items_DimEpisodes]
GO

ALTER TABLE [dbo].[FactBillings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bill_Items_DimPatient] FOREIGN KEY([patient_id_SK])
REFERENCES [dbo].[DimPatients] ([patient_id_SK])
GO

ALTER TABLE [dbo].[FactBillings] CHECK CONSTRAINT [FK_Fact_Bill_Items_DimPatient]
GO

ALTER TABLE [dbo].[FactBillings]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Bill_Items_DimService] FOREIGN KEY([Service_SK])
REFERENCES [dbo].[DimServices] ([Service_SK])
GO

ALTER TABLE [dbo].[FactBillings] CHECK CONSTRAINT [FK_Fact_Bill_Items_DimService]
GO

----------------------------------------------------------


