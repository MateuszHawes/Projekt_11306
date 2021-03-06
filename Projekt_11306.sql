USE [master]
GO
/****** Object:  Database [Projekt_11306]    Script Date: 06/06/2018 21:56:03 ******/
CREATE DATABASE [Projekt_11306]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projekt_11306', FILENAME = N'D:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Projekt_11306.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projekt_11306_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Projekt_11306_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Projekt_11306] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projekt_11306].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projekt_11306] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projekt_11306] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projekt_11306] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projekt_11306] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projekt_11306] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projekt_11306] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projekt_11306] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projekt_11306] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projekt_11306] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projekt_11306] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projekt_11306] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projekt_11306] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projekt_11306] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projekt_11306] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projekt_11306] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projekt_11306] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projekt_11306] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projekt_11306] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projekt_11306] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projekt_11306] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projekt_11306] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projekt_11306] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projekt_11306] SET RECOVERY FULL 
GO
ALTER DATABASE [Projekt_11306] SET  MULTI_USER 
GO
ALTER DATABASE [Projekt_11306] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projekt_11306] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projekt_11306] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projekt_11306] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projekt_11306] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Projekt_11306', N'ON'
GO
ALTER DATABASE [Projekt_11306] SET QUERY_STORE = OFF
GO
USE [Projekt_11306]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Projekt_11306]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[BrandID] [int] NULL,
	[ModelName] [varchar](50) NULL,
	[Descr] [text] NULL,
	[ProducStart] [date] NULL,
	[ProducEnd] [date] NULL,
 CONSTRAINT [ModelID] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Logo] [varchar](255) NULL,
	[WebLink] [varchar](255) NULL,
	[Descr] [text] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[EmployeeID] [int] NULL,
	[ModelID] [int] NULL,
	[SalePrice] [money] NULL,
	[OrderDate] [datetime] NULL,
	[Completed] [bit] NULL,
	[Paid] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT dbo.Brand.Name, COUNT(*) AS Number, SUM(dbo.Orders.SalePrice) AS SalesTotal
FROM     dbo.Orders INNER JOIN
                  dbo.Models ON dbo.Orders.ModelID = dbo.Models.ModelID INNER JOIN
                  dbo.Brand ON dbo.Models.BrandID = dbo.Brand.BrandID
