USE [master]
GO
/****** Object:  Database [ASS]    Script Date: 7/18/2022 11:09:46 PM ******/
CREATE DATABASE [ASS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ASS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ASS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ASS] SET  MULTI_USER 
GO
ALTER DATABASE [ASS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ASS] SET QUERY_STORE = OFF
GO
USE [ASS]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
	[sid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[eid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[aid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[score] [float] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Course]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Course](
	[gid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Group_Course] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Student]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Student](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Group_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [varchar](150) NOT NULL,
	[lphone] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer_Course]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer_Course](
	[lid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Lecturer_Course] PRIMARY KEY CLUSTERED 
(
	[lid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer_Group]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer_Group](
	[lid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Lecturer_Group] PRIMARY KEY CLUSTERED 
(
	[lid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[simg] [varchar](1500) NOT NULL,
	[scode] [varchar](150) NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
	[address] [varchar](150) NOT NULL,
	[sphone] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Course]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Course](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Student_Course] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transcript]    Script Date: 7/18/2022 11:09:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transcript](
	[tid] [int] NOT NULL,
	[as1] [float] NULL,
	[as2] [float] NULL,
	[pt1] [float] NULL,
	[pt2] [float] NULL,
	[pt3] [float] NULL,
	[pe] [float] NULL,
	[fe] [float] NULL,
	[cid] [int] NOT NULL,
	[sid] [int] NOT NULL,
 CONSTRAINT [PK_Transcript] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname], [sid]) VALUES (N'duc', N'123', N'Tran Trung Duc', 1)
