USE [master]
GO
/****** Object:  Database [University_MS_DB]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE DATABASE [University_MS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\University_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'University_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\University_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [University_MS_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University_MS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University_MS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University_MS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University_MS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University_MS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University_MS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [University_MS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University_MS_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [University_MS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University_MS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University_MS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University_MS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University_MS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University_MS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University_MS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University_MS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University_MS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University_MS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University_MS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University_MS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University_MS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University_MS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University_MS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University_MS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University_MS_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University_MS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [University_MS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University_MS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University_MS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University_MS_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [University_MS_DB]
GO
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_AdminLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AllocateClassRoom]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NULL,
	[CourseId] [int] NULL,
	[RoomNo] [varchar](50) NULL,
	[DayN] [varchar](50) NULL,
	[StrartFrom] [time](0) NULL,
	[EndTo] [time](0) NULL,
 CONSTRAINT [PK_AllocateClassRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Semester] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssign]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_CourseAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](7) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RegNo] [varchar](100) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
	[Grade] [varchar](50) NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[ContactNo] [int] NOT NULL,
	[Designation] [varchar](200) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToBeTaken] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[RoomDayTimeConcaeView]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RoomDayTimeConcaeView]
AS
SELECT CourseId, RoomNo + ', ' + DayN + ', ' + CAST(StrartFrom AS varchar) + ' - ' + CAST(EndTo AS varchar) AS CourseShedule
FROM     AllocateClassRoom
GO
/****** Object:  View [dbo].[ClassSchedule]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ClassSchedule]
AS

select a.CourseId,STUFF((select ';'+ t.CourseShedule+''
from RoomDayTimeConcaeView t where t.CourseId = a.CourseId for XML path('')),1,1,'') ScheduleInfo
FROM RoomDayTimeConcaeView a
group by a.CourseId
GO
/****** Object:  View [dbo].[ScheduleInfoView]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ScheduleInfoView]
AS
SELECT c.Id, c.DepartmentId, c.Code, c.Name, cl.ScheduleInfo
FROM     dbo.ClassSchedule AS cl RIGHT OUTER JOIN
                  dbo.Course AS c ON c.Id = cl.CourseId
GO
/****** Object:  View [dbo].[CourseAssigneView]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseAssigneView]
AS
SELECT d.Id AS DepartmentId, t.Id AS TeacherId, c.Id AS CourseId, t.Name AS TeacherName, c.Name AS CourseName, c.Code AS CourseCode, c.Credit AS CourseCerdit, 
                  c.Semester AS CourseSemester, c.DepartmentId AS CourseDepartment
FROM     dbo.Department AS d RIGHT OUTER JOIN
                  CourseAssign AS ca ON d.Id = ca.DepartmentId RIGHT OUTER JOIN
                  Teacher AS t ON t.Id = ca.TeacherId RIGHT OUTER JOIN
                  Course AS c ON c.Id = ca.CourseId
GO
/****** Object:  View [dbo].[ViewAllCourseCodeCourseNameTakenByATeacher]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAllCourseCodeCourseNameTakenByATeacher]
AS
SELECT        dbo.Teacher.Id AS TeacherId, dbo.Teacher.Name AS TeacherName, dbo.CourseAssign.CourseId, dbo.Course.Code AS CourseCode, dbo.Course.Name AS CourseName
FROM            dbo.Course INNER JOIN
                         dbo.CourseAssign ON dbo.Course.Id = dbo.CourseAssign.CourseId INNER JOIN
                         dbo.Teacher ON dbo.CourseAssign.TeacherId = dbo.Teacher.Id

GO
/****** Object:  View [dbo].[viewCodeNameGradeFromStudentId]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewCodeNameGradeFromStudentId]
AS
SELECT        dbo.Student.Id AS StudentId, dbo.Course.Code AS CourseCode, dbo.Course.Name AS CourseName, dbo.EnrollCourse.CourseId AS EnrollCourseId, dbo.StudentResult.Grade
FROM            dbo.Course INNER JOIN
                         dbo.EnrollCourse ON dbo.Course.Id = dbo.EnrollCourse.CourseId FULL OUTER JOIN
                         dbo.Student ON dbo.EnrollCourse.StudentId = dbo.Student.Id FULL OUTER JOIN
                         dbo.StudentResult ON dbo.Course.Id = dbo.StudentResult.CourseId AND dbo.Student.Id = dbo.StudentResult.StudentId

GO
/****** Object:  View [dbo].[ViewCourseFromStudentDepartmentMenu]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCourseFromStudentDepartmentMenu]
AS
SELECT        dbo.Course.Name AS CourseName, dbo.Course.Id AS CourseId, dbo.Student.Id AS StudentId, dbo.Student.DepartmentId AS StudentDepartmentId, dbo.Department.Id AS DepartmentId
FROM            dbo.Course INNER JOIN
                         dbo.Department ON dbo.Course.DepartmentId = dbo.Department.Id INNER JOIN
                         dbo.Student ON dbo.Department.Id = dbo.Student.DepartmentId

GO
/****** Object:  View [dbo].[viewEnrollCourseByStudentId]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewEnrollCourseByStudentId]
AS
SELECT        dbo.Course.Name AS CourseName, dbo.EnrollCourse.StudentId AS EnrollStudentId, dbo.EnrollCourse.CourseId AS EnrollCourseId, dbo.Student.Id AS StudentId, dbo.Course.Id AS CourseId
FROM            dbo.Course INNER JOIN
                         dbo.EnrollCourse ON dbo.Course.Id = dbo.EnrollCourse.CourseId INNER JOIN
                         dbo.Student ON dbo.EnrollCourse.StudentId = dbo.Student.Id

GO
/****** Object:  View [dbo].[ViewStudentDetails]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ViewStudentDetails]
AS
SELECT        Student.Id AS StudentId , Student.Name AS StudentName, Student.Email AS StudentEmail, Student.RegNo AS StudentRegNo, Department.Name AS DepartmentName
FROM            Department INNER JOIN
                         Student ON Department.Id = Student.DepartmentId


GO
/****** Object:  View [dbo].[ViewTeacherOfACourse]    Script Date: 11/25/2016 4:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTeacherOfACourse]
AS
SELECT        dbo.Teacher.Id AS TeacherId, dbo.Teacher.Name AS TeacherName, dbo.CourseAssign.TeacherId AS CourseAssignTeacherId, dbo.CourseAssign.CourseId, dbo.Course.Code AS CourseCode, 
                         dbo.Course.Name AS CourseName
FROM            dbo.Course INNER JOIN
                         dbo.CourseAssign ON dbo.Course.Id = dbo.CourseAssign.CourseId INNER JOIN
                         dbo.Teacher ON dbo.CourseAssign.TeacherId = dbo.Teacher.Id

GO
SET IDENTITY_INSERT [dbo].[AdminLogin] ON 

INSERT [dbo].[AdminLogin] ([Id], [Username], [Password]) VALUES (1, N'Coder', N'123456')
SET IDENTITY_INSERT [dbo].[AdminLogin] OFF
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] ON 

INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (1, 1, 1, N'R.NO:A-102', N'Sun', CAST(0x00A08C0000000000 AS Time), CAST(0x00B8A10000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (5, 1, 1, N'R.NO:A-202', N'Twe', CAST(0x00100E0000000000 AS Time), CAST(0x00302A0000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (6, 1, 1, N'R.NO:A-203', N'Wed', CAST(0x00201C0000000000 AS Time), CAST(0x00483F0000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (8, 1, 14, N'R.NO:A-102', N'Wed', CAST(0x00201C0000000000 AS Time), CAST(0x0038310000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (16, 1, 0, N'R.NO:A-102', N'Sun', CAST(0x0000000000000000 AS Time), CAST(0x0000000000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (17, 1, 13, N'R.NO:A-104', N'Mon', CAST(0x0000000000000000 AS Time), CAST(0x0000000000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (18, 2, 3, N'R.NO:A-102', N'Sun', CAST(0x00302A0000000000 AS Time), CAST(0x00584D0000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (19, 1, 1, N'R.NO:A-102', N'Sun', CAST(0x00100E0000000000 AS Time), CAST(0x0028230000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (20, 1, 2, N'R.NO:A-104', N'Mon', CAST(0x00302A0000000000 AS Time), CAST(0x00584D0000000000 AS Time))
INSERT [dbo].[AllocateClassRoom] ([Id], [DepartmentId], [CourseId], [RoomNo], [DayN], [StrartFrom], [EndTo]) VALUES (21, 2, 17, N'R.NO:A-104', N'Mon', CAST(0x0050460000000000 AS Time), CAST(0x00685B0000000000 AS Time))
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (1, N'CSE415', N'Web Engineering', CAST(3.50 AS Decimal(18, 2)), N'We can learn PHP in this course', 1, N'7th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (2, N'CSE412', N'Artificial Intelligence', CAST(3.00 AS Decimal(18, 2)), N'We can insert knowledge into a machine', 1, N'8th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (3, N'EEE223', N'Digital Systems Design', CAST(2.50 AS Decimal(18, 2)), N'We learn Digital Systems Design from this Course', 2, N'5th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (4, N'EEE124', N'Fundamentals of Electrical Engineering ', CAST(4.00 AS Decimal(18, 2)), N'We learn Fundamentals of Electrical Engineering  from this Course', 2, N'1st Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (5, N'EEE414', N'Digital Electronics', CAST(3.50 AS Decimal(18, 2)), N'We learn EDigital Electronics  from this Course', 2, N'8th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (6, N'CSE211', N'Java', CAST(3.00 AS Decimal(18, 2)), N'We can learn Java programing Language ', 1, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (7, N'BBA215', N'Marketing', CAST(3.00 AS Decimal(18, 2)), N'Mathematical', 3, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (8, N'BBA415', N'Accounting', CAST(3.00 AS Decimal(18, 2)), N'Mathematical', 3, N'7th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (10, N'ETE157', N'Data Communication', CAST(3.00 AS Decimal(18, 2)), N'Theoritical', 4, N'6th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (11, N'ETE234', N'Networking', CAST(3.00 AS Decimal(18, 2)), N'Theoritical', 4, N'4th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (12, N'ETE347', N'Electronic Device', CAST(3.00 AS Decimal(18, 2)), N'Theoritical', 4, N'4th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (13, N'CSE125', N'Compiler Digine', CAST(3.50 AS Decimal(18, 2)), N'Therotical', 1, N'6th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (14, N'CSE333', N'Database', CAST(3.00 AS Decimal(18, 2)), N'Oracle sql', 1, N'5th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (15, N'CSE245', N'Wireless Engineering', CAST(3.50 AS Decimal(18, 2)), N'Develop Game In Unity', 1, N'6th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (16, N'EEE547', N'Electrical Fundamental', CAST(4.00 AS Decimal(18, 2)), N'Theoritical', 2, N'1st Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (17, N'EEE225', N'Basic Electricity', CAST(4.50 AS Decimal(18, 2)), N'Theoritical', 2, N'2nd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (18, N'EEE419', N'Electricity', CAST(3.00 AS Decimal(18, 2)), N'Theoritical', 2, N'5th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (19, N'CSE674', N'Algorithm', CAST(3.00 AS Decimal(18, 2)), N'Programming', 1, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (20, N'CSE347', N'Simulation', CAST(3.00 AS Decimal(18, 2)), N'Mathematical', 1, N'7th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (21, N'CSE754', N'Simulation Lab', CAST(1.00 AS Decimal(18, 2)), N'Lab', 1, N'7th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (22, N'BBA574', N'Statistic', CAST(3.00 AS Decimal(18, 2)), N'Mathematics', 3, N'4th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (23, N'BBA697', N'Economics', CAST(3.00 AS Decimal(18, 2)), N'Theoritical', 3, N'4th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (24, N'ETE154', N'Networking Lab', CAST(1.00 AS Decimal(18, 2)), N'Lab', 4, N'2nd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (25, N'ETE354', N'Telicomunication', CAST(3.00 AS Decimal(18, 2)), N'Theoritical', 4, N'5th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (26, N'TE123', N'Mathematics1', CAST(3.00 AS Decimal(18, 2)), N'drg', 5, N'1st Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (27, N'TE653', N'Course2', CAST(3.00 AS Decimal(18, 2)), N'fgh', 5, N'4th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (28, N'SE987', N'CourseSE1', CAST(3.00 AS Decimal(18, 2)), N'sgd', 6, N'4th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (29, N'SE658', N'CourseSE2', CAST(4.00 AS Decimal(18, 2)), N'segrs', 6, N'2nd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (30, N'SE357', N'CourseSE3', CAST(3.00 AS Decimal(18, 2)), N'svv', 6, N'7th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (31, N'NFE357', N'Food Processing', CAST(4.00 AS Decimal(18, 2)), N'gjh', 7, N'3rd Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (32, N'NFE368', N'NFE Course 1', CAST(4.00 AS Decimal(18, 2)), N'lik', 7, N'5th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (33, N'NFE548', N'NFE Course 2', CAST(4.00 AS Decimal(18, 2)), N'bvcb', 7, N'6th Semester')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [Semester]) VALUES (34, N'SY123', N'Environment', CAST(3.00 AS Decimal(18, 2)), N'Ars subject', 8, N'1st Semester')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssign] ON 

INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (7, 2, 2, 3)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (8, 2, 2, 4)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (9, 2, 5, 5)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (10, 2, 6, 16)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (11, 2, 6, 17)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (12, 2, 6, 18)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (15, 7, 11, 31)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (16, 7, 11, 32)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (17, 7, 12, 33)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (18, 1, 1, 6)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (19, 8, 13, 34)
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseId]) VALUES (1018, 1, 7, 19)
SET IDENTITY_INSERT [dbo].[CourseAssign] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Coumputer scince and engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'EEE', N'Electrical and Electronic Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'BBA', N'Bachelor of Business Administrator ')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (4, N'ETE', N'Electrical and Telecomunication Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (5, N'TE', N'Textile Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (6, N'SE', N'Software Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (7, N'NFE', N'Nutration And Food Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (8, N'SY', N'Sociology')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (1, 4, 1, CAST(0x583B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (2, 6, 5, CAST(0x573B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (3, 5, 2, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (4, 4, 2, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (5, 6, 3, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (6, 7, 1, CAST(0x5A3B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (7, 7, 2, CAST(0x5A3B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (8, 6, 4, CAST(0x583B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (12, 8, 7, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (13, 9, 8, CAST(0x583B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (14, 9, 7, CAST(0x5A3B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (15, 10, 6, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (16, 10, 2, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (17, 11, 13, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (18, 12, 6, CAST(0x5C3B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (19, 12, 2, CAST(0x593B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (20, 13, 31, CAST(0x5C3B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (21, 13, 32, CAST(0x5D3B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (22, 14, 6, CAST(0xAB3B0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [StudentId], [CourseId], [Date]) VALUES (23, 14, 21, CAST(0xB73B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (4, N'Sumon kumar Dash', N'sumondasvip007@gmail.com', N'01964142159', CAST(0x573B0B00 AS Date), N'Narail,Khulna', 1, N'CSE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (5, N'Borat Hossain', N'borat2497@diu.edu.bd', N'01954621354', CAST(0x563B0B00 AS Date), N'Dinajpur', 1, N'CSE-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (6, N'sujit', N'sujit@gmail.com', N'01724589541', CAST(0x573B0B00 AS Date), N'Boshupoti', 2, N'EEE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (7, N'Mustak Ahmed', N'mustak@gamil.com', N'01954632178', CAST(0x583B0B00 AS Date), N'Dhanmondi 15', 1, N'CSE-2016-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (8, N'Mamun', N'mamun@gmail.com', N'01954621354', CAST(0x583B0B00 AS Date), N'Mirpur', 3, N'BBA-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (9, N'Roni', N'roni@gmail.com', N'01724589541', CAST(0x583B0B00 AS Date), N'Mirpur', 3, N'BBA-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (10, N'Salman', N'salman@mail.com', N'01724589541', CAST(0x593B0B00 AS Date), N'Narail', 1, N'CSE-2016-004')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (11, N'Tonmoy Karmokar', N'tonmoy@gmail.com', N'01954621354', CAST(0x593B0B00 AS Date), N'Rajbari', 1, N'CSE-2016-005')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (12, N'Akmal Hossain', N'akmal@gmail.com', N'01954632178', CAST(0x5B3B0B00 AS Date), N'Manikgonj', 1, N'CSE-2016-006')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (13, N'Apu', N'apu@mail.com', N'54453', CAST(0x5B3B0B00 AS Date), N'dad', 7, N'NFE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (14, N'Kousar', N'kousar.rahman@diu.edu.bd', N'5646463', CAST(0xAB3B0B00 AS Date), N'hkhh', 1, N'CSE-2016-007')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegNo]) VALUES (15, N'Kanta Afrin', N'kanta@mail.com', N'0176554646', CAST(0xB73B0B00 AS Date), N'Khulna', 8, N'SY-2016-001')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (1, 4, 1, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (2, 4, 2, N'B+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (3, 6, 3, N'A')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (4, 6, 4, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (5, 8, 7, N'B-')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (6, 9, 8, N'A')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (7, 10, 6, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (8, 11, 13, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (9, 12, 6, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (10, 13, 31, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (11, 14, 6, N'A+')
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [Grade]) VALUES (12, 10, 2, N'A+')
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (1, N'Rezwana Sultana', N'Dhanmondi', N'rezwana@mail.com', 1954621354, N'AP', 1, CAST(20.50 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (2, N'Shuvo Saha', N'Rangamati', N'shuvo@gmail.com', 1854632147, N'L', 2, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (3, N'Akter Hossain', N'new Market', N'Aktar@mail.com', 1724589541, N'P', 1, CAST(16.50 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (4, N'Saiful Hasan', N'Dhamrai', N'saiful@mail.com', 1954621354, N'L', 1, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (5, N'Habibur Rahman', N'Mymensingh', N'habib@mail.com', 1954632178, N'SL', 2, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (6, N'Ashish Saha', N'Khulna', N'ashish@gmail.com', 1954632178, N'AP', 2, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (7, N'Kousar', N'Mirpur', N'kousar@gmail.com', 1964142159, N'P', 1, CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (8, N'Partho', N'Chittagong', N'partha@mail.com', 1954621354, N'AP', 1, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (9, N'Sagor', N'qfqfq', N'sagor@mail.com', 1724589541, N'AP', 6, CAST(8.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (10, N'Koushik', N'efw', N'koushik@mail.com', 1724589541, N'L', 6, CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (11, N'Kobir', N'Dhanmondi', N'kobir@mail.com', 1724589541, N'AP', 7, CAST(7.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (12, N'maruf', N'hgjh', N'maruf@mail.com', 544644, N'SL', 7, CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [DepartmentId], [CreditToBeTaken]) VALUES (13, N'Salman Rahman', N'Dhanmondi', N'salman@gmail.com', 1887453455, N'P', 8, CAST(12.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AdminLogin]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AdminLogin] ON [dbo].[AdminLogin]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course] ON [dbo].[Course]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course_1]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Course_1] ON [dbo].[Course]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Department]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department] ON [dbo].[Department]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Department_1]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_1] ON [dbo].[Department]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Student] ON [dbo].[Student]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Teacher]    Script Date: 11/25/2016 4:45:56 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Teacher] ON [dbo].[Teacher]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Course]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Department]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Teacher]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Course]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_EnrollCourse] FOREIGN KEY([Id])
REFERENCES [dbo].[EnrollCourse] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_EnrollCourse]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
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
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseAssign"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teacher"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 634
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAllCourseCodeCourseNameTakenByATeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAllCourseCodeCourseNameTakenByATeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[7] 2[21] 3) )"
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
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "EnrollCourse"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StudentResult"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewCodeNameGradeFromStudentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewCodeNameGradeFromStudentId'
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
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 4
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCourseFromStudentDepartmentMenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCourseFromStudentDepartmentMenu'
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
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EnrollCourse"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewEnrollCourseByStudentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'viewEnrollCourseByStudentId'
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
         Begin Table = "Course"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseAssign"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teacher"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 634
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTeacherOfACourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewTeacherOfACourse'
GO
USE [master]
GO
ALTER DATABASE [University_MS_DB] SET  READ_WRITE 
GO
