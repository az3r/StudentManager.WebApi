USE [master]
GO
/****** Object:  Database [StudentManager.Database]    Script Date: 7/25/2020 10:22:30 PM ******/
CREATE DATABASE [StudentManager.Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManager.Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudentManager.Database.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentManager.Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudentManager.Database_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentManager.Database] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManager.Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManager.Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManager.Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManager.Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManager.Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManager.Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManager.Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentManager.Database] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManager.Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManager.Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManager.Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManager.Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManager.Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManager.Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManager.Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManager.Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManager.Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentManager.Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManager.Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManager.Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManager.Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManager.Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManager.Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentManager.Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManager.Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentManager.Database] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManager.Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManager.Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManager.Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManager.Database] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StudentManager.Database]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[TeacherId] [char](9) NOT NULL,
	[Salt] [binary](128) NOT NULL,
	[Password] [binary](128) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [char](4) NOT NULL,
	[ClassName] [char](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassNotification]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassNotification](
	[NotificationId] [int] NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[ClassId] [char](4) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrolledClass]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnrolledClass](
	[StudentId] [char](7) NOT NULL,
	[ClassId] [char](4) NOT NULL,
 CONSTRAINT [PK_EnrolledClass] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HomeRoom]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HomeRoom](
	[ClassId] [char](4) NOT NULL,
	[TeacherId] [char](9) NOT NULL,
	[AcademicYear] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonalInfo]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonalInfo](
	[PersonalInfoId] [varchar](9) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[LastName] [nvarchar](10) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[MiddleName] [nvarchar](10) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[IsMale] [bit] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonalInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [char](10) NOT NULL,
	[RoomName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [char](10) NOT NULL,
	[SessionId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[ClassId] [char](4) NOT NULL,
	[RoomId] [char](10) NOT NULL,
	[Semester] [int] NOT NULL,
	[AcademicYear] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolRole]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolRole](
	[RoleId] [char](10) NOT NULL,
	[RoleLevel] [int] NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Score]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Score](
	[ScoreId] [char](11) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[StudentId] [char](7) NOT NULL,
	[Semester] [int] NOT NULL,
	[AcademicYear] [int] NOT NULL,
	[ScoreType] [int] NOT NULL,
	[ScoreValue] [float] NOT NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ScoreId] ASC,
	[SubjectId] ASC,
	[StudentId] ASC,
	[Semester] ASC,
	[AcademicYear] ASC,
	[ScoreType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Session]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] NOT NULL,
	[BeginTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [char](7) NOT NULL,
	[IsGraduated] [bit] NOT NULL,
	[PersonalInfoId] [varchar](9) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/25/2020 10:22:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [char](9) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[RoleId] [char](10) NOT NULL,
	[PersonalInfoId] [varchar](9) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (N'10A1', N'10A1')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (N'10A2', N'10A2')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (N'11A1', N'11A1')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (N'11A2', N'11A2')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (N'12A1', N'12A1')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (N'12A2', N'12A2')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140715', N'11A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140716', N'11A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140717', N'11A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140718', N'11A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140719', N'11A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140710', N'12A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140711', N'12A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140712', N'12A1')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140713', N'12A2')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId]) VALUES (N'1140714', N'12A2')