GROUP BY dbo.Brand.Name
GO
/****** Object:  Table [dbo].[PriceList]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceList](
	[PriceListID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NULL,
	[Price] [money] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
 CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED 
(
	[PriceListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT dbo.Orders.OrdersID, dbo.Models.ModelName, dbo.Orders.OrderDate, dbo.PriceList.Price, dbo.Orders.SalePrice, dbo.PriceList.Price - dbo.Orders.SalePrice AS Discount
FROM     dbo.Orders INNER JOIN
                  dbo.Models ON dbo.Orders.ModelID = dbo.Models.ModelID INNER JOIN
                  dbo.PriceList ON dbo.Models.ModelID = dbo.PriceList.ModelID AND dbo.Orders.OrderDate >= dbo.PriceList.FromDate AND dbo.Orders.OrderDate <= dbo.PriceList.ToDate
GO
/****** Object:  View [dbo].[View_3]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT dbo.Brand.Name, dbo.Models.ModelName
FROM     dbo.Models INNER JOIN
                  dbo.Brand ON dbo.Models.BrandID = dbo.Brand.BrandID
WHERE  (NOT EXISTS
                      (SELECT 1 AS Expr1
                       FROM      dbo.Orders
                       WHERE   (ModelID = dbo.Models.ModelID)))
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[Surname] [varchar](100) NULL,
	[PESEL] [varchar](11) NOT NULL,
	[Tel] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Address] [text] NULL,
	[Gender] [tinyint] NULL,
	[EmployStart] [date] NULL,
	[DOB] [date] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_4]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_4]
AS
SELECT dbo.Employee.FirstName, dbo.Employee.Surname, COUNT(*) AS Number, SUM(dbo.Orders.SalePrice) AS Total
FROM     dbo.Orders INNER JOIN
                  dbo.Employee ON dbo.Orders.EmployeeID = dbo.Employee.EmployeeID
GROUP BY dbo.Orders.EmployeeID, dbo.Employee.FirstName, dbo.Employee.Surname
GO
/****** Object:  Table [dbo].[Client]    Script Date: 06/06/2018 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[Surname] [varchar](100) NULL,
	[Tel] [int] NULL,
	[Email] [varchar](100) NULL,
	[Address] [text] NULL,
	[Gender] [tinyint] NULL,
	[Notes] [text] NULL,
	[PersonalID] [varchar](20) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [Name], [Logo], [WebLink], [Descr]) VALUES (0, N'Toyota', N'logoToyota.jpg', N'http://toyota.com', N'Family cars of all sorts')
INSERT [dbo].[Brand] ([BrandID], [Name], [Logo], [WebLink], [Descr]) VALUES (1, N'Honda', N'logoHonda.jpg', N'http://Honda.com', N'Good quality for a good price')
INSERT [dbo].[Brand] ([BrandID], [Name], [Logo], [WebLink], [Descr]) VALUES (2, N'Volkswagen', N'logoVW.jpg', N'http://VW.com', N'High build quality')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientID], [FirstName], [Surname], [Tel], [Email], [Address], [Gender], [Notes], [PersonalID]) VALUES (1, N'Jackie', N'Chan', 651865927, N'jackieman@gmail.com', N'Martial 77', 2, N'Hollywood star, be nice !', N'CVL293934')
INSERT [dbo].[Client] ([ClientID], [FirstName], [Surname], [Tel], [Email], [Address], [Gender], [Notes], [PersonalID]) VALUES (2, N'George', N'Lucas', 861219964, N'starwars@gmail.com', N'Chewie street', 2, N'Hollywood director, be nice !', N'PUO824654')
INSERT [dbo].[Client] ([ClientID], [FirstName], [Surname], [Tel], [Email], [Address], [Gender], [Notes], [PersonalID]) VALUES (3, N'Bruce', N'Banner', 560921644, N'makemeangry@gmail.com', N'Hulk street', 2, N'Super Hero !', N'HAI474426')
INSERT [dbo].[Client] ([ClientID], [FirstName], [Surname], [Tel], [Email], [Address], [Gender], [Notes], [PersonalID]) VALUES (4, N'Wade', N'Wilson', 560921644, N'whereisfrancis@gmail.com', N'Pool street 696', 2, N'Chimichangas', N'JXF330371')
INSERT [dbo].[Client] ([ClientID], [FirstName], [Surname], [Tel], [Email], [Address], [Gender], [Notes], [PersonalID]) VALUES (5, N'Steven', N'Strange', 851110640, N'doctorstrange@gmail.com', N'Spirit street', 2, N'He has the eye of Agamoto', N'TAL082606')
INSERT [dbo].[Client] ([ClientID], [FirstName], [Surname], [Tel], [Email], [Address], [Gender], [Notes], [PersonalID]) VALUES (6, N'Carol', N'Danvers', 731008737, N'captainmarvel@gmail.com', N'', 1, N'', N'SZI560662')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [PESEL], [Tel], [Email], [Address], [Gender], [EmployStart], [DOB]) VALUES (1, N'John', N'Lemon', N'73051712345', N'699146646', N'johnlemon@gmail.com', N'Johns street 73', 2, CAST(N'2003-01-01' AS Date), CAST(N'1973-05-17' AS Date))
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [PESEL], [Tel], [Email], [Address], [Gender], [EmployStart], [DOB]) VALUES (2, N'Peter', N'Parker', N'62050898743', N'620024470', N'Spiderman@gmail.com', N'Queens NY 77', 2, CAST(N'2004-06-01' AS Date), CAST(N'1962-05-08' AS Date))
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [Surname], [PESEL], [Tel], [Email], [Address], [Gender], [EmployStart], [DOB]) VALUES (3, N'Wanda', N'Maximoff', N'75081147624', N'716946732', N'Scarletwitch@gmail.com', N'Sokovia 98', 1, CAST(N'2007-01-22' AS Date), CAST(N'1975-08-11' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (0, 0, N'Yaris', N'Small reliable car', CAST(N'1999-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (1, 0, N'Aygo', N'Mid-size reliable car', CAST(N'2005-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (2, 0, N'Prius', N'Big reliable car', CAST(N'2012-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (6, 1, N'Brio', N'Small good car', CAST(N'2011-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (7, 1, N'Civic', N'Mid-size good car', CAST(N'1972-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (8, 1, N'Avancier', N'Large good car', CAST(N'1993-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (9, 2, N'Fox', N'Small solid car', CAST(N'2005-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (10, 2, N'Arteon', N'Mid-size solid car', CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[Models] ([ModelID], [BrandID], [ModelName], [Descr], [ProducStart], [ProducEnd]) VALUES (11, 2, N'California', N'Large solid car', CAST(N'2003-01-01' AS Date), CAST(N'2019-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Models] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (2, 1, 1, 9, 50000.0000, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (3, 2, 1, 10, 83040.0000, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (4, 3, 1, 9, 52000.0000, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (5, 4, 2, 8, 100000.0000, CAST(N'2017-04-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (6, 5, 2, 6, 49000.0000, CAST(N'2017-05-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (7, 6, 2, 6, 48000.0000, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (8, 2, 3, 2, 80000.0000, CAST(N'2017-07-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (9, 6, 3, 1, 57000.0000, CAST(N'2017-08-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Orders] ([OrdersID], [ClientID], [EmployeeID], [ModelID], [SalePrice], [OrderDate], [Completed], [Paid]) VALUES (10, 4, 3, 0, 40000.0000, CAST(N'2017-09-02T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PriceList] ON 

INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (1, 0, 40000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (2, 1, 60000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (3, 2, 80000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (7, 6, 50000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (8, 7, 80000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (9, 8, 100000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (10, 9, 55000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (11, 10, 83040.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[PriceList] ([PriceListID], [ModelID], [Price], [FromDate], [ToDate]) VALUES (12, 11, 124000.0000, CAST(N'2017-01-01' AS Date), CAST(N'2019-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[PriceList] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [Name]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [Name] ON [dbo].[Brand]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ClientFirstName]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [ClientFirstName] ON [dbo].[Client]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ClientSurname]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [ClientSurname] ON [dbo].[Client]
(
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PersonalID]    Script Date: 06/06/2018 21:56:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [PersonalID] ON [dbo].[Client]
(
	[PersonalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FirstName]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [FirstName] ON [dbo].[Employee]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PESEL]    Script Date: 06/06/2018 21:56:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [PESEL] ON [dbo].[Employee]
(
	[PESEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Surname]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [Surname] ON [dbo].[Employee]
(
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ModelName]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [ModelName] ON [dbo].[Models]
(
	[ModelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ClientOrderID]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [ClientOrderID] ON [dbo].[Orders]
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CompletedOrder]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [CompletedOrder] ON [dbo].[Orders]
(
	[Completed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [EmployeeOrderID]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [EmployeeOrderID] ON [dbo].[Orders]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ModelOrderID]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [ModelOrderID] ON [dbo].[Orders]
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PaidOrder]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [PaidOrder] ON [dbo].[Orders]
(
	[Paid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ModelPrice]    Script Date: 06/06/2018 21:56:03 ******/