INSERT [dbo].[Account] ([username], [password], [displayname], [sid]) VALUES (N'linh', N'123', N'Nguyen Thi Thu Linh', 2)
INSERT [dbo].[Account] ([username], [password], [displayname], [sid]) VALUES (N'giang', N'123', N'Thanh Huu Ngan Giang', 3)
GO
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (1, N'Assigment 1', 15, 1)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (2, N'Assigment 2', 15, 1)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (3, N'Progress Test 1', 10, 1)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (4, N'Progress Test 2', 10, 1)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (5, N'Progress Test 3', 10, 1)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (6, N'Practical Exam', 20, 1)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (7, N'Final Exam', 20, 1)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (8, N'Assigment 1', 15, 2)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (9, N'Assigment 2', 15, 2)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (10, N'Progress Test 1', 10, 2)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (11, N'Progress Test 2', 10, 2)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (12, N'Progress Test 3', 10, 2)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (13, N'Practical Exam', 20, 2)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (14, N'Final Exam', 20, 2)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (15, N'Assigment 1', 15, 3)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (16, N'Assigment 2', 15, 3)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (17, N'Progress Test 1', 10, 3)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (18, N'Progress Test 2', 10, 3)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (19, N'Progress Test 3', 10, 3)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (20, N'Practical Exam', 20, 3)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (21, N'Final Exam', 20, 3)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (22, N'Assigment 1', 15, 4)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (23, N'Assigment 2', 15, 4)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (24, N'Progress Test', 10, 4)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (25, N'Progress Test 2', 10, 4)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (26, N'Progress Test 3', 10, 4)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (27, N'Practical Exam', 20, 4)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (28, N'Final Exam', 20, 4)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (29, N'Assigment 1', 15, 5)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (30, N'Assigment 2', 15, 5)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (31, N'Progress Test 1', 10, 5)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (32, N'Progress Test 2', 10, 5)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (33, N'Progress Test 3', 10, 5)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (34, N'Practical Exam', 20, 5)
INSERT [dbo].[Assessment] ([aid], [aname], [weight], [cid]) VALUES (35, N'Final Exam', 20, 5)
GO
INSERT [dbo].[Course] ([cid], [cname]) VALUES (1, N'PRJ201')
INSERT [dbo].[Course] ([cid], [cname]) VALUES (2, N'MAD219')
INSERT [dbo].[Course] ([cid], [cname]) VALUES (3, N'SWR302')
INSERT [dbo].[Course] ([cid], [cname]) VALUES (4, N'SWT301')
INSERT [dbo].[Course] ([cid], [cname]) VALUES (5, N'PRN292')
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (1, 1, 1, 1, 8, CAST(N'2022-06-05' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (3, 1, 2, 1, 7, CAST(N'2022-06-06' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (4, 1, 3, 1, 6, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (5, 1, 4, 1, 5, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (6, 1, 5, 1, 4, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (7, 1, 6, 1, 3, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (8, 1, 7, 1, 2, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (9, 1, 22, 4, 9, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (10, 1, 23, 4, 9, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (11, 1, 24, 4, 9, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (12, 1, 25, 4, 9, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (13, 1, 26, 4, 9, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (14, 1, 27, 4, 9, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (15, 1, 28, 4, 9, CAST(N'2022-06-07' AS Date))
INSERT [dbo].[Exam] ([eid], [sid], [aid], [cid], [score], [date]) VALUES (17, 6, 29, 5, 9, CAST(N'2022-07-18' AS Date))
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'SE1600')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'SE1601')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (3, N'SE1602')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (4, N'SE1603')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (5, N'SE1604')
GO
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (1, 1)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (1, 2)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (2, 3)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (2, 5)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (3, 1)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (3, 2)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (3, 5)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (4, 3)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (4, 4)
INSERT [dbo].[Group_Course] ([gid], [cid]) VALUES (5, 4)
GO
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (1, 5)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (2, 1)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (2, 2)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (3, 2)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (4, 1)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (5, 2)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (6, 3)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (7, 4)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (8, 5)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (9, 5)
INSERT [dbo].[Group_Student] ([sid], [gid]) VALUES (10, 3)
GO
INSERT [dbo].[Lecturer] ([lid], [lname], [gender], [address], [lphone]) VALUES (1, N'Ngo Tung A', 0, N'Ha Noi', N'0961568978')
INSERT [dbo].[Lecturer] ([lid], [lname], [gender], [address], [lphone]) VALUES (2, N'Nguyen Thi B', 1, N'Ha Noi', N'0189785465')
INSERT [dbo].[Lecturer] ([lid], [lname], [gender], [address], [lphone]) VALUES (3, N'Tran Thu C', 1, N'Ha Noi', N'0912784596')
INSERT [dbo].[Lecturer] ([lid], [lname], [gender], [address], [lphone]) VALUES (4, N'Nguyen Trung D', 0, N'Sai Gon', N'0963784215')
INSERT [dbo].[Lecturer] ([lid], [lname], [gender], [address], [lphone]) VALUES (5, N'Le Minh E', 1, N'Sai Gon', N'0122549568')
GO
INSERT [dbo].[Lecturer_Course] ([lid], [cid]) VALUES (1, 1)
INSERT [dbo].[Lecturer_Course] ([lid], [cid]) VALUES (2, 2)
INSERT [dbo].[Lecturer_Course] ([lid], [cid]) VALUES (3, 4)
INSERT [dbo].[Lecturer_Course] ([lid], [cid]) VALUES (4, 5)
INSERT [dbo].[Lecturer_Course] ([lid], [cid]) VALUES (5, 4)
INSERT [dbo].[Lecturer_Course] ([lid], [cid]) VALUES (5, 5)
GO
INSERT [dbo].[Lecturer_Group] ([lid], [gid]) VALUES (1, 1)
INSERT [dbo].[Lecturer_Group] ([lid], [gid]) VALUES (1, 3)
INSERT [dbo].[Lecturer_Group] ([lid], [gid]) VALUES (2, 1)
INSERT [dbo].[Lecturer_Group] ([lid], [gid]) VALUES (3, 5)
INSERT [dbo].[Lecturer_Group] ([lid], [gid]) VALUES (4, 2)
INSERT [dbo].[Lecturer_Group] ([lid], [gid]) VALUES (5, 3)
INSERT [dbo].[Lecturer_Group] ([lid], [gid]) VALUES (5, 4)
GO
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (1, N'assets/img/anhnam.jpg', N'HE150001', N'Tran Trung A', 1, CAST(N'2000-12-16' AS Date), N'Ha Noi', N'0961563798')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (2, N'assets/img/anhnu.jpg', N'HE150002', N'Nguyen Linh B', 0, CAST(N'2001-03-05' AS Date), N'Sai Gon', N'0135875695')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (3, N'assets/img/anhnu.jpg', N'HE150003', N'Nguyen Thu C', 0, CAST(N'2001-12-12' AS Date), N'Ha Noi', N'0964865741')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (4, N'assets/img/anhnam.jpg', N'HE150004', N'NGuyen Trung D', 1, CAST(N'1999-01-01' AS Date), N'Hai Phong', N'0741852963')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (5, N'assets/img/anhnam.jpg', N'HE150005', N'Ta Dinh E', 1, CAST(N'2000-10-11' AS Date), N'Sai Gon', N'0852456987')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (6, N'assets/img/anhnu.jpg', N'HE150006', N'Ngo Thu F', 0, CAST(N'2001-03-10' AS Date), N'Ha Noi', N'0196458798')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (7, N'assets/img/anhnam.jpg', N'HE150007', N'Dinh Quang G', 1, CAST(N'2001-05-30' AS Date), N'Ha Noi', N'0321456987')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (8, N'assets/img/anhnam.jpg', N'HE150008', N'Tran Dinh H', 1, CAST(N'1999-12-12' AS Date), N'Hai Phong', N'0159357852')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (9, N'assets/img/anhnu.jpg', N'HE150009', N'La Thi Thu I', 0, CAST(N'2001-04-06' AS Date), N'Hai Phong', N'0159875462')
INSERT [dbo].[Student] ([sid], [simg], [scode], [sname], [gender], [dob], [address], [sphone]) VALUES (10, N'assets/img/anhnam.jpg', N'HE150010', N'Dinh Van K', 1, CAST(N'1998-02-28' AS Date), N'Ha Noi', N'0426486521')
GO
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (1, 4)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (2, 5)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (3, 3)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (4, 2)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (5, 5)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (6, 1)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (7, 4)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (8, 4)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (9, 4)
INSERT [dbo].[Student_Course] ([sid], [cid]) VALUES (10, 5)
GO
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (2, 1, 2, 3, 4, 5, 6, 7, 1, 2)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (3, 7, 6, 5, 4, 3, 2, 1, 5, 2)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 3)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 5)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 7)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 9)
INSERT [dbo].[Transcript] ([tid], [as1], [as2], [pt1], [pt2], [pt3], [pe], [fe], [cid], [sid]) VALUES (11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 10)
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Student]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([cid])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Course]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Assessment] FOREIGN KEY([aid])
REFERENCES [dbo].[Assessment] ([aid])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Assessment]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([cid])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Group_Course]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([cid])
GO
ALTER TABLE [dbo].[Group_Course] CHECK CONSTRAINT [FK_Group_Course_Course]
GO
ALTER TABLE [dbo].[Group_Course]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group_Course] CHECK CONSTRAINT [FK_Group_Course_Group]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Group]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Student]
GO
ALTER TABLE [dbo].[Lecturer_Course]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Course_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([cid])
GO
ALTER TABLE [dbo].[Lecturer_Course] CHECK CONSTRAINT [FK_Lecturer_Course_Course]
GO
ALTER TABLE [dbo].[Lecturer_Course]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Course_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Lecturer_Course] CHECK CONSTRAINT [FK_Lecturer_Course_Lecturer]
GO
ALTER TABLE [dbo].[Lecturer_Group]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Lecturer_Group] CHECK CONSTRAINT [FK_Lecturer_Group_Group]
GO
ALTER TABLE [dbo].[Lecturer_Group]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Lecturer_Group] CHECK CONSTRAINT [FK_Lecturer_Group_Lecturer]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([cid])
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Course]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Student]
GO
ALTER TABLE [dbo].[Transcript]  WITH CHECK ADD  CONSTRAINT [FK_Transcript_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([cid])
GO
ALTER TABLE [dbo].[Transcript] CHECK CONSTRAINT [FK_Transcript_Course]
GO
ALTER TABLE [dbo].[Transcript]  WITH CHECK ADD  CONSTRAINT [FK_Transcript_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Transcript] CHECK CONSTRAINT [FK_Transcript_Student]
GO
USE [master]
GO
ALTER DATABASE [ASS] SET  READ_WRITE 
GO