INSERT [dbo].[HomeRoom] ([ClassId], [TeacherId], [AcademicYear]) VALUES (N'11A1', N'000000003', 2016)
INSERT [dbo].[HomeRoom] ([ClassId], [TeacherId], [AcademicYear]) VALUES (N'12A1', N'000000001', 2016)
INSERT [dbo].[HomeRoom] ([ClassId], [TeacherId], [AcademicYear]) VALUES (N'12A2', N'000000002', 2016)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000000', N'2/13 Thống Nhất, phường 16, quận Gò Vấp, Tp. HCM', N'Nguyễn', N'Đạo', N'Bá', N'nbdao@gmail.com', N'0923856621', 1, CAST(0x900A0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000001', N'Số 11, đường Hương Lam, Phường Tân Hưng, Quận 7, Tp. HCM', N'Lê', N'Em', N'Văn', N'lvem@gmail.com', N'0902000672', 1, CAST(0x1B190B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000002', N'399/1B, đường số 8, phường 11, quận Gò Vấp, TPHCM', N'Võ', N'Hường', N'Thị Thu', N'vtthuong@gmail.com', N'0902310063', 1, CAST(0xAE120B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000003', N'A50, Đường Số 14, Quận 7, Tp. HCM', N'Văn', N'G', N'Công', N'vcg@gmail.com', N'0902990059', 1, CAST(0x710F0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000004', N'55/6 Đường số 1, P. Tăng Nhơn Phú B, Q.9, TP.HCM', N'Võ', N'Hạnh', N'Văn', N'vvhanh@gmail.com', N'0902900031', 1, CAST(0x9B0A0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000005', N'132 Đường số 65, Tân Phong, Quận 7, Hồ Chí Minh', N'Nguyễn', N'Quân', N'Trung', N'ntquan@gmail.com', N'0381237125', 1, CAST(0x0A150B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000006', N'20, đường số 13, Sông Thao, Tx. Long Khánh,tỉnh Đồng Nai', N'Nguyễn', N'Én', N'Thị', N'nten@gmail.com', N'0381223315', 1, CAST(0xBC130B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000007', N'55/6 Đường số 1, P. Tăng Nhơn Phú B, Q.9, TP.HCM', N'Huỳnh', N'C', N'Thị', N'htc@gmail.com', N'0381231231', 1, CAST(0x0D1A0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000008', N'132 Đường số 65, Tân Phong, Quận 7, Hồ Chí Minh', N'Nguyễn', N'Lượng', N'Văn', N'nvluong@gmail.com', N'0323121211', 1, CAST(0x791C0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000009', N'20, đường số 13, Sông Thao, Tx. Long Khánh,tỉnh Đồng Nai', N'Lê', N'Duyên', N'Trương Mỹ', N'ltmduyen@gmail.com', N'0361251232', 1, CAST(0x961C0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000010', N'2/30, đường Phạm Văn Hai, Phường 13, Quận Tân Bình, Tp. HCM', N'Nguyễn', N'Vinh', N'Trí', N'ntvinh@gmail.com', N'0868459091', 1, CAST(0x5E230B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000011', N'Số 3, đường số 4, phường Linh Xuân, quận Thủ Đức', N'Nguyễn', N'D', N'Trần', N'ntd@gmail.com', N'0902220163', 1, CAST(0x1D1D0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000012', N'Số 11, Đường D1, Phường 25, Quận Bình Thạnh, Tp. HCM', N'Trần', N'Công', N'Văn', N'tvcong@gmail.com', N'0902350115', 1, CAST(0xCA1C0B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'000000013', N'21/70/07 Đường số 9, phường 16, quận Gò Vấp, Tp.HCM', N'Nguyễn', N'Văn', N'', N'nvan@gmail.com', N'0381237125', 1, CAST(0x11190B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000000', N'2/13 Thống Nhất, phường 16, quận Gò Vấp, Tp. HCM', N'Nguyễn', N'A', N'Văn', N'nvaaa@gmail.com', N'0123456789', 1, CAST(0xBB220B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000001', N'21/70/07 Đường số 9, phường 16, quận Gò Vấp, Tp.HCM', N'Lê', N'Thị', N'', N'lthi@gmail.com', N'0213412312', 0, CAST(0xFE220B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000002', N'Số 11, Đường D1, Phường 25, Quận Bình Thạnh, Tp. HCM', N'Nguyễn', N'Mạnh', N'Đức', N'nmduc@gmail.com', N'0972712312', 1, CAST(0xFC230B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000003', N'Số 3, đường số 4, phường Linh Xuân, quận Thủ Đức', N'Nguyễn', N'An', N'Mạnh', N'nman@gmail.com', N'0987657788', 1, CAST(0x5A230B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000004', N'Số 11, đường Hương Lam, Phường Tân Hưng, Quận 7, Tp. HCM', N'Nguyễn', N'Nghi', N'Thị Minh', N'ntmnghi@gmail.com', N'0912317271', 0, CAST(0x7E230B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000005', N'399/1B, đường số 8, phường 11, quận Gò Vấp, TPHCM', N'Hoàng', N'Hằng', N'Thúy', N'hthang@gmail.com', N'0123123412', 0, CAST(0x08250B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000006', N'A50, Đường Số 14, Quận 7, Tp. HCM', N'Nguyễn', N'Tuấn', N'Quốc', N'nqtuan@gmail.com', N'0293123112', 1, CAST(0x2A240B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000007', N'55/6 Đường số 1, P. Tăng Nhơn Phú B, Q.9, TP.HCM', N'Lê', N'Tú', N'Anh', N'latu@gmail.com', N'0192931232', 0, CAST(0x4B250B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000008', N'132 Đường số 65, Tân Phong, Quận 7, Hồ Chí Minh', N'Trần', N'Sen', N'Thị Hồng', N'tthsen@gmail.com', N'0219239123', 0, CAST(0x13250B00 AS Date), NULL)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo]) VALUES (N'100000009', N'20, đường số 13, Sông Thao, Tx. Long Khánh,tỉnh Đồng Nai', N'Nguyễn', N'Trí', N'', N'ntri@gmail.com', N'0219301231', 1, CAST(0xCF240B00 AS Date), NULL)
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000000', N'A000')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000001', N'A001')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000002', N'A002')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000003', N'A003')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000004', N'A004')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000005', N'A100')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000006', N'A101')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000007', N'A102')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000008', N'A103')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000009', N'A104')
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000001', 1, 1, N'11A1', N'0000000005', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000002', 2, 1, N'11A1', N'0000000005', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000003', 3, 7, N'11A1', N'0000000005', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000004', 4, 7, N'11A1', N'0000000005', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000005', 5, 6, N'11A1', N'0000000005', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000006', 1, 1, N'11A1', N'0000000005', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000007', 2, 3, N'11A1', N'0000000005', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000008', 3, 4, N'11A1', N'0000000005', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000009', 4, 2, N'11A1', N'0000000005', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000010', 5, 2, N'11A1', N'0000000005', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000011', 1, 7, N'11A1', N'0000000005', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000012', 2, 7, N'11A1', N'0000000005', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000013', 3, 1, N'11A1', N'0000000005', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000014', 4, 1, N'11A1', N'0000000005', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000015', 5, 3, N'11A1', N'0000000005', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000016', 1, 4, N'11A1', N'0000000005', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000017', 2, 6, N'11A1', N'0000000005', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000018', 3, 7, N'11A1', N'0000000005', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000019', 4, 1, N'11A1', N'0000000005', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000020', 5, 1, N'11A1', N'0000000005', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000021', 6, 9, N'11A1', N'0000000005', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'11A1000022', 7, 9, N'11A1', N'0000000005', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000001', 1, 7, N'12A1', N'0000000002', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000002', 2, 7, N'12A1', N'0000000002', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000003', 3, 7, N'12A1', N'0000000002', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000004', 4, 7, N'12A1', N'0000000002', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000005', 5, 7, N'12A1', N'0000000002', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000006', 1, 6, N'12A1', N'0000000002', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000007', 2, 6, N'12A1', N'0000000002', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000008', 3, 5, N'12A1', N'0000000002', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000009', 4, 5, N'12A1', N'0000000002', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000010', 5, 4, N'12A1', N'0000000002', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000011', 1, 8, N'12A1', N'0000000002', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000012', 2, 1, N'12A1', N'0000000002', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000013', 3, 1, N'12A1', N'0000000002', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000014', 4, 1, N'12A1', N'0000000002', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000015', 5, 1, N'12A1', N'0000000002', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000016', 1, 4, N'12A1', N'0000000002', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000017', 2, 3, N'12A1', N'0000000002', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000018', 3, 3, N'12A1', N'0000000002', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000019', 4, 2, N'12A1', N'0000000002', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000020', 5, 2, N'12A1', N'0000000002', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000021', 7, 9, N'12A1', N'0000000002', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A1000022', 8, 9, N'12A1', N'0000000002', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000001', 1, 1, N'12A2', N'0000000004', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000002', 2, 1, N'12A2', N'0000000004', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000003', 3, 1, N'12A2', N'0000000004', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000004', 4, 1, N'12A2', N'0000000004', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000005', 5, 8, N'12A2', N'0000000004', 1, 2017, 2)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000006', 1, 2, N'12A2', N'0000000004', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000007', 2, 2, N'12A2', N'0000000004', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000008', 3, 3, N'12A2', N'0000000004', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000009', 4, 3, N'12A2', N'0000000004', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000010', 5, 4, N'12A2', N'0000000004', 1, 2017, 3)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000011', 1, 7, N'12A2', N'0000000004', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000012', 2, 7, N'12A2', N'0000000004', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000013', 3, 7, N'12A2', N'0000000004', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000014', 4, 7, N'12A2', N'0000000004', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000015', 5, 7, N'12A2', N'0000000004', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000016', 1, 4, N'12A2', N'0000000004', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000017', 2, 5, N'12A2', N'0000000004', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000018', 3, 5, N'12A2', N'0000000004', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000019', 4, 6, N'12A2', N'0000000004', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000020', 5, 6, N'12A2', N'0000000004', 1, 2017, 4)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000021', 6, 9, N'12A2', N'0000000004', 1, 2017, 5)
INSERT [dbo].[Schedule] ([ScheduleId], [SessionId], [SubjectId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (N'12A2000022', 7, 9, N'12A2', N'0000000004', 1, 2017, 5)
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'0000000000', 0, N'Hiệu trưởng')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'1000000001', 1, N'Phó hiệu trưởng 1')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'1000000002', 1, N'Phó hiệu trưởng 2')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'2000000001', 2, N'Tổng phụ trác')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'2000000002', 2, N'Bí thư đoàn')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'2000000003', 2, N'Phó bí thư đoàn')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'3000000001', 3, N'Thư viện trưởng')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'3000000002', 6, N'Cộng tác viên')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'4000000001', 4, N'Trưởng bộ môn')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'5000000001', 5, N'Giáo viên bộ môn')
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407100101', 5, N'1140710', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 1, N'1140711', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 2, N'1140711', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 3, N'1140711', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 4, N'1140711', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 5, N'1140711', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 6, N'1140711', 2, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 7, N'1140711', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 8, N'1140711', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110101', 9, N'1140711', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 1, N'1140711', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 1, N'1140711', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 2, N'1140711', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 2, N'1140711', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 3, N'1140711', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 3, N'1140711', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 4, N'1140711', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 4, N'1140711', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 5, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 5, N'1140711', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 6, N'1140711', 1, 2016, 1, 7.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 6, N'1140711', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 7, N'1140711', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 7, N'1140711', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 8, N'1140711', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 8, N'1140711', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 9, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110102', 9, N'1140711', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 1, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 1, N'1140711', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 2, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 2, N'1140711', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 3, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 3, N'1140711', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 4, N'1140711', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 4, N'1140711', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 5, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 5, N'1140711', 2, 2016, 1, 7.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 6, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 6, N'1140711', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 7, N'1140711', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 7, N'1140711', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 8, N'1140711', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 8, N'1140711', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 9, N'1140711', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110103', 9, N'1140711', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 1, N'1140711', 1, 2016, 2, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 1, N'1140711', 2, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 2, N'1140711', 1, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 2, N'1140711', 2, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 3, N'1140711', 1, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 3, N'1140711', 2, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 4, N'1140711', 1, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 4, N'1140711', 2, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 5, N'1140711', 1, 2016, 2, 5.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 5, N'1140711', 2, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 6, N'1140711', 1, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 6, N'1140711', 2, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 7, N'1140711', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 7, N'1140711', 2, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 8, N'1140711', 1, 2016, 2, 7.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 8, N'1140711', 2, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 9, N'1140711', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110201', 9, N'1140711', 2, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 1, N'1140711', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 1, N'1140711', 2, 2016, 2, 7.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 2, N'1140711', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 2, N'1140711', 2, 2016, 2, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 3, N'1140711', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 3, N'1140711', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 4, N'1140711', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 4, N'1140711', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 5, N'1140711', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 5, N'1140711', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 6, N'1140711', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 6, N'1140711', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 7, N'1140711', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 7, N'1140711', 2, 2016, 2, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 8, N'1140711', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 8, N'1140711', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 9, N'1140711', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110202', 9, N'1140711', 2, 2016, 2, 9.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 1, N'1140711', 1, 2016, 3, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 1, N'1140711', 2, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 2, N'1140711', 1, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 2, N'1140711', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 3, N'1140711', 1, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 3, N'1140711', 2, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 4, N'1140711', 1, 2016, 3, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 4, N'1140711', 2, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 5, N'1140711', 1, 2016, 3, 6.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 5, N'1140711', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 6, N'1140711', 1, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 6, N'1140711', 2, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 7, N'1140711', 1, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 7, N'1140711', 2, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 8, N'1140711', 1, 2016, 3, 6.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 8, N'1140711', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 9, N'1140711', 1, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407110301', 9, N'1140711', 2, 2016, 3, 7)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 1, N'1140712', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 1, N'1140712', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 2, N'1140712', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 2, N'1140712', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 3, N'1140712', 1, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 3, N'1140712', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 4, N'1140712', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 4, N'1140712', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 5, N'1140712', 1, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 5, N'1140712', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 6, N'1140712', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 6, N'1140712', 2, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 7, N'1140712', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 7, N'1140712', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 8, N'1140712', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 8, N'1140712', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 9, N'1140712', 1, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120101', 9, N'1140712', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 1, N'1140712', 1, 2016, 1, 8.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 1, N'1140712', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 2, N'1140712', 1, 2016, 1, 9.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 2, N'1140712', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 3, N'1140712', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 3, N'1140712', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 4, N'1140712', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 4, N'1140712', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 5, N'1140712', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 5, N'1140712', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 6, N'1140712', 1, 2016, 1, 9.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 6, N'1140712', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 7, N'1140712', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 7, N'1140712', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 8, N'1140712', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 8, N'1140712', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 9, N'1140712', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120102', 9, N'1140712', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 1, N'1140712', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 1, N'1140712', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 2, N'1140712', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 2, N'1140712', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 3, N'1140712', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 3, N'1140712', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 4, N'1140712', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 4, N'1140712', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 5, N'1140712', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 5, N'1140712', 2, 2016, 1, 9.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 6, N'1140712', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 6, N'1140712', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 7, N'1140712', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 7, N'1140712', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 8, N'1140712', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 8, N'1140712', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 9, N'1140712', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120103', 9, N'1140712', 2, 2016, 1, 7.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 1, N'1140712', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 1, N'1140712', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 2, N'1140712', 1, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 2, N'1140712', 2, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 3, N'1140712', 1, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 3, N'1140712', 2, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 4, N'1140712', 1, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 4, N'1140712', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 5, N'1140712', 1, 2016, 2, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 5, N'1140712', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 6, N'1140712', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 6, N'1140712', 2, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 7, N'1140712', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 7, N'1140712', 2, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 8, N'1140712', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 8, N'1140712', 2, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 9, N'1140712', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120201', 9, N'1140712', 2, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 1, N'1140712', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 1, N'1140712', 2, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 2, N'1140712', 1, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 2, N'1140712', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 3, N'1140712', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 3, N'1140712', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 4, N'1140712', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 4, N'1140712', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 5, N'1140712', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 5, N'1140712', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 6, N'1140712', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 6, N'1140712', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 7, N'1140712', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 7, N'1140712', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 8, N'1140712', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 8, N'1140712', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 9, N'1140712', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120202', 9, N'1140712', 2, 2016, 2, 7.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 1, N'1140712', 1, 2016, 3, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 1, N'1140712', 2, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 2, N'1140712', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 2, N'1140712', 2, 2016, 3, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 3, N'1140712', 1, 2016, 3, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 3, N'1140712', 2, 2016, 3, 6.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 4, N'1140712', 1, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 4, N'1140712', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 5, N'1140712', 1, 2016, 3, 6.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 5, N'1140712', 2, 2016, 3, 4.5)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 6, N'1140712', 1, 2016, 3, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 6, N'1140712', 2, 2016, 3, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 7, N'1140712', 1, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 7, N'1140712', 2, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 8, N'1140712', 1, 2016, 3, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 8, N'1140712', 2, 2016, 3, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 9, N'1140712', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407120301', 9, N'1140712', 2, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 1, N'1140713', 1, 2016, 1, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 1, N'1140713', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 2, N'1140713', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 2, N'1140713', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 3, N'1140713', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 3, N'1140713', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 4, N'1140713', 1, 2016, 1, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 4, N'1140713', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 5, N'1140713', 1, 2016, 1, 9.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 5, N'1140713', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 6, N'1140713', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 6, N'1140713', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 7, N'1140713', 1, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 7, N'1140713', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 8, N'1140713', 1, 2016, 1, 7.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 8, N'1140713', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 9, N'1140713', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130101', 9, N'1140713', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 1, N'1140713', 1, 2016, 1, 7.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 1, N'1140713', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 2, N'1140713', 1, 2016, 1, 7.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 2, N'1140713', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 3, N'1140713', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 3, N'1140713', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 4, N'1140713', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 4, N'1140713', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 5, N'1140713', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 5, N'1140713', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 6, N'1140713', 1, 2016, 1, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 6, N'1140713', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 7, N'1140713', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 7, N'1140713', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 8, N'1140713', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 8, N'1140713', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 9, N'1140713', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130102', 9, N'1140713', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 1, N'1140713', 1, 2016, 1, 8.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 1, N'1140713', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 2, N'1140713', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 2, N'1140713', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 3, N'1140713', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 3, N'1140713', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 4, N'1140713', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 4, N'1140713', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 5, N'1140713', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 5, N'1140713', 2, 2016, 1, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 6, N'1140713', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 6, N'1140713', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 7, N'1140713', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 7, N'1140713', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 8, N'1140713', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 8, N'1140713', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 9, N'1140713', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130103', 9, N'1140713', 2, 2016, 1, 8.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 1, N'1140713', 1, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 1, N'1140713', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 2, N'1140713', 1, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 2, N'1140713', 2, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 3, N'1140713', 1, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 3, N'1140713', 2, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 4, N'1140713', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 4, N'1140713', 2, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 5, N'1140713', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 5, N'1140713', 2, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 6, N'1140713', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 6, N'1140713', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 7, N'1140713', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 7, N'1140713', 2, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 8, N'1140713', 1, 2016, 2, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 8, N'1140713', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 9, N'1140713', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130201', 9, N'1140713', 2, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 1, N'1140713', 1, 2016, 2, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 1, N'1140713', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 2, N'1140713', 1, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 2, N'1140713', 2, 2016, 2, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 3, N'1140713', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 3, N'1140713', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 4, N'1140713', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 4, N'1140713', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 5, N'1140713', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 5, N'1140713', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 6, N'1140713', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 6, N'1140713', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 7, N'1140713', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 7, N'1140713', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 8, N'1140713', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 8, N'1140713', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 9, N'1140713', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130202', 9, N'1140713', 2, 2016, 2, 8.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 1, N'1140713', 1, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 1, N'1140713', 2, 2016, 3, 7.5)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 2, N'1140713', 1, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 2, N'1140713', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 3, N'1140713', 1, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 3, N'1140713', 2, 2016, 3, 9.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 4, N'1140713', 1, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 4, N'1140713', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 5, N'1140713', 1, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 5, N'1140713', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 6, N'1140713', 1, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 6, N'1140713', 2, 2016, 3, 5.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 7, N'1140713', 1, 2016, 3, 6.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 7, N'1140713', 2, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 8, N'1140713', 1, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 8, N'1140713', 2, 2016, 3, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 9, N'1140713', 1, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407130301', 9, N'1140713', 2, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 1, N'1140714', 1, 2016, 1, 6.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 1, N'1140714', 2, 2016, 1, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 2, N'1140714', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 2, N'1140714', 2, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 3, N'1140714', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 3, N'1140714', 2, 2016, 1, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 4, N'1140714', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 4, N'1140714', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 5, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 5, N'1140714', 2, 2016, 1, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 6, N'1140714', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 6, N'1140714', 2, 2016, 1, 9.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 7, N'1140714', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 7, N'1140714', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 8, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 8, N'1140714', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 9, N'1140714', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140101', 9, N'1140714', 2, 2016, 1, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 1, N'1140714', 1, 2016, 1, 9.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 1, N'1140714', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 2, N'1140714', 1, 2016, 1, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 2, N'1140714', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 3, N'1140714', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 3, N'1140714', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 4, N'1140714', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 4, N'1140714', 2, 2016, 1, 10)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 5, N'1140714', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 5, N'1140714', 2, 2016, 1, 10)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 6, N'1140714', 1, 2016, 1, 5.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 6, N'1140714', 2, 2016, 1, 10)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 7, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 7, N'1140714', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 8, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 8, N'1140714', 2, 2016, 1, 10)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 9, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140102', 9, N'1140714', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 1, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 1, N'1140714', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 2, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 2, N'1140714', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 3, N'1140714', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 3, N'1140714', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 4, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 4, N'1140714', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 5, N'1140714', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 5, N'1140714', 2, 2016, 1, 8.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 6, N'1140714', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 6, N'1140714', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 7, N'1140714', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 7, N'1140714', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 8, N'1140714', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 8, N'1140714', 2, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 9, N'1140714', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140103', 9, N'1140714', 2, 2016, 1, 6.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 1, N'1140714', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 1, N'1140714', 2, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 2, N'1140714', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 2, N'1140714', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 3, N'1140714', 1, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 3, N'1140714', 2, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 4, N'1140714', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 4, N'1140714', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 5, N'1140714', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 5, N'1140714', 2, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 6, N'1140714', 1, 2016, 2, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 6, N'1140714', 2, 2016, 2, 7.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 7, N'1140714', 1, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 7, N'1140714', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 8, N'1140714', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 8, N'1140714', 2, 2016, 2, 5.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 9, N'1140714', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140201', 9, N'1140714', 2, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 1, N'1140714', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 1, N'1140714', 2, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 2, N'1140714', 1, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 2, N'1140714', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 3, N'1140714', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 3, N'1140714', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 4, N'1140714', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 4, N'1140714', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 5, N'1140714', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 5, N'1140714', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 6, N'1140714', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 6, N'1140714', 2, 2016, 2, 6.6)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 7, N'1140714', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 7, N'1140714', 2, 2016, 2, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 8, N'1140714', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 8, N'1140714', 2, 2016, 2, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 9, N'1140714', 1, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140202', 9, N'1140714', 2, 2016, 2, 9.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 1, N'1140714', 1, 2016, 3, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 1, N'1140714', 2, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 2, N'1140714', 1, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 2, N'1140714', 2, 2016, 3, 9.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 3, N'1140714', 1, 2016, 3, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 3, N'1140714', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 4, N'1140714', 1, 2016, 3, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 4, N'1140714', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 5, N'1140714', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 5, N'1140714', 2, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 6, N'1140714', 1, 2016, 3, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 6, N'1140714', 2, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 7, N'1140714', 1, 2016, 3, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 7, N'1140714', 2, 2016, 3, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 8, N'1140714', 1, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 8, N'1140714', 2, 2016, 3, 7.9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 9, N'1140714', 1, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407140301', 9, N'1140714', 2, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 1, N'1140715', 1, 2016, 1, 5.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 1, N'1140715', 2, 2016, 1, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 2, N'1140715', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 2, N'1140715', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 3, N'1140715', 1, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 3, N'1140715', 2, 2016, 1, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 4, N'1140715', 1, 2016, 1, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 4, N'1140715', 2, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 5, N'1140715', 1, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 5, N'1140715', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 6, N'1140715', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 6, N'1140715', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 7, N'1140715', 1, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 7, N'1140715', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 8, N'1140715', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 8, N'1140715', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 9, N'1140715', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150101', 9, N'1140715', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 1, N'1140715', 1, 2016, 1, 4.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 1, N'1140715', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 2, N'1140715', 1, 2016, 1, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 2, N'1140715', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 3, N'1140715', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 3, N'1140715', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 4, N'1140715', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 4, N'1140715', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 5, N'1140715', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 5, N'1140715', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 6, N'1140715', 1, 2016, 1, 8.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 6, N'1140715', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 7, N'1140715', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 7, N'1140715', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 8, N'1140715', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 8, N'1140715', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 9, N'1140715', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150102', 9, N'1140715', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 1, N'1140715', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 1, N'1140715', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 2, N'1140715', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 2, N'1140715', 2, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 3, N'1140715', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 3, N'1140715', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 4, N'1140715', 1, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 4, N'1140715', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 5, N'1140715', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 5, N'1140715', 2, 2016, 1, 6.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 6, N'1140715', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 6, N'1140715', 2, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 7, N'1140715', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 7, N'1140715', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 8, N'1140715', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 8, N'1140715', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 9, N'1140715', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150103', 9, N'1140715', 2, 2016, 1, 4.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 1, N'1140715', 1, 2016, 2, 9.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 1, N'1140715', 2, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 2, N'1140715', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 2, N'1140715', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 3, N'1140715', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 3, N'1140715', 2, 2016, 2, 9.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 4, N'1140715', 1, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 4, N'1140715', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 5, N'1140715', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 5, N'1140715', 2, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 6, N'1140715', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 6, N'1140715', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 7, N'1140715', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 7, N'1140715', 2, 2016, 2, 5.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 8, N'1140715', 1, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 8, N'1140715', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 9, N'1140715', 1, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150201', 9, N'1140715', 2, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 1, N'1140715', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 1, N'1140715', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 2, N'1140715', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 2, N'1140715', 2, 2016, 2, 7.6)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 3, N'1140715', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 3, N'1140715', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 4, N'1140715', 1, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 4, N'1140715', 2, 2016, 2, 5.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 5, N'1140715', 1, 2016, 2, 4.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 5, N'1140715', 2, 2016, 2, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 6, N'1140715', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 6, N'1140715', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 7, N'1140715', 1, 2016, 2, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 7, N'1140715', 2, 2016, 2, 5.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 8, N'1140715', 1, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 8, N'1140715', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 9, N'1140715', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150202', 9, N'1140715', 2, 2016, 2, 5.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 1, N'1140715', 1, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 1, N'1140715', 2, 2016, 3, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 2, N'1140715', 1, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 2, N'1140715', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 3, N'1140715', 1, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 3, N'1140715', 2, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 4, N'1140715', 1, 2016, 3, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 4, N'1140715', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 5, N'1140715', 1, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 5, N'1140715', 2, 2016, 3, 9.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 6, N'1140715', 1, 2016, 3, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 6, N'1140715', 2, 2016, 3, 5.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 7, N'1140715', 1, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 7, N'1140715', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 8, N'1140715', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 8, N'1140715', 2, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 9, N'1140715', 1, 2016, 3, 6.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407150301', 9, N'1140715', 2, 2016, 3, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 1, N'1140716', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 1, N'1140716', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 2, N'1140716', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 2, N'1140716', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 3, N'1140716', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 3, N'1140716', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 4, N'1140716', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 4, N'1140716', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 5, N'1140716', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 5, N'1140716', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 6, N'1140716', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 6, N'1140716', 2, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 7, N'1140716', 1, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 7, N'1140716', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 8, N'1140716', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 8, N'1140716', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 9, N'1140716', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160101', 9, N'1140716', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 1, N'1140716', 1, 2016, 1, 5.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 1, N'1140716', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 2, N'1140716', 1, 2016, 1, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 2, N'1140716', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 3, N'1140716', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 3, N'1140716', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 4, N'1140716', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 4, N'1140716', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 5, N'1140716', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 5, N'1140716', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 6, N'1140716', 1, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 6, N'1140716', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 7, N'1140716', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 7, N'1140716', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 8, N'1140716', 1, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 8, N'1140716', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 9, N'1140716', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160102', 9, N'1140716', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 1, N'1140716', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 1, N'1140716', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 2, N'1140716', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 2, N'1140716', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 3, N'1140716', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 3, N'1140716', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 4, N'1140716', 1, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 4, N'1140716', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 5, N'1140716', 1, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 5, N'1140716', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 6, N'1140716', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 6, N'1140716', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 7, N'1140716', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 7, N'1140716', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 8, N'1140716', 1, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 8, N'1140716', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 9, N'1140716', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160103', 9, N'1140716', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 1, N'1140716', 1, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 1, N'1140716', 2, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 2, N'1140716', 1, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 2, N'1140716', 2, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 3, N'1140716', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 3, N'1140716', 2, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 4, N'1140716', 1, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 4, N'1140716', 2, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 5, N'1140716', 1, 2016, 2, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 5, N'1140716', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 6, N'1140716', 1, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 6, N'1140716', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 7, N'1140716', 1, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 7, N'1140716', 2, 2016, 2, 9)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 8, N'1140716', 1, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 8, N'1140716', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 9, N'1140716', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160201', 9, N'1140716', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 1, N'1140716', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 1, N'1140716', 2, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 2, N'1140716', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 2, N'1140716', 2, 2016, 2, 6.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 3, N'1140716', 1, 2016, 2, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 3, N'1140716', 2, 2016, 2, 3.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 4, N'1140716', 1, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 4, N'1140716', 2, 2016, 2, 5.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 5, N'1140716', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 5, N'1140716', 2, 2016, 2, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 6, N'1140716', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 6, N'1140716', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 7, N'1140716', 1, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 7, N'1140716', 2, 2016, 2, 5.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 8, N'1140716', 1, 2016, 2, 3.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 8, N'1140716', 2, 2016, 2, 3.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 9, N'1140716', 1, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160202', 9, N'1140716', 2, 2016, 2, 8.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 1, N'1140716', 1, 2016, 3, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 1, N'1140716', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 2, N'1140716', 1, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 2, N'1140716', 2, 2016, 3, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 3, N'1140716', 1, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 3, N'1140716', 2, 2016, 3, 5.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 4, N'1140716', 1, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 4, N'1140716', 2, 2016, 3, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 5, N'1140716', 1, 2016, 3, 7.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 5, N'1140716', 2, 2016, 3, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 6, N'1140716', 1, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 6, N'1140716', 2, 2016, 3, 6.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 7, N'1140716', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 7, N'1140716', 2, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 8, N'1140716', 1, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 8, N'1140716', 2, 2016, 3, 4.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 9, N'1140716', 1, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407160301', 9, N'1140716', 2, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 1, N'1140717', 1, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 1, N'1140717', 2, 2016, 1, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 2, N'1140717', 1, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 2, N'1140717', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 3, N'1140717', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 3, N'1140717', 2, 2016, 1, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 4, N'1140717', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 4, N'1140717', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 5, N'1140717', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 5, N'1140717', 2, 2016, 1, 6.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 6, N'1140717', 1, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 6, N'1140717', 2, 2016, 1, 5.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 7, N'1140717', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 7, N'1140717', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 8, N'1140717', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 8, N'1140717', 2, 2016, 1, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 9, N'1140717', 1, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170101', 9, N'1140717', 2, 2016, 1, 8.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 1, N'1140717', 1, 2016, 1, 6.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 1, N'1140717', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 2, N'1140717', 1, 2016, 1, 3.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 2, N'1140717', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 3, N'1140717', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 3, N'1140717', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 4, N'1140717', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 4, N'1140717', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 5, N'1140717', 1, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 5, N'1140717', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 6, N'1140717', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 6, N'1140717', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 7, N'1140717', 1, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 7, N'1140717', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 8, N'1140717', 1, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 8, N'1140717', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 9, N'1140717', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170102', 9, N'1140717', 2, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 1, N'1140717', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 1, N'1140717', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 2, N'1140717', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 2, N'1140717', 2, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 3, N'1140717', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 3, N'1140717', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 4, N'1140717', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 4, N'1140717', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 5, N'1140717', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 5, N'1140717', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 6, N'1140717', 1, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 6, N'1140717', 2, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 7, N'1140717', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 7, N'1140717', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 8, N'1140717', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 8, N'1140717', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 9, N'1140717', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170103', 9, N'1140717', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 1, N'1140717', 1, 2016, 2, 5.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 1, N'1140717', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 2, N'1140717', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 2, N'1140717', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 3, N'1140717', 1, 2016, 2, 9.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 3, N'1140717', 2, 2016, 2, 8.2)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 4, N'1140717', 1, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 4, N'1140717', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 5, N'1140717', 1, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 5, N'1140717', 2, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 6, N'1140717', 1, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 6, N'1140717', 2, 2016, 2, 8.1)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 7, N'1140717', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 7, N'1140717', 2, 2016, 2, 9.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 8, N'1140717', 1, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 8, N'1140717', 2, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 9, N'1140717', 1, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170201', 9, N'1140717', 2, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 1, N'1140717', 1, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 1, N'1140717', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 2, N'1140717', 1, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 2, N'1140717', 2, 2016, 2, 7.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 3, N'1140717', 1, 2016, 2, 4.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 3, N'1140717', 2, 2016, 2, 6.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 4, N'1140717', 1, 2016, 2, 4.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 4, N'1140717', 2, 2016, 2, 4.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 5, N'1140717', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 5, N'1140717', 2, 2016, 2, 6.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 6, N'1140717', 1, 2016, 2, 4.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 6, N'1140717', 2, 2016, 2, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 7, N'1140717', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 7, N'1140717', 2, 2016, 2, 4.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 8, N'1140717', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 8, N'1140717', 2, 2016, 2, 4.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 9, N'1140717', 1, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170202', 9, N'1140717', 2, 2016, 2, 6.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 1, N'1140717', 1, 2016, 3, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 1, N'1140717', 2, 2016, 3, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 2, N'1140717', 1, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 2, N'1140717', 2, 2016, 3, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 3, N'1140717', 1, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 3, N'1140717', 2, 2016, 3, 6.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 4, N'1140717', 1, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 4, N'1140717', 2, 2016, 3, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 5, N'1140717', 1, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 5, N'1140717', 2, 2016, 3, 5.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 6, N'1140717', 1, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 6, N'1140717', 2, 2016, 3, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 7, N'1140717', 1, 2016, 3, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 7, N'1140717', 2, 2016, 3, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 8, N'1140717', 1, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 8, N'1140717', 2, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 9, N'1140717', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407170301', 9, N'1140717', 2, 2016, 3, 9.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 1, N'1140718', 1, 2016, 1, 4.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 1, N'1140718', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 2, N'1140718', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 2, N'1140718', 2, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 3, N'1140718', 1, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 3, N'1140718', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 4, N'1140718', 1, 2016, 1, 3.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 4, N'1140718', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 5, N'1140718', 1, 2016, 1, 9.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 5, N'1140718', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 6, N'1140718', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 6, N'1140718', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 7, N'1140718', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 7, N'1140718', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 8, N'1140718', 1, 2016, 1, 8.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 8, N'1140718', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 9, N'1140718', 1, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180101', 9, N'1140718', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 1, N'1140718', 1, 2016, 1, 3.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 1, N'1140718', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 2, N'1140718', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 2, N'1140718', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 3, N'1140718', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 3, N'1140718', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 4, N'1140718', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 4, N'1140718', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 5, N'1140718', 1, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 5, N'1140718', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 6, N'1140718', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 6, N'1140718', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 7, N'1140718', 1, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 7, N'1140718', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 8, N'1140718', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 8, N'1140718', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 9, N'1140718', 1, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180102', 9, N'1140718', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 1, N'1140718', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 1, N'1140718', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 2, N'1140718', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 2, N'1140718', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 3, N'1140718', 1, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 3, N'1140718', 2, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 4, N'1140718', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 4, N'1140718', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 5, N'1140718', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 5, N'1140718', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 6, N'1140718', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 6, N'1140718', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 7, N'1140718', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 7, N'1140718', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 8, N'1140718', 1, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 8, N'1140718', 2, 2016, 1, 4.5)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 9, N'1140718', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180103', 9, N'1140718', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 1, N'1140718', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 1, N'1140718', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 2, N'1140718', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 2, N'1140718', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 3, N'1140718', 1, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 3, N'1140718', 2, 2016, 2, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 4, N'1140718', 1, 2016, 2, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 4, N'1140718', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 5, N'1140718', 1, 2016, 2, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 5, N'1140718', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 6, N'1140718', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 6, N'1140718', 2, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 7, N'1140718', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 7, N'1140718', 2, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 8, N'1140718', 1, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 8, N'1140718', 2, 2016, 2, 3.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 9, N'1140718', 1, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180201', 9, N'1140718', 2, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 1, N'1140718', 1, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 1, N'1140718', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 2, N'1140718', 1, 2016, 2, 4.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 2, N'1140718', 2, 2016, 2, 5.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 3, N'1140718', 1, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 3, N'1140718', 2, 2016, 2, 3.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 4, N'1140718', 1, 2016, 2, 7.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 4, N'1140718', 2, 2016, 2, 5.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 5, N'1140718', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 5, N'1140718', 2, 2016, 2, 4.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 6, N'1140718', 1, 2016, 2, 5.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 6, N'1140718', 2, 2016, 2, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 7, N'1140718', 1, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 7, N'1140718', 2, 2016, 2, 3.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 8, N'1140718', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 8, N'1140718', 2, 2016, 2, 3.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 9, N'1140718', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180202', 9, N'1140718', 2, 2016, 2, 3.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 1, N'1140718', 1, 2016, 3, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 1, N'1140718', 2, 2016, 3, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 2, N'1140718', 1, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 2, N'1140718', 2, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 3, N'1140718', 1, 2016, 3, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 3, N'1140718', 2, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 4, N'1140718', 1, 2016, 3, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 4, N'1140718', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 5, N'1140718', 1, 2016, 3, 7.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 5, N'1140718', 2, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 6, N'1140718', 1, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 6, N'1140718', 2, 2016, 3, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 7, N'1140718', 1, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 7, N'1140718', 2, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 8, N'1140718', 1, 2016, 3, 6.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 8, N'1140718', 2, 2016, 3, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 9, N'1140718', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407180301', 9, N'1140718', 2, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 1, N'1140719', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 1, N'1140719', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 2, N'1140719', 1, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 2, N'1140719', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 3, N'1140719', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 3, N'1140719', 2, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 4, N'1140719', 1, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 4, N'1140719', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 5, N'1140719', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 5, N'1140719', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 6, N'1140719', 1, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 6, N'1140719', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 7, N'1140719', 1, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 7, N'1140719', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 8, N'1140719', 1, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 8, N'1140719', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 9, N'1140719', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190101', 9, N'1140719', 2, 2016, 1, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 1, N'1140719', 1, 2016, 1, 4.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 1, N'1140719', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 2, N'1140719', 1, 2016, 1, 8.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 2, N'1140719', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 3, N'1140719', 1, 2016, 1, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 3, N'1140719', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 4, N'1140719', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 4, N'1140719', 2, 2016, 1, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 5, N'1140719', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 5, N'1140719', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 6, N'1140719', 1, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 6, N'1140719', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 7, N'1140719', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 7, N'1140719', 2, 2016, 1, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 8, N'1140719', 1, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 8, N'1140719', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 9, N'1140719', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190102', 9, N'1140719', 2, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 1, N'1140719', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 1, N'1140719', 2, 2016, 1, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 2, N'1140719', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 2, N'1140719', 2, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 3, N'1140719', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 3, N'1140719', 2, 2016, 1, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 4, N'1140719', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 4, N'1140719', 2, 2016, 1, 6.5)
GO
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 5, N'1140719', 1, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 5, N'1140719', 2, 2016, 1, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 6, N'1140719', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 6, N'1140719', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 7, N'1140719', 1, 2016, 1, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 7, N'1140719', 2, 2016, 1, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 8, N'1140719', 1, 2016, 1, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 8, N'1140719', 2, 2016, 1, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 9, N'1140719', 1, 2016, 1, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190103', 9, N'1140719', 2, 2016, 1, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 1, N'1140719', 1, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 1, N'1140719', 2, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 2, N'1140719', 1, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 2, N'1140719', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 3, N'1140719', 1, 2016, 2, 5.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 3, N'1140719', 2, 2016, 2, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 4, N'1140719', 1, 2016, 2, 8.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 4, N'1140719', 2, 2016, 2, 4.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 5, N'1140719', 1, 2016, 2, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 5, N'1140719', 2, 2016, 2, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 6, N'1140719', 1, 2016, 2, 6.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 6, N'1140719', 2, 2016, 2, 5.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 7, N'1140719', 1, 2016, 2, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 7, N'1140719', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 8, N'1140719', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 8, N'1140719', 2, 2016, 2, 6.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 9, N'1140719', 1, 2016, 2, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190201', 9, N'1140719', 2, 2016, 2, 7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 1, N'1140719', 1, 2016, 2, 3.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 1, N'1140719', 2, 2016, 2, 6.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 2, N'1140719', 1, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 2, N'1140719', 2, 2016, 2, 5.2)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 3, N'1140719', 1, 2016, 2, 6.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 3, N'1140719', 2, 2016, 2, 3.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 4, N'1140719', 1, 2016, 2, 3.8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 4, N'1140719', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 5, N'1140719', 1, 2016, 2, 3.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 5, N'1140719', 2, 2016, 2, 3.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 6, N'1140719', 1, 2016, 2, 6.4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 6, N'1140719', 2, 2016, 2, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 7, N'1140719', 1, 2016, 2, 8)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 7, N'1140719', 2, 2016, 2, 7.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 8, N'1140719', 1, 2016, 2, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 8, N'1140719', 2, 2016, 2, 4.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 9, N'1140719', 1, 2016, 2, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190202', 9, N'1140719', 2, 2016, 2, 4.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 1, N'1140719', 1, 2016, 3, 6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 1, N'1140719', 2, 2016, 3, 4)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 2, N'1140719', 1, 2016, 3, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 2, N'1140719', 2, 2016, 3, 3.7)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 3, N'1140719', 1, 2016, 3, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 3, N'1140719', 2, 2016, 3, 5.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 4, N'1140719', 1, 2016, 3, 6.6)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 4, N'1140719', 2, 2016, 3, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 5, N'1140719', 1, 2016, 3, 9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 5, N'1140719', 2, 2016, 3, 5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 6, N'1140719', 1, 2016, 3, 5.3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 6, N'1140719', 2, 2016, 3, 8.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 7, N'1140719', 1, 2016, 3, 3.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 7, N'1140719', 2, 2016, 3, 9.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 8, N'1140719', 1, 2016, 3, 3)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 8, N'1140719', 2, 2016, 3, 9.9)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 9, N'1140719', 1, 2016, 3, 7.5)
INSERT [dbo].[Score] ([ScoreId], [SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (N'11407190301', 9, N'1140719', 2, 2016, 3, 6)
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (1, CAST(0x0700D85EAC3A0000 AS Time), CAST(0x070026B2F5400000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (2, CAST(0x07008482A8410000 AS Time), CAST(0x0700D2D5F1470000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (3, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700F63AB9510000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (4, CAST(0x0700540B6C520000 AS Time), CAST(0x0700A25EB5580000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (5, CAST(0x0700002F68590000 AS Time), CAST(0x07004E82B15F0000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (6, CAST(0x07002E88DE6A0000 AS Time), CAST(0x07007CDB27710000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (7, CAST(0x0700DAABDA710000 AS Time), CAST(0x070028FF23780000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (8, CAST(0x0700FE10A27B0000 AS Time), CAST(0x07004C64EB810000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (9, CAST(0x0700AA349E820000 AS Time), CAST(0x0700F887E7880000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (10, CAST(0x070056589A890000 AS Time), CAST(0x0700A4ABE38F0000 AS Time))
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140710', 1, N'100000000')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140711', 0, N'100000001')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140712', 0, N'100000002')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140713', 0, N'100000003')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140714', 0, N'100000004')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140715', 0, N'100000005')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140716', 0, N'100000006')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140717', 0, N'100000007')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140718', 0, N'100000008')
INSERT [dbo].[Student] ([StudentId], [IsGraduated], [PersonalInfoId]) VALUES (N'1140719', 0, N'100000009')
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (8, N'Đạo đức')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (6, N'Địa lý')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (3, N'Hóa học')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (4, N'Sinh học')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (5, N'Sử')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (9, N'Thể dục')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (1, N'Toán')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (7, N'Văn')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (2, N'Vật lý')
SET IDENTITY_INSERT [dbo].[Subject] OFF
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000000', 1, N'0000000000', N'000000000')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000001', 1, N'4000000001', N'000000002')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000002', 2, N'4000000001', N'000000003')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000003', 3, N'4000000001', N'000000004')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000004', 4, N'4000000001', N'000000005')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000005', 5, N'4000000001', N'000000006')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000006', 6, N'4000000001', N'000000007')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000007', 7, N'4000000001', N'000000008')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000008', 8, N'4000000001', N'000000009')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000009', 9, N'4000000001', N'000000010')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000010', 7, N'2000000003', N'000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000011', 4, N'2000000002', N'000000011')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000012', 6, N'2000000001', N'000000012')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId], [PersonalInfoId]) VALUES (N'000000013', 3, N'1000000001', N'000000013')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Room__6B500B5560EE0448]    Script Date: 7/25/2020 10:22:31 PM ******/
ALTER TABLE [dbo].[Room] ADD UNIQUE NONCLUSTERED 
(
	[RoomName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SubjectName]    Script Date: 7/25/2020 10:22:31 PM ******/
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [UK_SubjectName] UNIQUE NONCLUSTERED 
(
	[SubjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassNotification] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[ClassNotification] ADD  DEFAULT ('') FOR [Content]
GO
ALTER TABLE [dbo].[PersonalInfo] ADD  DEFAULT ((0)) FOR [IsMale]
GO
ALTER TABLE [dbo].[Score] ADD  DEFAULT ((-1)) FOR [ScoreValue]
GO
ALTER TABLE [dbo].[Student] ADD  DEFAULT ((0)) FOR [IsGraduated]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_MaGiaoVien] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_MaGiaoVien]
GO
ALTER TABLE [dbo].[ClassNotification]  WITH CHECK ADD  CONSTRAINT [FK_ClassNotification_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassNotification] CHECK CONSTRAINT [FK_ClassNotification_Class]
GO
ALTER TABLE [dbo].[EnrolledClass]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledClass_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnrolledClass] CHECK CONSTRAINT [FK_EnrolledClass_Class]
GO
ALTER TABLE [dbo].[EnrolledClass]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledClass_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnrolledClass] CHECK CONSTRAINT [FK_EnrolledClass_Student]
GO
ALTER TABLE [dbo].[HomeRoom]  WITH CHECK ADD  CONSTRAINT [FK_HomeRoom_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HomeRoom] CHECK CONSTRAINT [FK_HomeRoom_Class]
GO
ALTER TABLE [dbo].[HomeRoom]  WITH CHECK ADD  CONSTRAINT [FK_HomeRoom_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HomeRoom] CHECK CONSTRAINT [FK_HomeRoom_Teacher]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_SubjectSchedule_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_SubjectSchedule_Class]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_SubjectSchedule_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_SubjectSchedule_Room]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_SubjectSchedule_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_SubjectSchedule_Session]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_SubjectSchedule_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_SubjectSchedule_Subject]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Student]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Subject]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_PersonalInfo] FOREIGN KEY([PersonalInfoId])
REFERENCES [dbo].[PersonalInfo] ([PersonalInfoId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_PersonalInfo]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_PersonalInfo] FOREIGN KEY([PersonalInfoId])
REFERENCES [dbo].[PersonalInfo] ([PersonalInfoId])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_PersonalInfo]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_SchoolRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[SchoolRole] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_SchoolRole]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Subject]
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD  CONSTRAINT [CK_PersonalInfo_Email] CHECK  ((charindex('@gmail.com',[Email])>(0)))
GO
ALTER TABLE [dbo].[PersonalInfo] CHECK CONSTRAINT [CK_PersonalInfo_Email]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [CK_Score_Diem] CHECK  (([ScoreValue]>=(-1) AND [ScoreValue]<=(10)))
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [CK_Score_Diem]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [CK_Score_HocKi] CHECK  (([Semester]>=(1) AND [Semester]<=(2)))
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [CK_Score_HocKi]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [CK_Score_MaDiem] CHECK  ((isnumeric([ScoreId])=(1)))
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [CK_Score_MaDiem]
GO
USE [master]
GO
ALTER DATABASE [StudentManager.Database] SET  READ_WRITE 
GO