CREATE NONCLUSTERED INDEX [ModelPrice] ON [dbo].[PriceList]
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ClientID]  DEFAULT ((-1)) FOR [ClientID]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_EmployeeID]  DEFAULT ((-1)) FOR [EmployeeID]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ModelID]  DEFAULT ((-1)) FOR [ModelID]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Paid]  DEFAULT ((0)) FOR [Paid]
GO
ALTER TABLE [dbo].[PriceList] ADD  CONSTRAINT [DF_PriceList_ModelID]  DEFAULT ((-1)) FOR [ModelID]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [Brand_Model] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [Brand_Model]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [Employee_Order] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Employee_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Client]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [Model_Order] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Model_Order]
GO
ALTER TABLE [dbo].[PriceList]  WITH CHECK ADD  CONSTRAINT [Price_Model] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[PriceList] CHECK CONSTRAINT [Price_Model]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [SalesPrice] CHECK  (([SalePrice]>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SalesPrice]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary Key Autoinc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Brand', @level2type=N'COLUMN',@level2name=N'BrandID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Image file name to company logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Brand', @level2type=N'COLUMN',@level2name=N'Logo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Website of the company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Brand', @level2type=N'COLUMN',@level2name=N'WebLink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about the company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Brand', @level2type=N'COLUMN',@level2name=N'Descr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Car brands' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary Client id key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'ClientID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First name of client' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of client' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'Surname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phone number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Home address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Female, 2-Male' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Misc notes about the client' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Personal ID Document number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'PersonalID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Our clients' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First name of employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of employee' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Surname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique PESEL number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'PESEL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phone number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Home address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Female, 2-Male' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date from which the employee started working' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'EmployStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Birthday' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'DOB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Record of all workers' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary model id key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Models', @level2type=N'COLUMN',@level2name=N'ModelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Brand id on Brand table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Models', @level2type=N'COLUMN',@level2name=N'BrandID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique car model name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Models', @level2type=N'COLUMN',@level2name=N'ModelName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about the car model' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Models', @level2type=N'COLUMN',@level2name=N'Descr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The starting date of production' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Models', @level2type=N'COLUMN',@level2name=N'ProducStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ending date of production' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Models', @level2type=N'COLUMN',@level2name=N'ProducEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Car models ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Models'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary Order id key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'OrdersID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price at which the product was sold' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'SalePrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Not Completed, 1-Completed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Completed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-Not Paid, 1-Paid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Paid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Orders of cars by clients' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceList', @level2type=N'COLUMN',@level2name=N'PriceListID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key from models table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceList', @level2type=N'COLUMN',@level2name=N'ModelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How much a certain model costs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceList', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date from which this price was valid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceList', @level2type=N'COLUMN',@level2name=N'FromDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date to which this price was valid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceList', @level2type=N'COLUMN',@level2name=N'ToDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of prices of car models' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriceList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 320
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Models"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Brand"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[30] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 7
               Left = 42
               Bottom = 281
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Models"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PriceList"
            Begin Extent = 
               Top = 63
               Left = 548
               Bottom = 297
               Right = 742
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[14] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Models"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Brand"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[30] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 266
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 8
               Left = 393
               Bottom = 286
               Right = 587
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_4'
GO
USE [master]
GO
ALTER DATABASE [Projekt_11306] SET  READ_WRITE 
GO
