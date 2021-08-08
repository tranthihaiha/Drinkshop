USE [master]
GO
/****** Object:  Database [WebBanNuoc]    Script Date: 3/19/2021 9:38:20 PM ******/
CREATE DATABASE [WebBanNuoc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBanNuoc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\WebBanNuoc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebBanNuoc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\WebBanNuoc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebBanNuoc] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebBanNuoc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebBanNuoc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebBanNuoc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebBanNuoc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebBanNuoc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebBanNuoc] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebBanNuoc] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebBanNuoc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebBanNuoc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebBanNuoc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebBanNuoc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebBanNuoc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebBanNuoc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebBanNuoc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebBanNuoc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebBanNuoc] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebBanNuoc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebBanNuoc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebBanNuoc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebBanNuoc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebBanNuoc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebBanNuoc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebBanNuoc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebBanNuoc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebBanNuoc] SET  MULTI_USER 
GO
ALTER DATABASE [WebBanNuoc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebBanNuoc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebBanNuoc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebBanNuoc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebBanNuoc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebBanNuoc] SET QUERY_STORE = OFF
GO
USE [WebBanNuoc]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [WebBanNuoc]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/19/2021 9:38:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryid] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OderDetail]    Script Date: 3/19/2021 9:38:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OderDetail](
	[detailID] [varchar](10) NOT NULL,
	[idProduct] [varchar](10) NOT NULL,
	[nameProduct] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[orderID] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/19/2021 9:38:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [varchar](10) NOT NULL,
	[userID] [varchar](10) NOT NULL,
	[oDate] [date] NOT NULL,
	[total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/19/2021 9:38:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[idProduct] [varchar](10) NOT NULL,
	[nameProduct] [nvarchar](50) NOT NULL,
	[categoryid] [varchar](10) NOT NULL,
	[price] [float] NOT NULL,
	[imageUrl] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/19/2021 9:38:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [varchar](10) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [varchar](120) NOT NULL,
	[isSell] [int] NOT NULL,
	[isAdmin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([categoryid], [categoryName]) VALUES (N'1', N'Nước Ngọt')
GO
INSERT [dbo].[Category] ([categoryid], [categoryName]) VALUES (N'2', N'Trà Sữa')
GO
INSERT [dbo].[Category] ([categoryid], [categoryName]) VALUES (N'3', N'Trà')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'1', N'Trà Xanh', N'1', 10000, N'traxanh.png')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'2', N'C2', N'1', 10000, N'c2.png')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'3', N'Bò Húc', N'1', 10000, N'bohuc.png')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'4', N'Trân châu đường đen', N'2', 30000, N'tranchauduongden.png')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'5', N'Truyền Thống', N'2', 15000, N'truyenthong.png')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'6', N'Trà sữa Yakult Vải', N'2', 30000, N'yakulvai.png')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'7', N'Trà chanh', N'3', 10000, N'trachanh.png')
GO
INSERT [dbo].[Product] ([idProduct], [nameProduct], [categoryid], [price], [imageUrl]) VALUES (N'9', N'Trà vải', N'3', 20000, N'travai.png')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [isSell], [isAdmin]) VALUES (N'admin', N'admin', N'admin', 0, 1)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [isSell], [isAdmin]) VALUES (N'hoang', N'hoang', N'12345', 1, 0)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [isSell], [isAdmin]) VALUES (N'khoi', N'khoi mom', N'123', 1, 0)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [isSell], [isAdmin]) VALUES (N'quang', N'123', N'5151', 1, 0)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [isSell], [isAdmin]) VALUES (N'thai', N'123', N'thai123', 1, 0)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [isSell], [isAdmin]) VALUES (N'thai123', N'thai', N'123456', 1, 0)
GO
ALTER TABLE [dbo].[OderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OderDetail_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OderDetail] CHECK CONSTRAINT [FK_OderDetail_Orders]
GO
ALTER TABLE [dbo].[OderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OderDetail_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[OderDetail] CHECK CONSTRAINT [FK_OderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([categoryid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [WebBanNuoc] SET  READ_WRITE 
GO
