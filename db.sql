USE [master]
GO
/****** Object:  Database [! 419/5Golos d]    Script Date: 16.03.2023 17:31:22 ******/
CREATE DATABASE [! 419/5Golos d]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'! 419_5Golos d', FILENAME = N'D:\MSSQL14.SQLSERVER\MSSQL\DATA\! 419_5Golos d.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'! 419_5Golos d_log', FILENAME = N'D:\MSSQL14.SQLSERVER\MSSQL\DATA\! 419_5Golos d_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [! 419/5Golos d] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [! 419/5Golos d].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [! 419/5Golos d] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET ARITHABORT OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [! 419/5Golos d] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [! 419/5Golos d] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET  DISABLE_BROKER 
GO
ALTER DATABASE [! 419/5Golos d] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [! 419/5Golos d] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [! 419/5Golos d] SET  MULTI_USER 
GO
ALTER DATABASE [! 419/5Golos d] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [! 419/5Golos d] SET DB_CHAINING OFF 
GO
ALTER DATABASE [! 419/5Golos d] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [! 419/5Golos d] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [! 419/5Golos d] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [! 419/5Golos d] SET QUERY_STORE = OFF
GO
USE [! 419/5Golos d]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 16.03.2023 17:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16.03.2023 17:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[DeliveryDate] [date] NULL,
	[AcceptDate] [date] NOT NULL,
	[PickupPoint] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Client] [nvarchar](50) NULL,
 CONSTRAINT [PK__Order__C3905BAFF0378419] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 16.03.2023 17:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16.03.2023 17:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ArticleNumber] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Cost] [float] NOT NULL,
	[DiscountAmount] [tinyint] NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Provider] [nvarchar](50) NOT NULL,
	[MaxDiscount] [tinyint] NOT NULL,
	[ImagePath] [nvarchar](50) NULL,
 CONSTRAINT [PK__Product__2EA7DCD584656FBC] PRIMARY KEY CLUSTERED 
(
	[ArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.03.2023 17:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.03.2023 17:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [varchar](100) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[UserPatronymic] [varchar](100) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCACA2BFC974] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Offices] ON 

