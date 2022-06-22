USE [master]
GO
/****** Object:  Database [ASS]    Script Date: 6/22/2022 8:03:31 PM ******/
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 6/22/2022 8:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[aid] [int] NOT NULL,
	[note] [nvarchar](150) NULL,
	[status] [varchar](150) NOT NULL,
	[seid] [int] NOT NULL,
	[sid] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 6/22/2022 8:03:31 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 6/22/2022 8:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[cid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Student]    Script Date: 6/22/2022 8:03:31 PM ******/
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
/****** Object:  Table [dbo].[Lecturer]    Script Date: 6/22/2022 8:03:31 PM ******/
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
/****** Object:  Table [dbo].[Login_Lecturers]    Script Date: 6/22/2022 8:03:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Lecturers](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/22/2022 8:03:31 PM ******/
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
/****** Object:  Table [dbo].[Transcript]    Script Date: 6/22/2022 8:03:31 PM ******/
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
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([cid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
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
