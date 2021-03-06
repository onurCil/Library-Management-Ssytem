USE [master]
GO
/****** Object:  Database [DBLibrary]    Script Date: 26.12.2014 07:38:31 ******/
CREATE DATABASE [DBLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBLibrary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBLibrary_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBLibrary] SET COMPATIBILITY_LEVEL = 110
GO


SET DATEFORMAT dmy;
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBLibrary] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [DBLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [DBLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBLibrary]
GO
/****** Object:  StoredProcedure [dbo].[controlBill]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[controlBill] (@recDate date,@retDate date,@memberId int,@itemId int,@curDate date)
as
begin
select * from BILL b, ITEM i, MEMBER m
where b.itemId = i.itemId and b.memberId=m.memberId and @curDate BETWEEN @recDate and @retDate and @memberId=b.memberId and i.itemId = @itemId 
end
GO
/****** Object:  StoredProcedure [dbo].[spControlAdmin]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spControlAdmin](@nick nvarchar(50),@password nvarchar(50))
as
begin
	select u.* From [ADMIN] a,[USER] u
	where a.userId = u.userId and u.nickName = @nick and u.password = @password
end
GO
/****** Object:  StoredProcedure [dbo].[spControlUSER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spControlUSER](@nick nvarchar(50),@password nvarchar(50))
as
begin
  select * from  [dbo].[USER] u
  where u.nickName=@nick and u.password = @password
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteADMINbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteADMINbyID](@adminId int)
as
begin
delete  from ADMIN 
where  adminId=@adminId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteBOOKbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteBOOKbyID](@bookId int)
as
begin
delete  from BOOK 
where  bookId=@bookId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteBORROWbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spDeleteBORROWbyID](@userId int,@itemID int)
as
begin
delete  from BORROW 
where userId=@userId and itemId=@itemID
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteBORROWbyUserID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteBORROWbyUserID](@userId int)
as
begin
delete  from BORROW 
where userId=@userId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCategorybyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteCategorybyID](@categoryId int)
as
begin
delete  from CATEGORY 
where  categoryId=@categoryId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteITEMbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteITEMbyID](@itemId int)
as
begin
delete  from ITEM 
where  itemId=@itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteITEMbyName]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteITEMbyName](@name varchar(50))
as
begin
delete  from ITEM 
where  name=@name
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteJOURNALbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteJOURNALbyID](@journalId int)
as
begin
delete  from JOURNAL 
where  journalId=@journalId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteMEMBERbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteMEMBERbyID](@memberId int)
as
begin
delete  from MEMBER 
where  memberId=@memberId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteNEWSPAPERbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteNEWSPAPERbyID](@newspaperId int)
as
begin
delete  from NEWSPAPER 
where  newspaperId=@newspaperId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeletePublisherbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeletePublisherbyID](@publisherId int)
as
begin
delete  from PUBLISHER 
where  publisherId=@publisherId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteUSERbyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteUSERbyID](@userId int)
as
begin
delete  from [dbo].[USER] 
where  userId=@userId
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteVIDEObyID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spDeleteVIDEObyID](@videoId int)
as
begin
delete  from VIDEO 
where  videoId=@videoId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBills]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetBills]
as
begin
  select *
  from BILL
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBookByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetBookByID] (@id int)
as
begin
  select *
  from BOOK b
  where b.bookId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBookByItemId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetBookByItemId] (@bookID int)
as
begin
  select *
  from ITEM i,BOOK b
  where  i.itemId = b.itemId and @bookID = b.bookId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBooks]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetBooks]
as
begin
  select *
  from BOOK b, ITEM i
  Where b.itemId = i.itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBooksByBookId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetBooksByBookId] (@bookID int)
as
begin
  select *
  from BOOK b, ITEM i
  Where b.itemId = i.itemId and @bookID = b.bookId
end

GO
/****** Object:  StoredProcedure [dbo].[spGetBooksByItemId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetBooksByItemId] (@itemID int)
as
begin
  select *
  from BOOK b, ITEM i
  Where b.itemId = i.itemId and @itemID = b.itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBorrows]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetBorrows]
as
begin
  select *
  from BORROW
end
GO
/****** Object:  StoredProcedure [dbo].[spGetCategories]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spGetCategories]
as
begin
  select *
  from CATEGORY
end
GO
/****** Object:  StoredProcedure [dbo].[spGetCategoryByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetCategoryByID] (@id int)
as
begin
  select * from Category c
  where c.categoryId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetCategoryByName]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetCategoryByName] (@name nvarchar(50))
as
begin
  select * from CATEGORY c
  where c.name = @name
end
GO
/****** Object:  StoredProcedure [dbo].[spGetItemByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetItemByID] (@id int)
as
begin
  select i.itemId,i.name,i.state, CONVERT(VARCHAR(10),i.productionDate,110),i.categoryId,i.publisherId,i.type
  from ITEM i
  where i.itemId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetItemByName]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetItemByName] (@name nvarchar(50))
as
begin
  select * from ITEM i
  where i.name = @name
end
GO
/****** Object:  StoredProcedure [dbo].[spGetJournalByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetJournalByID] (@id int)
as
begin
  select *
  from JOURNAL j
  where j.journalId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetJournalByItemId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetJournalByItemId] (@journalID int)
as
begin
  select *
  from ITEM i,JOURNAL j
  where  i.itemId = j.itemId and @journalID = j.journalId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetJournals]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetJournals]
as
begin
  select *
  from JOURNAL j, ITEM i
  Where j.itemId = i.itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetJournalsByJournalId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetJournalsByJournalId] (@journalID int)
as
begin
  select *
  from JOURNAL j, ITEM i
  Where j.itemId = i.itemId and @journalID = j.journalId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetMemberByUserId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetMemberByUserId] (@id int)
as
begin
  select *
  from MEMBER m
  where m.userId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetNewspaperByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetNewspaperByID] (@id int)
as
begin
  select *
  from NEWSPAPER n
  where n.newspaperId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetNewspaperByItemId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetNewspaperByItemId] (@newspaperID int)
as
begin
  select *
  from ITEM i,NEWSPAPER n
  where  i.itemId = n.itemId and @newspaperID = n.newspaperId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetNewspapers]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetNewspapers]
as
begin
  select *
  from NEWSPAPER n, ITEM i
  Where n.itemId = i.itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetNewspapersByNewspaperId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetNewspapersByNewspaperId] (@newspaperID int)
as
begin
  select *
  from NEWSPAPER n, ITEM i
  Where n.itemId = i.itemId and @newspaperID = n.newspaperId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetPublisherByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetPublisherByID] (@id int)
as
begin
  select * from PUBLISHER p
  where p.publisherId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetPublisherByName]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetPublisherByName] (@name nvarchar(50))
as
begin
  select * from PUBLISHER p
  where p.name = @name
end
GO
/****** Object:  StoredProcedure [dbo].[spGetPublishers]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetPublishers]
as
begin
  select *
  from PUBLISHER
end

GO
/****** Object:  StoredProcedure [dbo].[spGetUserBorrows]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetUserBorrows](@userID int)
as
begin
  select *
  from BORROW b
  Where @userID = b.userId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByAdminId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetUserByAdminId] (@id int)
as
begin
  select *
  from ADMIN a
  where a.adminId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetUserByID] (@id int)
as
begin
  select *
  from [USER] u
  where u.userId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByMemberId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetUserByMemberId] (@id int)
as
begin
  select *
  from MEMBER m
  where m.memberId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByNickName]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spGetUserByNickName] (@nickName nvarchar(50))
as
begin
  select * from [dbo].[USER] u
  where u.nickName = @nickName
end
GO
/****** Object:  StoredProcedure [dbo].[spGetVideoByID]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetVideoByID] (@id int)
as
begin
  select *
  from VIDEO v
  where v.videoId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[spGetVideoByItemId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetVideoByItemId] (@videoID int)
as
begin
  select *
  from ITEM i,VIDEO v
  where  i.itemId = v.itemId and @videoID = v.videoId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetVideoByVideoId]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetVideoByVideoId] (@videoID int)
as
begin
  select *
  from VIDEO v, ITEM i
  Where v.itemId = i.itemId and @videoID = v.videoId
end
GO
/****** Object:  StoredProcedure [dbo].[spGetVideos]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetVideos]
as
begin
  select *
  from VIDEO v, ITEM i
  Where v.itemId = i.itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertADMIN]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertADMIN](@workHour int,@userId int)
as
begin
insert into ADMIN values(@workHour,@userId)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertBILL]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertBILL](@billValue nvarchar(50),@memberId int,@itemId int,@billDate date)
as
begin
insert into BILL values(@billValue,@memberId,@memberId,@billDate)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertBOOK]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spInsertBOOK](@author varchar(50),@itemId int)
as
begin
insert into BOOK values(@author,@itemId)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertBORROW]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertBORROW](@userId int, @itemId int,@receiveDate date,@returnDate date)
as
begin
insert into BORROW values(@userId,@itemId,@receiveDate,@returnDate)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertCATEGORY]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertCATEGORY](@name nvarchar(50),@shelfNumber nvarchar(50))
as
begin
insert into CATEGORY values(@name,@shelfNumber)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertITEM]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertITEM](@name varchar(50),@state int,@productionDate date ,@categoryId int,@publisherId int,@type nvarchar(50))
as
begin
insert into ITEM values(@name,@state,@productionDate,@categoryId,@publisherId,@type)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertJOURNAL]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertJOURNAL](@timeRange nvarchar(50),@itemId int)
as
begin
insert into JOURNAL values(@timeRange,@itemId)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertMEMBER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertMEMBER](@facultyName nvarchar(50),@memberType nvarchar(50),@userId int,@isActive bit)
as
begin
insert into MEMBER values(@facultyName,@memberType,@userId,@isActive)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertNEWSPAPER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertNEWSPAPER](@period nvarchar(50),@itemId int)
as
begin
insert into NEWSPAPER values(@period,@itemId)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertPUBLISHER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertPUBLISHER](@name nvarchar(50),@address nvarchar(200))
as
begin
insert into PUBLISHER values(@name,@address)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertUSER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertUSER](@name nvarchar(50),@gender nvarchar(50),@address nvarchar(50),@password nvarchar(50),@nickName nvarchar(50),@isOnline bit,@mail nvarchar(50))
as
begin
insert into [dbo].[USER] values(@name,@gender,@address,@password,@nickName,@isOnline,@mail)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertVIDEO]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertVIDEO](@format nvarchar(50),@itemId int)
as
begin
insert into VIDEO values(@format,@itemId)
end
GO
/****** Object:  StoredProcedure [dbo].[spItemIdByName]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spItemIdByName](@name nvarchar(50))
as
begin
	select i.itemId from ITEM i
	where @name = i.name
end	
GO
/****** Object:  StoredProcedure [dbo].[spSelectADMIN]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSelectADMIN]
as
begin
  select * from ADMIN
end
GO
/****** Object:  StoredProcedure [dbo].[spSelectITEM]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spSelectITEM]
as
begin
  select * from ITEM
end
GO
/****** Object:  StoredProcedure [dbo].[spSelectMEMBER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSelectMEMBER]
as
begin
  select * from MEMBER
end
GO
/****** Object:  StoredProcedure [dbo].[spSelectUSER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSelectUSER]
as
begin
  select * from  [dbo].[USER] 
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateADMIN]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdateADMIN](@adminId int ,@workHour int,@userId int)
as
begin
update  ADMIN set workHour=@workHour,userId=@userId
where  adminId=@adminId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBOOK]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateBOOK](@bookId int ,@author nvarchar(50))
as
begin
update  BOOK set author=@author
where  bookId=@bookId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBORROW]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateBORROW](@userId int,@itemId int,@returnDate date)
as
begin
update  BORROW set returnDate=@returnDate
where  userId = @userId and itemId=@itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCATEGORY]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateCATEGORY](@categoryId int ,@name varchar(50),@shelfNumber varchar(50))
as
begin
update  CATEGORY set name=@name,shelfNumber=@shelfNumber
where  categoryId=@categoryId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateITEM]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateITEM](@itemId int ,@name varchar(50),@state int,@proDate date,@categoryId int,@publisherId int,@type nvarchar(50))
as
begin
update  ITEM set name=@name,state=@state,productionDate = @proDate,categoryId=@categoryId,publisherId = @publisherId,type = @type
where  itemId=@itemId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateJOURNAL]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateJOURNAL](@journalId int ,@timeRange nvarchar(50))
as
begin
update  JOURNAL set timeRange=@timeRange
where  journalId=@journalId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateMEMBER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateMEMBER](@memberId int ,@facultyName varchar(50),@memberType nvarchar(50),@userId int,@isActive bit)
as
begin
update  MEMBER set facultyName=@facultyName,memberType=@memberType,userId=@userId,isActive = @isActive
where  memberId=@memberId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateNEWSPAPER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spUpdateNEWSPAPER](@newspaperId int ,@period nvarchar(50))
as
begin
update  NEWSPAPER set period=@period
where  newspaperId=@newspaperId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePUBLISHER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdatePUBLISHER](@publisherId int ,@name varchar(50),@address varchar(200))
as
begin
update  PUBLISHER set name=@name,address=@address
where  publisherId=@publisherId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUSER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdateUSER](@userId int ,@name varchar(50),@gender nvarchar(50),@address nvarchar(50),@password nvarchar(50),@nickname nvarchar(50),@isOnline bit,@mail nvarchar(50))
as
begin
update  [dbo].[USER] set fullName=@name,gender=@gender,address = @address,password=@password,nickName=@nickname,isOnline=@isOnline,mail=@mail 
where  [dbo].[USER].userId=@userId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUserOnline]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateUserOnline](@userId int,@isOnline bit)
as
begin
update  [dbo].[USER] set isOnline=@isOnline
where  [dbo].[USER].userId=@userId
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateVIDEO]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateVIDEO](@videoId int ,@format nvarchar(50))
as
begin
update  VIDEO set format=@format
where  videoId=@videoId
end
GO
/****** Object:  StoredProcedure [dbo].[spUserIdByName]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUserIdByName](@name nvarchar(50))
as
begin
	select u.userId from [USER] u
	where @name = u.nickName
end
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[adminId] [int] IDENTITY(1,1) NOT NULL,
	[workHour] [int] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BILL]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[billId] [int] IDENTITY(1,1) NOT NULL,
	[billValue] [nvarchar](50) NULL,
	[memberId] [int] NULL,
	[itemId] [int] NULL,
	[billDate] [date] NULL,
 CONSTRAINT [PK_BILL] PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK](
	[bookId] [int] IDENTITY(1,1) NOT NULL,
	[author] [nvarchar](50) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK_BOOK] PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BORROW]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BORROW](
	[userId] [int] NOT NULL,
	[itemId] [int] NOT NULL,
	[receiveDate] [DateTime] NULL,
	[returnDate] [DateTime] NULL,
 CONSTRAINT [PK_BORROW] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[shelfNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEM]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[state] [int] NULL,
	[productionDate] [date] NULL,
	[categoryId] [int] NULL,
	[publisherId] [int] NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_ITEM] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JOURNAL]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOURNAL](
	[journalId] [int] IDENTITY(1,1) NOT NULL,
	[timeRange] [nvarchar](50) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK_JOURNAL] PRIMARY KEY CLUSTERED 
(
	[journalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MEMBER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEMBER](
	[memberId] [int] IDENTITY(1,1) NOT NULL,
	[facultyName] [nvarchar](50) NULL,
	[memberType] [nvarchar](50) NULL,
	[userId] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_MEMBER] PRIMARY KEY CLUSTERED 
(
	[memberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NEWSPAPER]    Script Date: 26.12.2014 07:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEWSPAPER](
	[newspaperId] [int] IDENTITY(1,1) NOT NULL,
	[period] [nvarchar](50) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK_NEWSPAPER] PRIMARY KEY CLUSTERED 
(
	[newspaperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PUBLISHER]    Script Date: 26.12.2014 07:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLISHER](
	[publisherId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
 CONSTRAINT [PK_PUBLISHER] PRIMARY KEY CLUSTERED 
(
	[publisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER]    Script Date: 26.12.2014 07:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[nickName] [nvarchar](50) NULL,
	[isOnline] [bit] NULL,
	[mail] [nvarchar](50) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VIDEO]    Script Date: 26.12.2014 07:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIDEO](
	[videoId] [int] IDENTITY(1,1) NOT NULL,
	[format] [nvarchar](50) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK_VIDEO] PRIMARY KEY CLUSTERED 
(
	[videoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_Book]    Script Date: 26.12.2014 07:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[view_Book] as
select b.bookId,b.author,i.* 
from BOOK b, ITEM i
where i.itemId = b.itemId
GO
/****** Object:  View [dbo].[view_Borrow]    Script Date: 26.12.2014 07:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[view_Borrow] as
select b.*,u.fullName,u.gender,u.address,u.password,u.nickName,u.isOnline,u.mail from [BORROW] b,[USER] u,ITEM i
where u.userId = b.userId and b.itemId = i.itemId
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([adminId], [workHour], [userId]) VALUES (3, 5, 7)
INSERT [dbo].[ADMIN] ([adminId], [workHour], [userId]) VALUES (4, 2, 17)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
SET IDENTITY_INSERT [dbo].[BILL] ON 

INSERT [dbo].[BILL] ([billId], [billValue], [memberId], [itemId], [billDate]) VALUES (1, N'0', NULL, NULL, NULL)
INSERT [dbo].[BILL] ([billId], [billValue], [memberId], [itemId], [billDate]) VALUES (2, N'5', 5, 10, CAST(0xB12D0B00 AS Date))
INSERT [dbo].[BILL] ([billId], [billValue], [memberId], [itemId], [billDate]) VALUES (3, N'68', 6, 6, CAST(0x68390B00 AS Date))
INSERT [dbo].[BILL] ([billId], [billValue], [memberId], [itemId], [billDate]) VALUES (4, N'12', 5, 5, CAST(0x68390B00 AS Date))
INSERT [dbo].[BILL] ([billId], [billValue], [memberId], [itemId], [billDate]) VALUES (12, N'20', 7, 7, CAST(0x68390B00 AS Date))
INSERT [dbo].[BILL] ([billId], [billValue], [memberId], [itemId], [billDate]) VALUES (13, N'20', 7, 7, CAST(0x68390B00 AS Date))
SET IDENTITY_INSERT [dbo].[BILL] OFF
SET IDENTITY_INSERT [dbo].[BOOK] ON 

INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (1, N'Agatha Christie', 1)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (2, N'J.K. Rowling', 2)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (3, N'Şener Büyüköztürk', 3)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (4, N'Mesut Taner Genç', 4)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (5, N'Samuel Noah Kramer', 5)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (6, N'Ramazan Ertürk', 6)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (7, N'Charles Dickens', 7)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (8, N'Prof. Dr. Esen Onat', 8)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (9, N'Paul J. Steinhardt', 9)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (10, N'Nesrin Çobanoğlu', 10)
INSERT [dbo].[BOOK] ([bookId], [author], [itemId]) VALUES (11, N'Prof.Dr.Hilmi Pamir', 11)
SET IDENTITY_INSERT [dbo].[BOOK] OFF
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (14, 2, CAST(0x67390B00 AS Date), CAST(0x6F390B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (14, 10, CAST(0xB12D0B00 AS Date), CAST(0xBF2D0B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (14, 18, CAST(0x67390B00 AS Date), CAST(0x6F390B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (15, 2, CAST(0x68390B00 AS Date), CAST(0x70390B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (15, 6, CAST(0x67390B00 AS Date), CAST(0xAD390B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (15, 7, CAST(0x67390B00 AS Date), CAST(0xA1390B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (15, 10, CAST(0x67390B00 AS Date), CAST(0x9A390B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (15, 32, CAST(0x68390B00 AS Date), CAST(0x70390B00 AS Date))
INSERT [dbo].[BORROW] ([userId], [itemId], [receiveDate], [returnDate]) VALUES (16, 9, CAST(0x68390B00 AS Date), CAST(0x77390B00 AS Date))
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 

INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (1, N'Art', N'A1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (2, N'Comedy', N'C')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (3, N'Detective', N'D')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (4, N'Agriculture', N'A1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (5, N'Liberal arts', N'L1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (6, N'History', N'H1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (7, N'Political science', N'P1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (8, N'Romantic', N'R')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (9, N'Science fiction', N'S1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (10, N'Fantastic', N'F')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (11, N'Medicine', N'M1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (12, N'Geography', N'G')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (13, N'Philosophy-Religion', N'P2')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (14, N'Agriculture', N'A3')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (15, N'Law', N'L2')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (16, N'Technology', N'T1')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (17, N'Education', N'E')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (18, N'Music', N'M2')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (19, N'Tension-Horror', N'T2')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (20, N'Humorous', N'H2')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (21, N'Health', N'H3')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (22, N'Social', N'S2')
INSERT [dbo].[CATEGORY] ([categoryId], [name], [shelfNumber]) VALUES (23, N'Sci-Fi', N'S1')
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
SET IDENTITY_INSERT [dbo].[ITEM] ON 

INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (1, N'On Küçük Zenci', 0, CAST(0xD3340B00 AS Date), 1, 1, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (2, N'Harrry Potter ve Sırlar Odası', 1, CAST(0xDA310B00 AS Date), 10, 5, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (3, N'Sosyal Bilimler İçin İstatistik', 0, CAST(0x102B0B00 AS Date), 5, 24, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (4, N'Ateş Hattında', 1, CAST(0xB9330B00 AS Date), 1, 1, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (5, N'Sümerlerin Kurnaz Tanrısı Enki', 1, CAST(0xC72B0B00 AS Date), 12, 7, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (6, N'Varoluşsal Din Felsefesine Giriş', 1, CAST(0xC9350B00 AS Date), 13, 1, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (7, N'İki Şehrin Hikayesi', 1, CAST(0x46160B00 AS Date), 6, 10, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (8, N'Mimarlığa Yolculuk', 0, CAST(0x141B0B00 AS Date), 16, 14, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (9, N'Sonsuz Evren', 1, CAST(0x43190B00 AS Date), 9, 13, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (10, N'Kuramsal ve Uygulamalı Tıp Etiği', 1, CAST(0xA4350B00 AS Date), 11, 18, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (11, N'Fermantasyon Mikrobiyolojisi', 0, CAST(0x6A320B00 AS Date), 14, 2, N'Book')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (15, N'Artam Global Art', 1, CAST(0x742F0B00 AS Date), 1, 21, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (16, N'Blue Jean', 1, CAST(0xFF2E0B00 AS Date), 18, 15, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (17, N'Vogue', 1, CAST(0x1A260B00 AS Date), 20, 17, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (18, N'Psikolojim', 1, CAST(0xFA220B00 AS Date), 21, 4, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (19, N'Chip', 0, CAST(0x242E0B00 AS Date), 16, 16, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (20, N'Penguen', 1, CAST(0x712F0B00 AS Date), 20, 12, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (21, N'Uykusuz', 1, CAST(0x0F240B00 AS Date), 20, 9, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (22, N'Tarih ve Medeniyet', 1, CAST(0x801F0B00 AS Date), 6, 12, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (23, N'Focus', 0, CAST(0x55140B00 AS Date), 1, 1, N'Journal')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (24, N'Akşam', 1, CAST(0x0A1D0B00 AS Date), 22, 6, N'Newspaper')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (25, N'Milliyet', 1, CAST(0xF21E0B00 AS Date), 22, 6, N'Newspaper')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (26, N'Hürriyet', 1, CAST(0x44170B00 AS Date), 22, 6, N'Newspaper')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (27, N'Sabah', 1, CAST(0xCA2C0B00 AS Date), 22, 6, N'Newspaper')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (28, N'Takvim', 1, CAST(0xBA290B00 AS Date), 22, 6, N'Newspaper')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (29, N'Posta', 1, CAST(0x74360B00 AS Date), 22, 6, N'Newspaper')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (32, N'C# Uygumalı Derslerim-I', 1, CAST(0x0A1D0B00 AS Date), 17, 23, N'Video')
INSERT [dbo].[ITEM] ([itemId], [name], [state], [productionDate], [categoryId], [publisherId], [type]) VALUES (36, N'Vitamin', 1, CAST(0x97160B00 AS Date), 16, 23, N'Video')
SET IDENTITY_INSERT [dbo].[ITEM] OFF
SET IDENTITY_INSERT [dbo].[JOURNAL] ON 

INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (1, N'1 month', 15)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (2, N'3 month', 16)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (3, N'6 month', 17)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (4, N'2 month', 18)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (5, N'1 month', 19)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (6, N'4 month', 20)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (7, N'2 month', 21)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (8, N'2 month', 22)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (9, N'3 month', 23)
INSERT [dbo].[JOURNAL] ([journalId], [timeRange], [itemId]) VALUES (10, N'', NULL)
SET IDENTITY_INSERT [dbo].[JOURNAL] OFF
SET IDENTITY_INSERT [dbo].[MEMBER] ON 

INSERT [dbo].[MEMBER] ([memberId], [facultyName], [memberType], [userId], [isActive]) VALUES (2, N'Mühendislik Fakültesi', N'Student', 7, 0)
INSERT [dbo].[MEMBER] ([memberId], [facultyName], [memberType], [userId], [isActive]) VALUES (5, N'Buca Eğitim Fakültesi', N'Instructor', 14, 0)
INSERT [dbo].[MEMBER] ([memberId], [facultyName], [memberType], [userId], [isActive]) VALUES (6, N'Fen Fakültesi', N'Student', 15, 0)
INSERT [dbo].[MEMBER] ([memberId], [facultyName], [memberType], [userId], [isActive]) VALUES (7, N'Mühendislik Fakültesi', N'Student', 16, 1)
SET IDENTITY_INSERT [dbo].[MEMBER] OFF
SET IDENTITY_INSERT [dbo].[NEWSPAPER] ON 

INSERT [dbo].[NEWSPAPER] ([newspaperId], [period], [itemId]) VALUES (1, N'1 month', 24)
INSERT [dbo].[NEWSPAPER] ([newspaperId], [period], [itemId]) VALUES (2, N'2 days', 25)
INSERT [dbo].[NEWSPAPER] ([newspaperId], [period], [itemId]) VALUES (3, N'1 month', 26)
INSERT [dbo].[NEWSPAPER] ([newspaperId], [period], [itemId]) VALUES (4, N'4 weeks', 27)
INSERT [dbo].[NEWSPAPER] ([newspaperId], [period], [itemId]) VALUES (5, N'1 month', 28)
INSERT [dbo].[NEWSPAPER] ([newspaperId], [period], [itemId]) VALUES (6, N'1 day', 29)
SET IDENTITY_INSERT [dbo].[NEWSPAPER] OFF
SET IDENTITY_INSERT [dbo].[PUBLISHER] ON 

INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (1, N'Adalet Publishing', N'www.adalet.jpeg')
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (2, N'Altın Publishing', N'www.artemis.jpeg')
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (3, N'Antik Publishing', N'www.can.jpeg')
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (4, N'Artemis Publishing', N'www.çınar.jpeg')
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (5, N'Başarı Publishing', N'www.dost.jpeg')
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (6, N'Beta Publishing', N'www.epsilon.jpeg')
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (7, N'Bilgi Publishing', N'www.bilgi.com')
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (8, N'Can Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (9, N'Çağlayan Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (10, N'Çatı Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (11, N'Çınar Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (12, N'Düşün Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (13, N'Efil Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (14, N'Esin Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (15, N'Everest Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (16, N'Işık Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (17, N'İlhan Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (18, N'İş Bankası Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (19, N'İz Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (20, N'Kabalcı Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (21, N'Kaknüs Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (22, N'Kırmızı Kedi Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (23, N'Kodlab Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (24, N'Liberte Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (25, N'Maya Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (26, N'Metis Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (27, N'Nesin Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (28, N'Nobel Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (29, N'Ötüken Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (30, N'Palem Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (31, N'Pan Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (32, N'Pegasus Publishing', NULL)
INSERT [dbo].[PUBLISHER] ([publisherId], [name], [address]) VALUES (35, N'Pandora Publishing', N'www.pandora.jpeg')
SET IDENTITY_INSERT [dbo].[PUBLISHER] OFF
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([userId], [fullName], [gender], [address], [password], [nickName], [isOnline], [mail]) VALUES (7, N'Yunus', N'Male', N'Samsun', N'123', N'admin', 1, N'yunus@gmail')
INSERT [dbo].[USER] ([userId], [fullName], [gender], [address], [password], [nickName], [isOnline], [mail]) VALUES (14, N'Emine', N'Male', N'Buca', N'321', N'emine', 0, N'emin@yahoo')
INSERT [dbo].[USER] ([userId], [fullName], [gender], [address], [password], [nickName], [isOnline], [mail]) VALUES (15, N'Sinem', N'Female', N'Buca', N'123', N'sino', 1, N's55@gmail')
INSERT [dbo].[USER] ([userId], [fullName], [gender], [address], [password], [nickName], [isOnline], [mail]) VALUES (16, N'Emre', N'Male', N'Samsun', N'123', N'mrkskn', 1, N'e@gmail')
INSERT [dbo].[USER] ([userId], [fullName], [gender], [address], [password], [nickName], [isOnline], [mail]) VALUES (17, N'Ömer', N'Male', N'İzmir', N'123', N'admin2', 0, N'ömer@gmail')
SET IDENTITY_INSERT [dbo].[USER] OFF
SET IDENTITY_INSERT [dbo].[VIDEO] ON 

INSERT [dbo].[VIDEO] ([videoId], [format], [itemId]) VALUES (1, N'720 hd', 32)
INSERT [dbo].[VIDEO] ([videoId], [format], [itemId]) VALUES (3, N'360 hd', 36)
SET IDENTITY_INSERT [dbo].[VIDEO] OFF
ALTER TABLE [dbo].[ADMIN]  WITH CHECK ADD  CONSTRAINT [FK_ADMIN_USER] FOREIGN KEY([userId])
REFERENCES [dbo].[USER] ([userId])
GO
ALTER TABLE [dbo].[ADMIN] CHECK CONSTRAINT [FK_ADMIN_USER]
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD  CONSTRAINT [FK_BILL_MEMBER] FOREIGN KEY([memberId])
REFERENCES [dbo].[MEMBER] ([memberId])
GO
ALTER TABLE [dbo].[BILL] CHECK CONSTRAINT [FK_BILL_MEMBER]
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_ITEM] FOREIGN KEY([itemId])
REFERENCES [dbo].[ITEM] ([itemId])
GO
ALTER TABLE [dbo].[BOOK] CHECK CONSTRAINT [FK_BOOK_ITEM]
GO
ALTER TABLE [dbo].[BORROW]  WITH CHECK ADD  CONSTRAINT [FK_BORROW_ITEM] FOREIGN KEY([itemId])
REFERENCES [dbo].[ITEM] ([itemId])
GO
ALTER TABLE [dbo].[BORROW] CHECK CONSTRAINT [FK_BORROW_ITEM]
GO
ALTER TABLE [dbo].[BORROW]  WITH CHECK ADD  CONSTRAINT [FK_BORROW_USER] FOREIGN KEY([userId])
REFERENCES [dbo].[USER] ([userId])
GO
ALTER TABLE [dbo].[BORROW] CHECK CONSTRAINT [FK_BORROW_USER]
GO
ALTER TABLE [dbo].[ITEM]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_CATEGORY] FOREIGN KEY([categoryId])
REFERENCES [dbo].[CATEGORY] ([categoryId])
GO
ALTER TABLE [dbo].[ITEM] CHECK CONSTRAINT [FK_ITEM_CATEGORY]
GO
ALTER TABLE [dbo].[ITEM]  WITH CHECK ADD  CONSTRAINT [FK_ITEM_PUBLISHER] FOREIGN KEY([publisherId])
REFERENCES [dbo].[PUBLISHER] ([publisherId])
GO
ALTER TABLE [dbo].[ITEM] CHECK CONSTRAINT [FK_ITEM_PUBLISHER]
GO
ALTER TABLE [dbo].[JOURNAL]  WITH CHECK ADD  CONSTRAINT [FK_JOURNAL_ITEM] FOREIGN KEY([itemId])
REFERENCES [dbo].[ITEM] ([itemId])
GO
ALTER TABLE [dbo].[JOURNAL] CHECK CONSTRAINT [FK_JOURNAL_ITEM]
GO
ALTER TABLE [dbo].[MEMBER]  WITH CHECK ADD  CONSTRAINT [FK_MEMBER_USER] FOREIGN KEY([userId])
REFERENCES [dbo].[USER] ([userId])
GO
ALTER TABLE [dbo].[MEMBER] CHECK CONSTRAINT [FK_MEMBER_USER]
GO
ALTER TABLE [dbo].[NEWSPAPER]  WITH CHECK ADD  CONSTRAINT [FK_NEWSPAPER_ITEM] FOREIGN KEY([itemId])
REFERENCES [dbo].[ITEM] ([itemId])
GO
ALTER TABLE [dbo].[NEWSPAPER] CHECK CONSTRAINT [FK_NEWSPAPER_ITEM]
GO
ALTER TABLE [dbo].[VIDEO]  WITH CHECK ADD  CONSTRAINT [FK_VIDEO_ITEM] FOREIGN KEY([itemId])
REFERENCES [dbo].[ITEM] ([itemId])
GO
ALTER TABLE [dbo].[VIDEO] CHECK CONSTRAINT [FK_VIDEO_ITEM]
GO
USE [master]
GO
ALTER DATABASE [DBLibrary] SET  READ_WRITE 
GO