INSERT [dbo].[Offices] ([id], [address]) VALUES (1, N'344288, г. Краснокаменск, ул. Чехова, 1')
INSERT [dbo].[Offices] ([id], [address]) VALUES (2, N'614164, г.Краснокаменск,  ул. Степная, 30')
INSERT [dbo].[Offices] ([id], [address]) VALUES (3, N'394242, г. Краснокаменск, ул. Коммунистическая, 43')
INSERT [dbo].[Offices] ([id], [address]) VALUES (4, N'660540, г. Краснокаменск, ул. Солнечная, 25')
INSERT [dbo].[Offices] ([id], [address]) VALUES (5, N'125837, г. Краснокаменск, ул. Шоссейная, 40')
INSERT [dbo].[Offices] ([id], [address]) VALUES (6, N'125703, г. Краснокаменск, ул. Партизанская, 49')
INSERT [dbo].[Offices] ([id], [address]) VALUES (7, N'625283, г. Краснокаменск, ул. Победы, 46')
INSERT [dbo].[Offices] ([id], [address]) VALUES (8, N'614611, г. Краснокаменск, ул. Молодежная, 50')
INSERT [dbo].[Offices] ([id], [address]) VALUES (9, N'454311, г.Краснокаменск, ул. Новая, 19')
INSERT [dbo].[Offices] ([id], [address]) VALUES (10, N'660007, г.Краснокаменск, ул. Октябрьская, 19')
INSERT [dbo].[Offices] ([id], [address]) VALUES (11, N'603036, г. Краснокаменск, ул. Садовая, 4')
INSERT [dbo].[Offices] ([id], [address]) VALUES (12, N'450983, г.Краснокаменск, ул. Комсомольская, 26')
INSERT [dbo].[Offices] ([id], [address]) VALUES (13, N'394782, г. Краснокаменск, ул. Чехова, 3')
INSERT [dbo].[Offices] ([id], [address]) VALUES (14, N'603002, г. Краснокаменск, ул. Дзержинского, 28')
INSERT [dbo].[Offices] ([id], [address]) VALUES (15, N'450558, г. Краснокаменск, ул. Набережная, 30')
INSERT [dbo].[Offices] ([id], [address]) VALUES (16, N'394060, г.Краснокаменск, ул. Фрунзе, 43')
INSERT [dbo].[Offices] ([id], [address]) VALUES (17, N'410661, г. Краснокаменск, ул. Школьная, 50')
INSERT [dbo].[Offices] ([id], [address]) VALUES (18, N'625590, г. Краснокаменск, ул. Коммунистическая, 20')
INSERT [dbo].[Offices] ([id], [address]) VALUES (19, N'625683, г. Краснокаменск, ул. 8 Марта')
INSERT [dbo].[Offices] ([id], [address]) VALUES (20, N'400562, г. Краснокаменск, ул. Зеленая, 32')
INSERT [dbo].[Offices] ([id], [address]) VALUES (21, N'614510, г. Краснокаменск, ул. Маяковского, 47')
INSERT [dbo].[Offices] ([id], [address]) VALUES (22, N'410542, г. Краснокаменск, ул. Светлая, 46')
INSERT [dbo].[Offices] ([id], [address]) VALUES (23, N'620839, г. Краснокаменск, ул. Цветочная, 8')
INSERT [dbo].[Offices] ([id], [address]) VALUES (24, N'443890, г. Краснокаменск, ул. Коммунистическая, 1')
INSERT [dbo].[Offices] ([id], [address]) VALUES (25, N'603379, г. Краснокаменск, ул. Спортивная, 46')
INSERT [dbo].[Offices] ([id], [address]) VALUES (26, N'603721, г. Краснокаменск, ул. Гоголя, 41')
INSERT [dbo].[Offices] ([id], [address]) VALUES (27, N'410172, г. Краснокаменск, ул. Северная, 13')
INSERT [dbo].[Offices] ([id], [address]) VALUES (28, N'420151, г. Краснокаменск, ул. Вишневая, 32')
INSERT [dbo].[Offices] ([id], [address]) VALUES (29, N'125061, г. Краснокаменск, ул. Подгорная, 8')
INSERT [dbo].[Offices] ([id], [address]) VALUES (30, N'630370, г. Краснокаменск, ул. Шоссейная, 24')
INSERT [dbo].[Offices] ([id], [address]) VALUES (31, N'614753, г. Краснокаменск, ул. Полевая, 35')
INSERT [dbo].[Offices] ([id], [address]) VALUES (32, N'426030, г. Краснокаменск, ул. Маяковского, 44')
INSERT [dbo].[Offices] ([id], [address]) VALUES (33, N'450375, г. Краснокаменск ул. Клубная, 44')
INSERT [dbo].[Offices] ([id], [address]) VALUES (34, N'625560, г. Краснокаменск, ул. Некрасова, 12')
INSERT [dbo].[Offices] ([id], [address]) VALUES (35, N'630201, г. Краснокаменск, ул. Комсомольская, 17')
INSERT [dbo].[Offices] ([id], [address]) VALUES (36, N'190949, г. Краснокаменск, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[Offices] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (1, N'Завершен
', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-05' AS Date), 13, 301, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (2, N'Новый 
', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-05' AS Date), 12, 302, N'Никулин Антон Фёдорович
')
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (4, N'Завершен
', CAST(N'2022-05-12' AS Date), CAST(N'2022-05-06' AS Date), 13, 303, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (5, N'Завершен
', CAST(N'2022-05-13' AS Date), CAST(N'2022-05-07' AS Date), 14, 304, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (6, N'Новый 
', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-09' AS Date), 15, 305, N'Копылова Софья Николаевна
')
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (7, N'Новый 
', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-09' AS Date), 16, 306, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (8, N'Завершен
', CAST(N'2022-05-16' AS Date), CAST(N'2022-05-10' AS Date), 16, 307, N'Петров Ибрагим Романович
')
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (10, N'Завершен
', CAST(N'2022-05-17' AS Date), CAST(N'2022-05-11' AS Date), 18, 308, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (11, N'Новый 
', CAST(N'2022-05-18' AS Date), CAST(N'2022-05-12' AS Date), 20, 309, NULL)
INSERT [dbo].[Order] ([OrderID], [Status], [DeliveryDate], [AcceptDate], [PickupPoint], [Code], [Client]) VALUES (12, N'Завершен
', CAST(N'2022-05-18' AS Date), CAST(N'2022-05-12' AS Date), 20, 310, N'Овсянников Никита Сергеевич
')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'A395T3', N'Набор кастрюль', N'Набор кастрюль Эмаль Дача 2-3194/4 белый', N'Кастрюли', N'Эмаль', 2150, 2, 13, N'Домовой', 15, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'C367R6', N'Набор кастрюль', N'Набор кастрюль Webber BE-336/6 6 пр. серебристый', N'Кастрюли', N'Webber', 3600, 3, 7, N'Максидом', 15, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'C425F8', N'Набор посуды', N'Набор обеденной посуды Mason Cash Classic 12 предметов серый', N'Посуда', N'Нева', 5990, 5, 9, N'Домовой', 15, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'C432H7', N'Набор посуды', N'Набор посуды Tefal Ingenio Red 04162820 3 пр. красный', N'Посуда', N'Tefal', 2700, 4, 6, N'Максидом', 30, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'D026R4', N'Сковорода', N'Сковорода НЕВА МЕТАЛЛ ПОСУДА Карелия 2328, 28 см', N'Сковорода', N'Нева', 1800, 4, 2, N'Домовой', 25, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'D036H2', N'Сковорода', N'Сковорода НЕВА МЕТАЛЛ ПОСУДА Алтай индукционная, 26 см', N'Сковорода', N'Нева', 1960, 5, 12, N'Максидом', 5, N'../D036H2.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'D548T5', N'Столовый сервиз', N'Столовый сервиз Luminarc Every Day G0566, 6 персон, 18 предм.', N'Сервиз', N'Luminarc', 1700, 4, 10, N'Домовой', 15, N'../D548T5.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'D630H5', N'Набор кастрюль', N'Набор кастрюль Webber BE-621/6 стальной', N'Кастрюли', N'Webber', 2000, 3, 8, N'Максидом', 10, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'D644G3', N'Набор кастрюль', N'Набор кастрюль Webber ВЕ-620/8 8 пр. стальной', N'Кастрюли', N'Webber', 3500, 3, 8, N'Домовой', 5, N'../D644G3.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'F735F5', N'Сковорода', N'Сковорода НЕВА МЕТАЛЛ ПОСУДА Домашняя 7424, съемная ручка, 24 см', N'Сковорода', N'Нева', 1270, 2, 4, N'Домовой', 10, N'../F735F5.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'F835F5', N'Набор посуды', N'Набор посуды SOLARIS S1605: 6 тарелок 180мм в контейнере', N'Сервиз', N'Solaris', 732, 2, 9, N'Домовой', 10, N'../F835F5.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'F835H6', N'Кастрюля для запекания', N'Кастрюля эмалированная, цветок Розы', N'Кастрюли', N'Нева', 2130, 2, 5, N'Домовой', 10, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'F836E5', N'Набор сковород', N'Набор сковород Tefal Ingenio Chef Red L6598672 3 пр. бордовый', N'Сковорода', N'Tefal', 4600, 2, 6, N'Максидом', 20, N'../F836E5.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'F934E5', N'Сервировочное блюдо', N'Сервировочное блюдо ROSSI для подачи из керамики 28х18 см ', N'Посуда', N'Нева', 1200, 3, 5, N'Максидом', 10, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'G405K9', N'Набор посуды', N'Набор посуды SOLARIS S1607: 6 стаканов 0,1л в контейнере', N'Посуда', N'Solaris', 240, 4, 23, N'Домовой', 5, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'H482Y6', N'Столовый сервиз', N'Столовый сервиз Luminarc Cadix L0300, 6 персон, 19 предм.', N'Сервиз', N'Luminarc', 2300, 5, 12, N'Максидом', 15, N'../H482Y6.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'J468K6', N'Набор сковород', N'Набор сковород GALAXY GL9801 2 пр. синий', N'Сковорода', N'Galaxy', 1390, 2, 13, N'Домовой', 25, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'K036S3', N'Набор посуды', N'Набор посуды GALAXY GL9507 6 пр. коричневый', N'Сервиз', N'Galaxy', 2990, 5, 15, N'Максидом', 5, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'K935B6', N'Салатник', N'Салатник «Кото», 0,19 л 10 см красный, фарфор', N'Посуда', N'Нева', 1200, 3, 9, N'Домовой', 5, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'L346D4', N'Набор кружек', N'Набор кружек Pasabahce Basic, 370 мл, 2 предм., 2 персоны', N'Посуда', N'Нева', 329, 5, 18, N'Максидом', 5, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'M045H6', N'Набор кастрюль', N'Набор кастрюль СтальЭмаль 1с33/1 6 пр. белоснежный /маки ', N'Кастрюли', N'Эмаль', 1499, 4, 7, N'Максидом', 15, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'M527Y7', N'Казан', N'Казан 5 л Наша Посуда антипригарный', N'Кастрюли', N'Нева', 1999, 3, 6, N'Максидом', 30, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'N835D4', N'Набор кастрюль', N'Набор кастрюль GALAXY GL9512 4 пр. фиолетовый', N'Кастрюли', N'Galaxy', 2100, 3, 5, N'Домовой', 10, N'../N835D4.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'N835F5', N'Кастрюля для запекания', N'Кастрюля для запекания Tefal 208AC00/1043, 2.3 л, 23 см', N'Кастрюли', N'Tefal', 744, 3, 13, N'Домовой', 5, N'../N835F5.jpg
')
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'S257G5', N'Набор посуды', N'Набор посуды для выпечки O CUISINE 333SA95/6142', N'Посуда', N'Tefal', 2300, 4, 8, N'Максидом', 10, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'S306J8', N'Ковш', N'Ковш б/деколи(палевый) 17,5х8 см 1,5 л', N'Посуда', N'Tefal', 409, 2, 14, N'Домовой', 10, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'S413D4', N'Набор кастрюль', N'Набор кастрюль СтальЭмаль 7DA025S 6 пр. слоновая кость', N'Кастрюли', N'Эмаль', 4500, 3, 15, N'Домовой', 15, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'S835H6', N'Кастрюля для запекания', N'Кастрюля Scovo Expert СЭ-008, 4.5 л', N'Кастрюли', N'Tefal', 1600, 4, 13, N'Домовой', 15, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'V493H5', N'Набор посуды', N'Набор посуды Tefal Ingenio RED 9 предметов ', N'Посуда', N'Tefal', 6000, 4, 18, N'Максидом', 15, NULL)
INSERT [dbo].[Product] ([ArticleNumber], [Name], [Description], [Category], [Manufacturer], [Cost], [DiscountAmount], [QuantityInStock], [Provider], [MaxDiscount], [ImagePath]) VALUES (N'А112Т4', N'Набор кастрюль', N'Набор кастрюль Webber BE-335/6 6 пр. серебристый', N'Кастрюли', N'Webber', 2600, 4, 6, N'Максидом', 30, N'../А112Т4.jpg
')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор
')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер
')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент
')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Федоров', N'Глеб', N'Михайлович', N'o@outlook.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Семенова
', N'Софья
', N'Дмитриевна
', N'hr6zdl@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Васильев
', N'Егор
', N'Германович
', N'kaft93x@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Смирнова
', N'Ирина
', N'Александровна
', N'dcu@yandex.ru', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Петров
', N'Андрей
', N'Владимирович
', N'19dn@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Егоров
', N'Максим
', N'Андреевич
', N'pa5h@mail.ru', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Никитин
', N'Артур
', N'Алексеевич
', N'281av0@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Киселев
', N'Максим
', N'Сергеевич
', N'8edmfh@outlook.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Борисов
', N'Тимур
', N'Егорович
', N'sfn13i@mail.ru', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Климов
', N'Арсений
', N'Тимурович
', N'g0orc3x1@outlook.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Offices] FOREIGN KEY([PickupPoint])
REFERENCES [dbo].[Offices] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Offices]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__4316F928] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__4316F928]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__440B1D61] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__440B1D61]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__3C69FB99] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__3C69FB99]
GO
USE [master]
GO
ALTER DATABASE [! 419/5Golos d] SET  READ_WRITE 
GO
