 USE [DB_9E3E00_mywebsite]
GO
/****** Object:  UserDefinedFunction [dbo].[GetClosed]    Script Date: 1/17/2016 11:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE FUNCTION [dbo].[GetClosed]
(	
	@Hours bigint
)
RETURNS bit
AS
BEGIN
 
DECLARE @MyVar bit
Set @MyVar = 0
 if(@Hours>0)
Set @MyVar = 1

 return  @MyVar
 
end


GO
/****** Object:  UserDefinedFunction [dbo].[GetStatus]    Script Date: 1/17/2016 11:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

create FUNCTION [dbo].[GetStatus]
(	
	@ID int
)
RETURNS bit
AS
BEGIN
 
DECLARE @MyVar bit
Set @MyVar = 0
 if(@ID>0)
Set @MyVar = 1

 return  @MyVar
 
end


GO
/****** Object:  UserDefinedFunction [dbo].[StudentAttendanceFunction]    Script Date: 1/17/2016 11:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION  [dbo].[StudentAttendanceFunction] 
(	
	-- Add the parameters for the function here
@StudentID bit
)
RETURNS nvarchar(30)
AS
begin
 declare @Stautus nvarchar(30) 
if (@StudentID =1)
set @Stautus ='Attended'
 else
 Set @Stautus='Absent'

return(@Stautus)
 
end
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 1/17/2016 11:38:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypes](
	[AccountTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AccountType] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccountTypes] PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdminsTracking]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminsTracking](
	[TableID] [int] NULL,
	[RecordID] [int] NULL,
	[DateModify] [datetime] NULL,
	[PersonID] [int] NULL,
	[AdminsOperationTypeID] [int] NULL,
	[OldValue] [nvarchar](50) NULL,
	[NewValue] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AndroidTrack1]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AndroidTrack1](
	[AndroidLog] [float] NULL,
	[AndroidLat] [float] NULL,
	[DateRegister] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[AttachmentID] [int] NULL,
	[AttachmentTypeID] [int] NULL,
	[AttachmentPath] [nvarchar](150) NULL,
	[AttachmentDateIN] [datetime] NULL,
	[AddedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttachmentType]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachmentType](
	[AttachmentTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AttachmentTypeName] [nvarchar](30) NULL,
 CONSTRAINT [PK_AttachmentType] PRIMARY KEY CLUSTERED 
(
	[AttachmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hackerd]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hackerd](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentFirstName] [nvarchar](25) NULL,
	[TutorialID] [int] NULL,
	[StudentEmail] [nvarchar](55) NULL,
	[StudentComment] [nvarchar](255) NULL,
	[DataRegister] [datetime] NULL,
	[SkypeID] [nvarchar](30) NULL,
	[StudentLastName] [nvarchar](25) NULL,
	[AccountTypeID] [int] NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[AccountImage] [nvarchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HomeWorks]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeWorks](
	[TutorialID] [int] NULL,
	[HomeWorkTitle] [nvarchar](50) NULL,
	[HomeWorkDetails] [nvarchar](255) NULL,
	[Datein] [datetime] NULL,
	[DeadLineDate] [datetime] NULL,
	[HomeWorkID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[HomeWorkUID] [uniqueidentifier] NULL,
	[AddedBy] [int] NULL,
	[Grade] [float] NULL,
 CONSTRAINT [PK_HomeWorks] PRIMARY KEY CLUSTERED 
(
	[HomeWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MyStudents]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyStudents](
	[StudentID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StudentFirstName] [nvarchar](25) NULL,
	[TutorialID] [int] NULL,
	[StudentEmail] [nvarchar](55) NULL,
	[StudentComment] [nvarchar](255) NULL,
	[DataRegister] [datetime] NULL,
	[SkypeID] [nvarchar](30) NULL,
	[StudentLastName] [nvarchar](25) NULL,
	[AccountTypeID] [int] NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[AccountImage] [nvarchar](150) NULL,
 CONSTRAINT [PK_MyStudents] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsTitle] [nvarchar](150) NULL,
	[NewsDetails] [nvarchar](2000) NULL,
	[NewsID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[NewsDate] [datetime] NULL,
	[AccountID] [int] NULL,
	[SendAccountID] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PeoplePassCode]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PeoplePassCode](
	[PersonID] [int] NULL,
	[PassCode] [char](100) NULL,
	[DateIn] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAttendance](
	[StudentID] [int] NULL,
	[TutorialScheduleID] [int] NULL,
	[AttendenceStutusID] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentHomeWorkSubmit]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentHomeWorkSubmit](
	[StudentID] [int] NULL,
	[HomeWorkID] [int] NULL,
	[SubmitDatein] [datetime] NULL,
	[SubmitHomeWorkID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Grade] [float] NULL,
	[StudentNote] [nvarchar](255) NULL,
	[AdminComment] [nvarchar](255) NULL,
 CONSTRAINT [PK_StudentHomeWorkSubmit] PRIMARY KEY CLUSTERED 
(
	[SubmitHomeWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentTutorial]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTutorial](
	[TutorialID] [int] NOT NULL,
	[StudentID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tutorials]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutorials](
	[TutorialID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TutorialName] [nvarchar](50) NULL,
	[TutorialLink] [nvarchar](250) NULL,
	[TutorialDeatils] [nvarchar](800) NULL,
	[DateStart] [datetime] NULL,
	[Time] [int] NULL,
	[DateIn] [datetime] NULL,
 CONSTRAINT [PK_Tutorials] PRIMARY KEY CLUSTERED 
(
	[TutorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TutorialSchedule]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorialSchedule](
	[TutorialID] [int] NOT NULL,
	[DateStart] [datetime] NOT NULL,
	[TutorialScheduleID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LectureTime] [float] NOT NULL,
	[TutorialTypeID] [int] NULL,
 CONSTRAINT [PK_TutorialSchedule] PRIMARY KEY CLUSTERED 
(
	[TutorialScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TutorialTypes]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorialTypes](
	[TutorialTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TutorialTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_TutorialTypes] PRIMARY KEY CLUSTERED 
(
	[TutorialTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[NewsView]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NewsView]
AS
SELECT        dbo.News.*, dbo.MyStudents.StudentFirstName, dbo.MyStudents.StudentLastName, dbo.MyStudents.AccountImage, 
                         dbo.AccountTypes.AccountType
FROM            dbo.News INNER JOIN
                         dbo.MyStudents ON dbo.News.AccountID = dbo.MyStudents.StudentID INNER JOIN
                         dbo.AccountTypes ON dbo.MyStudents.AccountTypeID = dbo.AccountTypes.AccountTypeID


GO
/****** Object:  View [dbo].[StudentAttendanceView]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentAttendanceView]
AS
SELECT        dbo.TutorialSchedule.TutorialID, dbo.TutorialSchedule.DateStart, dbo.StudentAttendance.StudentID, dbo.TutorialSchedule.LectureTime, 
                         dbo.TutorialSchedule.TutorialTypeID, dbo.StudentAttendance.AttendenceStutusID
FROM            dbo.TutorialSchedule LEFT OUTER JOIN
                         dbo.StudentAttendance ON dbo.TutorialSchedule.TutorialScheduleID = dbo.StudentAttendance.TutorialScheduleID

GO
/****** Object:  View [dbo].[StudentAttendenceRegisteration]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentAttendenceRegisteration]
AS
SELECT        dbo.MyStudents.StudentFirstName, dbo.MyStudents.StudentLastName, dbo.MyStudents.StudentEmail, dbo.MyStudents.StudentID, 
                         dbo.TutorialSchedule.TutorialScheduleID, dbo.Tutorials.TutorialID, ISNULL(dbo.StudentAttendance.AttendenceStutusID, 0) AS IsAttend
FROM            dbo.MyStudents INNER JOIN
                         dbo.StudentTutorial ON dbo.MyStudents.StudentID = dbo.StudentTutorial.StudentID INNER JOIN
                         dbo.Tutorials ON dbo.StudentTutorial.TutorialID = dbo.Tutorials.TutorialID INNER JOIN
                         dbo.TutorialSchedule ON dbo.Tutorials.TutorialID = dbo.TutorialSchedule.TutorialID LEFT OUTER JOIN
                       StudentAttendance ON dbo.MyStudents.StudentID =  StudentAttendance.StudentID AND 
                         dbo.TutorialSchedule.TutorialScheduleID = dbo.StudentAttendance.TutorialScheduleID

GO
/****** Object:  View [dbo].[StudentLogin]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentLogin]
AS
SELECT        dbo.MyStudents.StudentFirstName, dbo.MyStudents.StudentLastName, dbo.MyStudents.StudentEmail, dbo.AdminsTracking.DateModify, 
                         dbo.MyStudents.StudentID
FROM            dbo.MyStudents INNER JOIN
                         dbo.AdminsTracking ON dbo.MyStudents.StudentID = dbo.AdminsTracking.PersonID


GO
/****** Object:  View [dbo].[StudentTutorialView]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StudentTutorialView]
AS
SELECT        dbo.Tutorials.TutorialID, dbo.Tutorials.TutorialName, dbo.StudentTutorial.StudentID, dbo.Tutorials.DateIn
FROM            dbo.Tutorials INNER JOIN
                         dbo.StudentTutorial ON dbo.Tutorials.TutorialID = dbo.StudentTutorial.TutorialID


GO
/****** Object:  View [dbo].[TutorialScheduleView]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TutorialScheduleView]
AS
SELECT        dbo.TutorialSchedule.*, dbo.TutorialTypes.TutorialTypeName
FROM            dbo.TutorialSchedule INNER JOIN
                         dbo.TutorialTypes ON dbo.TutorialSchedule.TutorialTypeID = dbo.TutorialTypes.TutorialTypeID


GO
ALTER TABLE [dbo].[MyStudents] ADD  CONSTRAINT [DF_MyStudents_AccountType]  DEFAULT ((3)) FOR [AccountTypeID]
GO
ALTER TABLE [dbo].[MyStudents] ADD  CONSTRAINT [DF_MyStudents_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdminsTracking]  WITH CHECK ADD  CONSTRAINT [FK_AdminsTracking_MyStudents] FOREIGN KEY([PersonID])
REFERENCES [dbo].[MyStudents] ([StudentID])
GO
ALTER TABLE [dbo].[AdminsTracking] CHECK CONSTRAINT [FK_AdminsTracking_MyStudents]
GO
ALTER TABLE [dbo].[Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Attachments_AttachmentType] FOREIGN KEY([AttachmentTypeID])
REFERENCES [dbo].[AttachmentType] ([AttachmentTypeID])
GO
ALTER TABLE [dbo].[Attachments] CHECK CONSTRAINT [FK_Attachments_AttachmentType]
GO
ALTER TABLE [dbo].[HomeWorks]  WITH CHECK ADD  CONSTRAINT [FK_HomeWorks_Tutorials] FOREIGN KEY([TutorialID])
REFERENCES [dbo].[Tutorials] ([TutorialID])
GO
ALTER TABLE [dbo].[HomeWorks] CHECK CONSTRAINT [FK_HomeWorks_Tutorials]
GO
ALTER TABLE [dbo].[MyStudents]  WITH CHECK ADD  CONSTRAINT [FK_MyStudents_AccountTypes] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountTypes] ([AccountTypeID])
GO
ALTER TABLE [dbo].[MyStudents] CHECK CONSTRAINT [FK_MyStudents_AccountTypes]
GO
ALTER TABLE [dbo].[MyStudents]  WITH CHECK ADD  CONSTRAINT [FK_MyStudents_Tutorials] FOREIGN KEY([TutorialID])
REFERENCES [dbo].[Tutorials] ([TutorialID])
GO
ALTER TABLE [dbo].[MyStudents] CHECK CONSTRAINT [FK_MyStudents_Tutorials]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MyStudents] FOREIGN KEY([SendAccountID])
REFERENCES [dbo].[MyStudents] ([StudentID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MyStudents]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MyStudents1] FOREIGN KEY([AccountID])
REFERENCES [dbo].[MyStudents] ([StudentID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MyStudents1]
GO
ALTER TABLE [dbo].[PeoplePassCode]  WITH CHECK ADD  CONSTRAINT [FK_PeoplePassCode_MyStudents] FOREIGN KEY([PersonID])
REFERENCES [dbo].[MyStudents] ([StudentID])
GO
ALTER TABLE [dbo].[PeoplePassCode] CHECK CONSTRAINT [FK_PeoplePassCode_MyStudents]
GO
ALTER TABLE [dbo].[StudentHomeWorkSubmit]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomeWorkSubmit_MyStudents1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[MyStudents] ([StudentID])
GO
ALTER TABLE [dbo].[StudentHomeWorkSubmit] CHECK CONSTRAINT [FK_StudentHomeWorkSubmit_MyStudents1]
GO
ALTER TABLE [dbo].[StudentHomeWorkSubmit]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomeWorkSubmit_Tutorials] FOREIGN KEY([HomeWorkID])
REFERENCES [dbo].[HomeWorks] ([HomeWorkID])
GO
ALTER TABLE [dbo].[StudentHomeWorkSubmit] CHECK CONSTRAINT [FK_StudentHomeWorkSubmit_Tutorials]
GO
ALTER TABLE [dbo].[StudentTutorial]  WITH CHECK ADD  CONSTRAINT [FK_StudentTutorial_MyStudents] FOREIGN KEY([StudentID])
REFERENCES [dbo].[MyStudents] ([StudentID])
GO
ALTER TABLE [dbo].[StudentTutorial] CHECK CONSTRAINT [FK_StudentTutorial_MyStudents]
GO
ALTER TABLE [dbo].[StudentTutorial]  WITH CHECK ADD  CONSTRAINT [FK_StudentTutorial_Tutorials] FOREIGN KEY([TutorialID])
REFERENCES [dbo].[Tutorials] ([TutorialID])
GO
ALTER TABLE [dbo].[StudentTutorial] CHECK CONSTRAINT [FK_StudentTutorial_Tutorials]
GO
ALTER TABLE [dbo].[TutorialSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TutorialSchedule_Tutorials] FOREIGN KEY([TutorialID])
REFERENCES [dbo].[Tutorials] ([TutorialID])
GO
ALTER TABLE [dbo].[TutorialSchedule] CHECK CONSTRAINT [FK_TutorialSchedule_Tutorials]
GO
ALTER TABLE [dbo].[TutorialSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TutorialSchedule_TutorialTypes] FOREIGN KEY([TutorialTypeID])
REFERENCES [dbo].[TutorialTypes] ([TutorialTypeID])
GO
ALTER TABLE [dbo].[TutorialSchedule] CHECK CONSTRAINT [FK_TutorialSchedule_TutorialTypes]
GO
/****** Object:  StoredProcedure [dbo].[GetHomeWork]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
 
CREATE procedure [dbo].[GetHomeWork]( @StudentID int , @TutorialID int)
as
begin
 SELECT  ROW_NUMBER() OVER(ORDER BY Datein DESC) AS Row 
      , HomeWorkTitle, DeadLineDate, HomeWorkUID,
	   (SELECT COUNT(StudentID) AS Expr1 FROM StudentHomeWorkSubmit as st WHERE (st.HomeWorkID = HomeWorks.HomeWorkID) AND (st.StudentID = @StudentID)) AS Submits,
	    Grade,
	   (SELECT SUM(ISNULL(Grade, 0)) AS Expr1 FROM StudentHomeWorkSubmit AS StudentHomeWorkSubmit_1 WHERE (StudentHomeWorkSubmit_1.HomeWorkID =HomeWorks. HomeWorkID) AND (StudentHomeWorkSubmit_1.StudentID = @StudentID)) AS GradeGet
	    ,(
		CASE WHEN ( datediff(minute ,DeadLineDate,getdate())>0) THEN 'Closed'
             ELSE ' '
        END
		)as statusu
		
 
		FROM HomeWorks   WHERE (TutorialID = @TutorialID) ORDER BY Datein DESC
	  end

GO
/****** Object:  StoredProcedure [dbo].[LastNews]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE procedure [dbo].[LastNews](@adminID int ,@start int,@end int)
as
begin
SELECT  *
  FROM (


  SELECT NewsTitle, NewsDetails, ROW_NUMBER() OVER (ORDER BY NewsDate DESC) as NewsID , NewsDate, AccountID, SendAccountID, StudentFirstName + ' ' + StudentLastName AS FullName, AccountType AS AccountTypeName,
 AccountImage
  FROM NewsView WHERE (AccountID = 4) OR (AccountID = @adminID)  ) as tview --@adminID
  where tview.NewsID between  @start and @end
  end
   

GO
/****** Object:  StoredProcedure [dbo].[selectd]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
 
 create procedure [dbo].[selectd] (@AccountID int)
 as
 begin

 SELECT * FROM [News] where AccountID=@AccountID

 end

GO
/****** Object:  StoredProcedure [dbo].[StudentAttendnce]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[StudentAttendnce]( @TutorialID int ,@StudentID int)
as begin
SELECT  
       [DateStart]
      ,LectureTime
 
	  , dbo.StudentAttendanceFunction(AttendenceStutusID)   as StatusaAttendance
  FROM  [StudentAttendanceView]
  where  [TutorialID]= @TutorialID and  (StudentID=@StudentID)-- or StudentID is null)  --and [DateStart]<=getdate()
  and TutorialTypeID=1
  order by DateStart
  end

GO
/****** Object:  StoredProcedure [dbo].[SubMitHomeWork]    Script Date: 1/17/2016 11:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SubMitHomeWork](@SubmitHomeWorkID int)
as
begin
SELECT        dbo.MyStudents.StudentID, dbo.StudentHomeWorkSubmit.SubmitHomeWorkID,dbo.StudentHomeWorkSubmit.AdminComment, dbo.MyStudents.StudentFirstName + ' ' + dbo.MyStudents.StudentLastName as StudentFirstName, dbo.MyStudents.StudentEmail, 
                          dbo.StudentHomeWorkSubmit.Grade, dbo.StudentHomeWorkSubmit.StudentNote
						, Attachments.AttachmentPath
						,Attachments.AttachmentDateIN
FROM            dbo.MyStudents INNER JOIN
                         dbo.StudentHomeWorkSubmit 
						 ON dbo.MyStudents.StudentID = dbo.StudentHomeWorkSubmit.StudentID
						 and  dbo.StudentHomeWorkSubmit.SubmitDatein=
						 ( select max ( SubmitDatein) from   dbo.StudentHomeWorkSubmit as submit where 

						submit.HomeWorkID= dbo.StudentHomeWorkSubmit.HomeWorkID and submit.StudentID= dbo.StudentHomeWorkSubmit.StudentID )  and dbo.StudentHomeWorkSubmit.HomeWorkID=@SubmitHomeWorkID
left join   .[Attachments]
on StudentHomeWorkSubmit.SubmitHomeWorkID=Attachments.AttachmentID
order by Attachments.AttachmentDateIN
end
 
