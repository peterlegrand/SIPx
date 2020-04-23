USE [master]
GO
/****** Object:  Database [sip]    Script Date: 4/23/2020 5:43:43 PM ******/
CREATE DATABASE [sip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sip', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sip_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sip] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sip] SET ARITHABORT OFF 
GO
ALTER DATABASE [sip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sip] SET RECOVERY FULL 
GO
ALTER DATABASE [sip] SET  MULTI_USER 
GO
ALTER DATABASE [sip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sip] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'sip', N'ON'
GO
ALTER DATABASE [sip] SET QUERY_STORE = OFF
GO
USE [sip]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[LastName] [nchar](50) NOT NULL,
	[FullName] [nchar](50) NOT NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationLanguages](
	[ClassificationLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationLevelLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationLevelLanguages](
	[ClassificationLevelLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationLevelID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationLevelLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationLevelLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationLevels]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationLevels](
	[ClassificationLevelID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[DateLevelID] [int] NOT NULL,
	[OnTheFly] [bit] NOT NULL,
	[Alphabetically] [bit] NOT NULL,
	[CanLink] [bit] NOT NULL,
	[InDropDown] [bit] NOT NULL,
	[InMenu] [bit] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationLevels] PRIMARY KEY CLUSTERED 
(
	[ClassificationLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationPageLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationPageLanguages](
	[ClassificationPageLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationPageID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
	[TitleDescription] [nvarchar](max) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationPageLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationPageLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationPages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationPages](
	[ClassificationPageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[ShowTitleName] [bit] NOT NULL,
	[ShowTitleDescription] [bit] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationPages] PRIMARY KEY CLUSTERED 
(
	[ClassificationPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationPageSectionLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationPageSectionLanguages](
	[ClassificationPageSectionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationPageSectionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
	[TitleDescription] [nvarchar](max) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationPageSectionLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationPageSectionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationPageSections]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationPageSections](
	[ClassificationPageSectionID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationPageID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[PageSectionTypeID] [int] NOT NULL,
	[ShowSectionTitleName] [bit] NOT NULL,
	[ShowSectionTitleDescription] [bit] NOT NULL,
	[ShowContentTypeTitleName] [bit] NOT NULL,
	[ShowContentTypeTitleDescription] [bit] NOT NULL,
	[OneTwoColumns] [int] NOT NULL,
	[ContentTypeID] [int] NULL,
	[SortByID] [int] NOT NULL,
	[MaxContent] [int] NOT NULL,
	[HasPaging] [bit] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationPageSections] PRIMARY KEY CLUSTERED 
(
	[ClassificationPageSectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classifications]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifications](
	[ClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DefaultPageID] [int] NULL,
	[HasDropDown] [bit] NOT NULL,
	[DropDownSequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Classifications] PRIMARY KEY CLUSTERED 
(
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationValueLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationValueLanguages](
	[ClassificationValueLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[DropDownName] [nvarchar](50) NOT NULL,
	[PageName] [nvarchar](50) NOT NULL,
	[PageDescription] [nvarchar](max) NOT NULL,
	[HeaderName] [nvarchar](50) NOT NULL,
	[HeaderDescription] [nvarchar](max) NOT NULL,
	[TopicName] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValueLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassificationValues]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassificationValues](
	[ClassificationValueID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ParentValueID] [int] NULL,
	[DateFrom] [datetimeoffset](7) NULL,
	[DateTo] [datetimeoffset](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValues] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeID] [int] NOT NULL,
	[ContentStatusID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SecurityLevelID] [int] NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[ProjectID] [int] NULL,
	[CreatorID] [nvarchar](450) NULL,
	[ModifierID] [nvarchar](450) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ProcessID] [int] NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentStatuses]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentStatuses](
	[ContentStatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ContentStatuses] PRIMARY KEY CLUSTERED 
(
	[ContentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentStatusLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentStatusLanguages](
	[ContentStatusLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ContentStatusID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ContentStatusLanguages] PRIMARY KEY CLUSTERED 
(
	[ContentStatusLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypeClassifications]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypeClassifications](
	[ContentTypeClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ContentTypeClassificationStatusID] [int] NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeClassifications] PRIMARY KEY CLUSTERED 
(
	[ContentTypeClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypeClassificationStatuses]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypeClassificationStatuses](
	[ContentTypeClassificationStatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ContentTypeClassificationStatus] PRIMARY KEY CLUSTERED 
(
	[ContentTypeClassificationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypeClassificationStatusLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypeClassificationStatusLanguages](
	[ContentTypeClassificationStatusLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeClassificationStatusID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTypeClassificationStatusLanguages] PRIMARY KEY CLUSTERED 
(
	[ContentTypeClassificationStatusLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypeGroupLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypeGroupLanguages](
	[ContentTypeGroupLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeGroupID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeGroupLanguages] PRIMARY KEY CLUSTERED 
(
	[ContentTypeGroupLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypeGroups]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypeGroups](
	[ContentTypeGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeGroups] PRIMARY KEY CLUSTERED 
(
	[ContentTypeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypeLanguages](
	[ContentTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ContentTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTypes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTypes](
	[ContentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeGroupID] [int] NOT NULL,
	[ProcessTemplateID] [int] NULL,
	[SecurityLevelID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED 
(
	[ContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[ForeignName] [nvarchar](100) NOT NULL,
	[ISO31662] [char](2) NOT NULL,
	[ISO31663] [char](3) NOT NULL,
	[ISO3166Num] [int] NOT NULL,
	[SubRegionID] [int] NULL,
	[IntermediateRegionID] [int] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryLanguages](
	[CountryLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CountryLanguages] PRIMARY KEY CLUSTERED 
(
	[CountryLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateLevelLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateLevelLanguages](
	[DateLevelLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[DateLevelID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DateLevelLanguages] PRIMARY KEY CLUSTERED 
(
	[DateLevelLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateLevels]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateLevels](
	[DateLevelID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DateLevels] PRIMARY KEY CLUSTERED 
(
	[DateLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntermediateRegions]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntermediateRegions](
	[IntermediateRegionID] [int] NOT NULL,
	[SubRegionID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IntermediateRegions] PRIMARY KEY CLUSTERED 
(
	[IntermediateRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](50) NOT NULL,
	[ForeignName] [nvarchar](max) NOT NULL,
	[ISO6391] [char](2) NOT NULL,
	[ISO6392] [char](3) NOT NULL,
	[StatusID] [int] NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeftMenuLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeftMenuLanguages](
	[LeftMenuLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LeftMenuID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MenuMouseOver] [nvarchar](50) NOT NULL,
	[AddName] [nvarchar](50) NOT NULL,
	[AddMouseOver] [nvarchar](50) NOT NULL,
	[SearchName] [nvarchar](50) NOT NULL,
	[SearchMouseOver] [nvarchar](50) NOT NULL,
	[AdvancedSearchName] [nvarchar](50) NOT NULL,
	[AdvancedSearchMouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LeftMenuLanguages] PRIMARY KEY CLUSTERED 
(
	[LeftMenuLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeftMenus]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeftMenus](
	[LeftMenuID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HasMenu] [bit] NOT NULL,
	[MenuController] [nvarchar](50) NULL,
	[MenuAction] [nvarchar](50) NULL,
	[MenuImageName] [nvarchar](50) NULL,
	[HasAdd] [bit] NOT NULL,
	[AddController] [nvarchar](50) NULL,
	[AddAction] [nvarchar](50) NULL,
	[AddImageName] [nvarchar](50) NULL,
	[HasSearch] [bit] NOT NULL,
	[SearchController] [nvarchar](50) NULL,
	[SearchAction] [nvarchar](50) NULL,
	[SearchImageName] [nvarchar](50) NULL,
	[HasAdvancedSearch] [bit] NOT NULL,
	[AdvancedSearchController] [nvarchar](50) NULL,
	[AdvancedSearchAction] [nvarchar](50) NULL,
	[AdvancedSearchImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_LeftMenus] PRIMARY KEY CLUSTERED 
(
	[LeftMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeftMenuUsers]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeftMenuUsers](
	[LeftMenuUserID] [int] IDENTITY(1,1) NOT NULL,
	[LeftMenuID] [int] NOT NULL,
	[MenuShow] [bit] NOT NULL,
	[MenuAddShow] [bit] NOT NULL,
	[SearchShow] [bit] NOT NULL,
	[AdvancedSearchShow] [bit] NOT NULL,
	[Menu] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[MenuName] [nvarchar](50) NULL,
	[MouseOver] [nvarchar](50) NULL,
	[MenuURL] [nvarchar](max) NULL,
	[Sequence] [int] NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_LeftMenuUsers] PRIMARY KEY CLUSTERED 
(
	[LeftMenuUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu1OptionLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu1OptionLanguages](
	[Menu1OptionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Menu1OptionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu1OptionLanguages] PRIMARY KEY CLUSTERED 
(
	[Menu1OptionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu1Options]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu1Options](
	[Menu1OptionID] [int] IDENTITY(1,1) NOT NULL,
	[MenuTypeID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ClassificationID] [int] NULL,
	[FeatureID] [int] NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[DestinationID] [int] NULL,
	[CreatorID] [nvarchar](450) NULL,
	[ModifierID] [nvarchar](450) NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu1Options] PRIMARY KEY CLUSTERED 
(
	[Menu1OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu2OptionLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu2OptionLanguages](
	[Menu2OptionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Menu2OptionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu2OptionLanguages] PRIMARY KEY CLUSTERED 
(
	[Menu2OptionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu2Options]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu2Options](
	[Menu2OptionID] [int] IDENTITY(1,1) NOT NULL,
	[Menu1OptionID] [int] NOT NULL,
	[MenuTypeID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ClassificationID] [int] NULL,
	[FeatureId] [int] NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[DestinationId] [int] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu2Options] PRIMARY KEY CLUSTERED 
(
	[Menu2OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu3OptionLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu3OptionLanguages](
	[Menu3OptionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Menu3OptionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu3OptionLanguages] PRIMARY KEY CLUSTERED 
(
	[Menu3OptionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu3Options]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu3Options](
	[Menu3OptionID] [int] IDENTITY(1,1) NOT NULL,
	[Menu2OptionID] [int] NOT NULL,
	[MenuTypeID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[FeatureID] [int] NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[DestinationId] [int] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu3Options] PRIMARY KEY CLUSTERED 
(
	[Menu3OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuTypeLanguages](
	[MenuTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[MenuTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MenuTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[MenuTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuTypes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuTypes](
	[MenuTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_MenuTypes] PRIMARY KEY CLUSTERED 
(
	[MenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationLanguages](
	[OrganizationLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationLanguages] PRIMARY KEY CLUSTERED 
(
	[OrganizationLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[ParentOrganizationID] [int] NULL,
	[StatusID] [int] NOT NULL,
	[OrganizationTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationTypeLanguages](
	[OrganizationTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationTypes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationTypes](
	[OrganizationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypes] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageLanguages](
	[PageLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
	[TitleDescription] [nvarchar](max) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageLanguages] PRIMARY KEY CLUSTERED 
(
	[PageLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[ShowTitleName] [bit] NOT NULL,
	[ShowTitleDescription] [bit] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageSectionLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageSectionLanguages](
	[PageSectionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
	[TitleDescription] [nvarchar](max) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageSections]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageSections](
	[PageSectionID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[PageSectionTypeID] [int] NOT NULL,
	[ShowSectionTitleName] [bit] NOT NULL,
	[ShowSectionTitleDescription] [bit] NOT NULL,
	[ShowContentTypeTitleName] [bit] NOT NULL,
	[ShowContentTypeTitleDescription] [bit] NOT NULL,
	[OneTwoColumns] [int] NOT NULL,
	[ContentTypeID] [int] NULL,
	[SortByID] [int] NOT NULL,
	[MaxContent] [int] NOT NULL,
	[HasPaging] [bit] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSections] PRIMARY KEY CLUSTERED 
(
	[PageSectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageSectionTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageSectionTypeLanguages](
	[PageSectionTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClassificationPageSectionTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageSectionTypes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageSectionTypes](
	[PageSectionTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PageSectionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processes](
	[ProcessID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[StepID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ContentID] [int] NULL,
	[ProcessMultiID] [int] NULL,
 CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED 
(
	[ProcessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessFields]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessFields](
	[ProcessFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[StringValue] [nvarchar](max) NULL,
	[IntValue] [int] NULL,
	[DateTimeValue] [datetime2](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessFields] PRIMARY KEY CLUSTERED 
(
	[ProcessFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessMultis]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessMultis](
	[ProcessMultiID] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessMultis] PRIMARY KEY CLUSTERED 
(
	[ProcessMultiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFieldLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFieldLanguages](
	[ProcessTemplateFieldLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFields]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFields](
	[ProcessTemplateFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFieldTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DbProcessTemplateField] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFieldTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFieldTypeLanguages](
	[ProcessTemplateFieldTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFieldTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DbProcessTemplateFieldTypeLanguage] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFieldTypes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFieldTypes](
	[ProcessTemplateFieldTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFlowConditionLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFlowConditionLanguages](
	[ProcessTemplateFlowConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFlowConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowConditionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFlowConditions]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFlowConditions](
	[ProcessTemplateFlowConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFlowID] [int] NOT NULL,
	[ProcessTemplateConditionTypeID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NULL,
	[ComparisonOperatorID] [int] NULL,
	[DataTypeID] [int] NULL,
	[ProcessTemplateFlowConditionString] [nvarchar](max) NULL,
	[ProcessTemplateFlowConditionInt] [int] NULL,
	[ProcessTemplateFlowConditionDate] [datetime2](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowConditions] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFlowConditionTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages](
	[ProcessTemplateFlowConditionTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFlowTypeConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowConditionTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowConditionTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFlowConditionTypes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFlowConditionTypes](
	[ProcessTemplateFlowConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowConditionTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFlowLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFlowLanguages](
	[ProcessTemplateFlowLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFlowID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateFlows]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateFlows](
	[ProcessTemplateFlowID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFromStepID] [int] NOT NULL,
	[ProcessTemplateToStepID] [int] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlows] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateGroupLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateGroupLanguages](
	[ProcessTemplateGroupLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateGroupID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateGroupLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateGroupLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateGroups]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateGroups](
	[ProcessTemplateGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateGroups] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateLanguages](
	[ProcessTemplateLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplates]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplates](
	[ProcessTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateGroupID] [int] NOT NULL,
	[ShowInPersonalCalendar] [bit] NOT NULL,
	[ShowInEventCalendar] [bit] NOT NULL,
	[ProcessMultiMax] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplates] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateStepFields]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateStepFields](
	[ProcessTemplateStepFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStepID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[ProcessTemplateStepFieldStatusID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStepFields] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStepFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateStepFieldStatuses]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateStepFieldStatuses](
	[ProcessTemplateStepFieldStatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStepFieldStatuses] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStepFieldStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateStepFieldStatusLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages](
	[ProcessTemplateStepFieldStatusLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStepFieldStatusID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStepFieldStatusLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStepFieldStatusLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateStepLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateStepLanguages](
	[ProcessTemplateStepLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStepID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStepLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStepLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateSteps]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateSteps](
	[ProcessTemplateStepID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateStepTypeID] [int] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateSteps] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateStepTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateStepTypeLanguages](
	[ProcessTemplateStepTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStepTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStepTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStepTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessTemplateStepTypes]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessTemplateStepTypes](
	[ProcessTemplateStepTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStepTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStepTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectLanguages](
	[ProjectLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ParentProjectID] [int] NULL,
	[StatusID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[RegionID] [int] NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityLevelLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityLevelLanguages](
	[SecurityLevelLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityLevelID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SecurityLevelLanguages] PRIMARY KEY CLUSTERED 
(
	[SecurityLevelLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityLevels]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityLevels](
	[SecurityLevelID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SecurityLevels] PRIMARY KEY CLUSTERED 
(
	[SecurityLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SettingLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettingLanguages](
	[SettingLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[SettingID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SettingLanguages] PRIMARY KEY CLUSTERED 
(
	[SettingLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[IntValue] [int] NULL,
	[StringValue] [nvarchar](max) NULL,
	[DateTimeValue] [datetime2](7) NULL,
	[GuidValue] [uniqueidentifier] NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SortByLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SortByLanguages](
	[SortByLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[SortByID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SortByLanguages] PRIMARY KEY CLUSTERED 
(
	[SortByLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SortBys]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SortBys](
	[SortByID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SortBys] PRIMARY KEY CLUSTERED 
(
	[SortByID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusLanguages](
	[StatusLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusLanguages] PRIMARY KEY CLUSTERED 
(
	[StatusLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubRegions]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRegions](
	[SubRegionID] [int] NOT NULL,
	[RegionID] [int] NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_SubRegions] PRIMARY KEY CLUSTERED 
(
	[SubRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ClassificationLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLanguages] ON [dbo].[ClassificationLanguages]
(
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ClassificationLevelLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLevelLanguages] ON [dbo].[ClassificationLevelLanguages]
(
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ClassificationPageLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationPageLanguages] ON [dbo].[ClassificationPageLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ClassificationPageSectionLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationPageSectionLanguages] ON [dbo].[ClassificationPageSectionLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContentStatusLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentStatusLanguages] ON [dbo].[ContentStatusLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContentTypeClassificationStatusLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypeClassificationStatusLanguages] ON [dbo].[ContentTypeClassificationStatusLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContentTypeGroupLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypeGroupLanguages] ON [dbo].[ContentTypeGroupLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContentTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypeLanguages] ON [dbo].[ContentTypeLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DbLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DbLanguages] ON [dbo].[Languages]
(
	[LanguageName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PageSectionTypeLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_PageSectionTypeLanguages] ON [dbo].[PageSectionTypeLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SortByLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_SortByLanguages] ON [dbo].[SortByLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StatusLanguages]    Script Date: 4/23/2020 5:43:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StatusLanguages] ON [dbo].[StatusLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_LanguageID]  DEFAULT ((1)) FOR [LanguageID]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_FirstName]  DEFAULT (N'a') FOR [FirstName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_LastName]  DEFAULT (N'a') FOR [LastName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_FullName]  DEFAULT (N'a') FOR [FullName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreatorID]  DEFAULT (N'a') FOR [CreatorID]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_ModifierID]  DEFAULT (N'a') FOR [ModifierID]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_ClassificationLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_ClassificationLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbClassificationLanguage_DbClassification] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])
GO
ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_DbClassificationLanguage_DbClassification]
GO
ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbClassificationLanguage_DbLanguage] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_DbClassificationLanguage_DbLanguage]
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguage_ClassificationLevel] FOREIGN KEY([ClassificationLevelID])
REFERENCES [dbo].[ClassificationLevels] ([ClassificationLevelID])
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguage_ClassificationLevel]
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguage_Language]
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevel_Classification] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])
GO
ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevel_Classification]
GO
ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_AspNetUsers2] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_AspNetUsers2]
GO
ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_DateLevels] FOREIGN KEY([DateLevelID])
REFERENCES [dbo].[DateLevels] ([DateLevelID])
GO
ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_DateLevels]
GO
ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguage_ClassificationPage] FOREIGN KEY([ClassificationPageID])
REFERENCES [dbo].[ClassificationPages] ([ClassificationPageID])
GO
ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguage_ClassificationPage]
GO
ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguage_Language]
GO
ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPage_Classification] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])
GO
ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPage_Classification]
GO
ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPage_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPage_Status]
GO
ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPages_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguage_ClassificationPageSection] FOREIGN KEY([ClassificationPageSectionID])
REFERENCES [dbo].[ClassificationPageSections] ([ClassificationPageSectionID])
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguage_ClassificationPageSection]
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguage_Language]
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSection_ClassificationPage] FOREIGN KEY([ClassificationPageID])
REFERENCES [dbo].[ClassificationPages] ([ClassificationPageID])
GO
ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSection_ClassificationPage]
GO
ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])
GO
ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_PageSectionTypes]
GO
ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])
GO
ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_SortBys]
GO
ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers]
GO
ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers1]
GO
ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers2]
GO
ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers3]
GO
ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers4] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers4]
GO
ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_DbClassification_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_DbClassification_DbStatus]
GO
ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_ClassificationValues] FOREIGN KEY([ClassificationValueID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID])
GO
ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_ClassificationValues]
GO
ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_Languages]
GO
ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers]
GO
ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers1]
GO
ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])
GO
ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_Classifications]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_AspNetUsers]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_AspNetUsers1]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentStatuses] FOREIGN KEY([ContentStatusID])
REFERENCES [dbo].[ContentStatuses] ([ContentStatusID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_ContentStatuses]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_ContentTypes]
GO
ALTER TABLE [dbo].[ContentStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentStatusLanguages_ContentStatuses] FOREIGN KEY([ContentStatusID])
REFERENCES [dbo].[ContentStatuses] ([ContentStatusID])
GO
ALTER TABLE [dbo].[ContentStatusLanguages] CHECK CONSTRAINT [FK_ContentStatusLanguages_ContentStatuses]
GO
ALTER TABLE [dbo].[ContentStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentStatusLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ContentStatusLanguages] CHECK CONSTRAINT [FK_ContentStatusLanguages_Languages]
GO
ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_AspNetUsers]
GO
ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])
GO
ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_Classifications]
GO
ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_ContentTypeClassificationStatuses] FOREIGN KEY([ContentTypeClassificationStatusID])
REFERENCES [dbo].[ContentTypeClassificationStatuses] ([ContentTypeClassificationStatusID])
GO
ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_ContentTypeClassificationStatuses]
GO
ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_ContentTypes]
GO
ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_ContentTypeClassificationStatuses] FOREIGN KEY([ContentTypeClassificationStatusID])
REFERENCES [dbo].[ContentTypeClassificationStatuses] ([ContentTypeClassificationStatusID])
GO
ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages] CHECK CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_ContentTypeClassificationStatuses]
GO
ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages] CHECK CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_Languages]
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_ContentTypeGroups] FOREIGN KEY([ContentTypeGroupID])
REFERENCES [dbo].[ContentTypeGroups] ([ContentTypeGroupID])
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_ContentTypeGroups]
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_Languages]
GO
ALTER TABLE [dbo].[ContentTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroups_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypeGroups] CHECK CONSTRAINT [FK_ContentTypeGroups_AspNetUsers]
GO
ALTER TABLE [dbo].[ContentTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroups_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypeGroups] CHECK CONSTRAINT [FK_ContentTypeGroups_AspNetUsers1]
GO
ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])
GO
ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_ContentTypes]
GO
ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_Languages]
GO
ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_AspNetUsers]
GO
ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_AspNetUsers1]
GO
ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_ContentTypeGroups] FOREIGN KEY([ContentTypeGroupID])
REFERENCES [dbo].[ContentTypeGroups] ([ContentTypeGroupID])
GO
ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_ContentTypeGroups]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_IntermediateRegions] FOREIGN KEY([IntermediateRegionID])
REFERENCES [dbo].[IntermediateRegions] ([IntermediateRegionID])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_IntermediateRegions]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_SubRegions] FOREIGN KEY([SubRegionID])
REFERENCES [dbo].[SubRegions] ([SubRegionID])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_SubRegions]
GO
ALTER TABLE [dbo].[CountryLanguages]  WITH CHECK ADD  CONSTRAINT [FK_CountryLanguages_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[CountryLanguages] CHECK CONSTRAINT [FK_CountryLanguages_Countries]
GO
ALTER TABLE [dbo].[CountryLanguages]  WITH CHECK ADD  CONSTRAINT [FK_CountryLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[CountryLanguages] CHECK CONSTRAINT [FK_CountryLanguages_Languages]
GO
ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_DbLanguage_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_DbLanguage_DbStatus]
GO
ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_Languages_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_Languages_AspNetUsers]
GO
ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_Languages]
GO
ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_Menu1Options] FOREIGN KEY([Menu1OptionID])
REFERENCES [dbo].[Menu1Options] ([Menu1OptionID])
GO
ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_Menu1Options]
GO
ALTER TABLE [dbo].[Menu1Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu1Options] CHECK CONSTRAINT [FK_Menu1Options_AspNetUsers]
GO
ALTER TABLE [dbo].[Menu1Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu1Options] CHECK CONSTRAINT [FK_Menu1Options_AspNetUsers1]
GO
ALTER TABLE [dbo].[Menu1Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])
GO
ALTER TABLE [dbo].[Menu1Options] CHECK CONSTRAINT [FK_Menu1Options_MenuTypes]
GO
ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_Languages]
GO
ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_Menu2Options] FOREIGN KEY([Menu2OptionID])
REFERENCES [dbo].[Menu2Options] ([Menu2OptionID])
GO
ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_Menu2Options]
GO
ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_AspNetUsers]
GO
ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_AspNetUsers1]
GO
ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_Menu1Options] FOREIGN KEY([Menu1OptionID])
REFERENCES [dbo].[Menu1Options] ([Menu1OptionID])
GO
ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_Menu1Options]
GO
ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])
GO
ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_MenuTypes]
GO
ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_Languages]
GO
ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_Menu3Options] FOREIGN KEY([Menu3OptionID])
REFERENCES [dbo].[Menu3Options] ([Menu3OptionID])
GO
ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_Menu3Options]
GO
ALTER TABLE [dbo].[Menu3Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu3Options] CHECK CONSTRAINT [FK_Menu3Options_AspNetUsers]
GO
ALTER TABLE [dbo].[Menu3Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Menu3Options] CHECK CONSTRAINT [FK_Menu3Options_AspNetUsers1]
GO
ALTER TABLE [dbo].[Menu3Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_Menu2Options] FOREIGN KEY([Menu2OptionID])
REFERENCES [dbo].[Menu2Options] ([Menu2OptionID])
GO
ALTER TABLE [dbo].[Menu3Options] CHECK CONSTRAINT [FK_Menu3Options_Menu2Options]
GO
ALTER TABLE [dbo].[MenuTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MenuTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[MenuTypeLanguages] CHECK CONSTRAINT [FK_MenuTypeLanguages_Languages]
GO
ALTER TABLE [dbo].[MenuTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MenuTypeLanguages_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])
GO
ALTER TABLE [dbo].[MenuTypeLanguages] CHECK CONSTRAINT [FK_MenuTypeLanguages_MenuTypes]
GO
ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_Languages]
GO
ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])
GO
ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_Organizations]
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_AspNetUsers]
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_AspNetUsers1]
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_OrganizationTypes]
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_Statuses]
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_Languages]
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])
GO
ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes]
GO
ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_AspNetUsers]
GO
ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_AspNetUsers1]
GO
ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_Languages]
GO
ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])
GO
ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_Pages]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_AspNetUsers]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_AspNetUsers1]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Statuses]
GO
ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_Languages]
GO
ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_PageSections] FOREIGN KEY([PageSectionID])
REFERENCES [dbo].[PageSections] ([PageSectionID])
GO
ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_PageSections]
GO
ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_AspNetUsers]
GO
ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_AspNetUsers1]
GO
ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])
GO
ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_Pages]
GO
ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])
GO
ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_PageSectionTypes]
GO
ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])
GO
ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_SortBys]
GO
ALTER TABLE [dbo].[PageSectionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[PageSectionTypeLanguages] CHECK CONSTRAINT [FK_PageSectionTypeLanguages_Languages]
GO
ALTER TABLE [dbo].[PageSectionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypeLanguages_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])
GO
ALTER TABLE [dbo].[PageSectionTypeLanguages] CHECK CONSTRAINT [FK_PageSectionTypeLanguages_PageSectionTypes]
GO
ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_AspNetUsers]
GO
ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_AspNetUsers1]
GO
ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])
GO
ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_ProcessTemplates]
GO
ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_Processes] FOREIGN KEY([ProcessID])
REFERENCES [dbo].[Processes] ([ProcessID])
GO
ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_Processes]
GO
ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_ProcessTemplateFields] FOREIGN KEY([ProcessTemplateFieldID])
REFERENCES [dbo].[ProcessTemplateFields] ([ProcessTemplateFieldID])
GO
ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_ProcessTemplateFields]
GO
ALTER TABLE [dbo].[ProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ProcessMultis_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessMultis] CHECK CONSTRAINT [FK_ProcessMultis_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ProcessMultis_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessMultis] CHECK CONSTRAINT [FK_ProcessMultis_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_ProcessTemplateFields] FOREIGN KEY([ProcessTemplateFieldID])
REFERENCES [dbo].[ProcessTemplateFields] ([ProcessTemplateFieldID])
GO
ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_ProcessTemplateFields]
GO
ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplateFieldTypes] FOREIGN KEY([ProcessTemplateFieldTypeID])
REFERENCES [dbo].[ProcessTemplateFieldTypes] ([ProcessTemplateFieldTypeID])
GO
ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplateFieldTypes]
GO
ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])
GO
ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplates]
GO
ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_ProcessTemplateFieldTypes] FOREIGN KEY([ProcessTemplateFieldTypeID])
REFERENCES [dbo].[ProcessTemplateFieldTypes] ([ProcessTemplateFieldTypeID])
GO
ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_ProcessTemplateFieldTypes]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_ProcessTemplateFlowConditions] FOREIGN KEY([ProcessTemplateFlowConditionID])
REFERENCES [dbo].[ProcessTemplateFlowConditions] ([ProcessTemplateFlowConditionID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_ProcessTemplateFlowConditions]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlowConditionTypes] FOREIGN KEY([ProcessTemplateConditionTypeID])
REFERENCES [dbo].[ProcessTemplateFlowConditionTypes] ([ProcessTemplateFlowConditionTypeID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlowConditionTypes]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlows] FOREIGN KEY([ProcessTemplateFlowID])
REFERENCES [dbo].[ProcessTemplateFlows] ([ProcessTemplateFlowID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlows]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_ProcessTemplateFlowConditionTypes] FOREIGN KEY([ProcessTemplateFlowTypeConditionID])
REFERENCES [dbo].[ProcessTemplateFlowConditionTypes] ([ProcessTemplateFlowConditionTypeID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_ProcessTemplateFlowConditionTypes]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_ProcessTemplateFlows] FOREIGN KEY([ProcessTemplateFlowID])
REFERENCES [dbo].[ProcessTemplateFlows] ([ProcessTemplateFlowID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_ProcessTemplateFlows]
GO
ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplates]
GO
ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateSteps] FOREIGN KEY([ProcessTemplateFromStepID])
REFERENCES [dbo].[ProcessTemplateSteps] ([ProcessTemplateStepID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateSteps]
GO
ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateSteps1] FOREIGN KEY([ProcessTemplateToStepID])
REFERENCES [dbo].[ProcessTemplateSteps] ([ProcessTemplateStepID])
GO
ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateSteps1]
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_ProcessTemplateGroups] FOREIGN KEY([ProcessTemplateGroupID])
REFERENCES [dbo].[ProcessTemplateGroups] ([ProcessTemplateGroupID])
GO
ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_ProcessTemplateGroups]
GO
ALTER TABLE [dbo].[ProcessTemplateGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateGroups] CHECK CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateGroups] CHECK CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])
GO
ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_ProcessTemplates]
GO
ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_ProcessTemplateGroups] FOREIGN KEY([ProcessTemplateGroupID])
REFERENCES [dbo].[ProcessTemplateGroups] ([ProcessTemplateGroupID])
GO
ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_ProcessTemplateGroups]
GO
ALTER TABLE [dbo].[ProcessTemplateStepFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepFields_ProcessTemplateStepFieldStatuses] FOREIGN KEY([ProcessTemplateStepFieldStatusID])
REFERENCES [dbo].[ProcessTemplateStepFieldStatuses] ([ProcessTemplateStepFieldStatusID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepFields] CHECK CONSTRAINT [FK_ProcessTemplateStepFields_ProcessTemplateStepFieldStatuses]
GO
ALTER TABLE [dbo].[ProcessTemplateStepFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepFields_ProcessTemplateSteps] FOREIGN KEY([ProcessTemplateStepID])
REFERENCES [dbo].[ProcessTemplateSteps] ([ProcessTemplateStepID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepFields] CHECK CONSTRAINT [FK_ProcessTemplateStepFields_ProcessTemplateSteps]
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_ProcessTemplateStepFieldStatuses] FOREIGN KEY([ProcessTemplateStepFieldStatusID])
REFERENCES [dbo].[ProcessTemplateStepFieldStatuses] ([ProcessTemplateStepFieldStatusID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepFieldStatusLanguages_ProcessTemplateStepFieldStatuses]
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepLanguages_ProcessTemplateSteps] FOREIGN KEY([ProcessTemplateStepID])
REFERENCES [dbo].[ProcessTemplateSteps] ([ProcessTemplateStepID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepLanguages_ProcessTemplateSteps]
GO
ALTER TABLE [dbo].[ProcessTemplateSteps]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateSteps_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])
GO
ALTER TABLE [dbo].[ProcessTemplateSteps] CHECK CONSTRAINT [FK_ProcessTemplateSteps_ProcessTemplates]
GO
ALTER TABLE [dbo].[ProcessTemplateSteps]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateSteps_ProcessTemplateStepTypes] FOREIGN KEY([ProcessTemplateStepTypeID])
REFERENCES [dbo].[ProcessTemplateStepTypes] ([ProcessTemplateStepTypeID])
GO
ALTER TABLE [dbo].[ProcessTemplateSteps] CHECK CONSTRAINT [FK_ProcessTemplateSteps_ProcessTemplateStepTypes]
GO
ALTER TABLE [dbo].[ProcessTemplateStepTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepTypeLanguages_Languages]
GO
ALTER TABLE [dbo].[ProcessTemplateStepTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStepTypeLanguages_ProcessTemplateStepTypes] FOREIGN KEY([ProcessTemplateStepTypeID])
REFERENCES [dbo].[ProcessTemplateStepTypes] ([ProcessTemplateStepTypeID])
GO
ALTER TABLE [dbo].[ProcessTemplateStepTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStepTypeLanguages_ProcessTemplateStepTypes]
GO
ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_AspNetUsers1]
GO
ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_Languages]
GO
ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_Projects]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_AspNetUsers]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_AspNetUsers1]
GO
ALTER TABLE [dbo].[SecurityLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[SecurityLevelLanguages] CHECK CONSTRAINT [FK_SecurityLevelLanguages_Languages]
GO
ALTER TABLE [dbo].[SecurityLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelLanguages_Languages1] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[SecurityLevelLanguages] CHECK CONSTRAINT [FK_SecurityLevelLanguages_Languages1]
GO
ALTER TABLE [dbo].[SecurityLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelLanguages_SecurityLevels] FOREIGN KEY([SecurityLevelID])
REFERENCES [dbo].[SecurityLevels] ([SecurityLevelID])
GO
ALTER TABLE [dbo].[SecurityLevelLanguages] CHECK CONSTRAINT [FK_SecurityLevelLanguages_SecurityLevels]
GO
ALTER TABLE [dbo].[SettingLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SettingLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[SettingLanguages] CHECK CONSTRAINT [FK_SettingLanguages_Languages]
GO
ALTER TABLE [dbo].[SettingLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SettingLanguages_Settings] FOREIGN KEY([SettingID])
REFERENCES [dbo].[Settings] ([SettingID])
GO
ALTER TABLE [dbo].[SettingLanguages] CHECK CONSTRAINT [FK_SettingLanguages_Settings]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_AspNetUsers]
GO
ALTER TABLE [dbo].[SortByLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SortByLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[SortByLanguages] CHECK CONSTRAINT [FK_SortByLanguages_Languages]
GO
ALTER TABLE [dbo].[SortByLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SortByLanguages_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])
GO
ALTER TABLE [dbo].[SortByLanguages] CHECK CONSTRAINT [FK_SortByLanguages_SortBys]
GO
ALTER TABLE [dbo].[StatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbStatusLanguage_DbLanguage] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])
GO
ALTER TABLE [dbo].[StatusLanguages] CHECK CONSTRAINT [FK_DbStatusLanguage_DbLanguage]
GO
ALTER TABLE [dbo].[StatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbStatusLanguage_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[StatusLanguages] CHECK CONSTRAINT [FK_DbStatusLanguage_DbStatus]
GO
ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_SubRegions_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])
GO
ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_SubRegions_Regions]
GO
/****** Object:  StoredProcedure [dbo].[usp_AdminClassificationUpdate]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AdminClassificationUpdate] (
	@StatusID int
	, @DefaultPageID int
	, @HasDropDown bit
	, @DropDownSequence int
	, @ModifierID NVARCHAR(450)
	, @ClassificationID int
	, @Name  NVARCHAR(50)
	, @Description NVARCHAR(MAX)
	, @MenuName NVARCHAR(50)
	, @MouseOver NVARCHAR(50)
	, @LanguageID int)
AS
BEGIN
BEGIN TRANSACTION
UPDATE Classifications 
SET StatusID = @StatusID
	, DefaultPageID = @DefaultPageID
	, HasDropDown = @HasDropDown
	, DropDownSequence = @DropDownSequence
	, ModifierID = @ModifierID
	, ModifiedDate = GETDATE()
WHERE ClassificationID = @ClassificationID;

UPDATE ClassificationLanguages 
SET Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @ModifierID
	, ModifiedDate = getdate()
WHERE ClassificationID = @ClassificationID
	AND LanguageID = @LanguageID
COMMIT TRANSACTION
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_ClassificationCreatePost]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ClassificationCreatePost] (
	@CreatorId nvarchar(450)
	, @DefaultPageId int = 0
	, @Name nvarchar(50)
	, @Description nvarchar(MAX)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownSequence int
	, @HasDropDown bit
	, @LanguageId int
	, @StatusId int
	)
AS
BEGIN
BEGIN TRANSACTION

UPDATE Classifications SET DropDownSequence = DropDownSequence + 1 WHERE DropDownSequence >= @DropDownSequence 

INSERT INTO Classifications (
	StatusID
	, DefaultPageID
	, HasDropDown
	, DropDownSequence
	, CreatorID
	, ModifierID
	, ModifiedDate
	, CreatedDate)
VALUES (
	@StatusId
	, @DefaultPageId
	, @HasDropDown
	, @DropDownSequence
	, @CreatorId
	, @CreatorId
	, getdate()
	, getdate()
	);

DECLARE @NewClassificationID int	= scope_identity();

INSERT INTO ClassificationLanguages (
	ClassificationID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, ModifierID
	, ModifiedDate
	, CreatedDate)
VALUES (
	@NewClassificationID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @CreatorID
	, @CreatorId
	, getdate()
	, getdate()
)
COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ClassificationDeleteDelete]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ClassificationDeleteDelete] (
	@ClassificationID int
	)
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM ClassificationLanguages 
WHERE ClassificationID = @ClassificationID 

DELETE FROM Classifications
WHERE ClassificationID = @ClassificationID 

COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ClassificationLevelViewGet]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ClassificationLevelViewGet] (@LanguageID int, @ClassificationID int, @ClassificationLevelID int = NULL)
AS
BEGIN
SELECT
	ClassificationLevels.ClassificationLevelID
	, ClassificationLevels.ClassificationID
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) ClassificationName
	, ClassificationLevels.CreatedDate
	, ClassificationLevels.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier	
	, ClassificationLevels.Sequence
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.CanLink
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
	, ISNULL(UserClassificationLevelLanguage.Name, ISNULL(DefaultClassificationLevelLanguage.Name, '')) Name
	, ISNULL(UserClassificationLevelLanguage.Description, ISNULL(DefaultClassificationLevelLanguage.Description, '')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName, ISNULL(DefaultClassificationLevelLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver, ISNULL(DefaultClassificationLevelLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserClassificationLevelLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationLevelLanguage
	, ISNULL(UserDateLevelLanguage.Name, ISNULL(DefaultDateLevelLanguage.Name, '')) DateLevelName
	, CAST(CASE WHEN UserDateLevelLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultDateLevelLanguage
FROM ClassificationLevels 
JOIN Classifications
	ON Classifications.ClassificationID = ClassificationLevels.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		WHERE ClassificationLanguages.LanguageID = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLevelLanguages.ClassificationLevelID
		, ClassificationLevelLanguages.Name 
		, ClassificationLevelLanguages.Description
		, ClassificationLevelLanguages.MenuName
		, ClassificationLevelLanguages.MouseOver
		FROM ClassificationLevelLanguages
		WHERE ClassificationLevelLanguages.LanguageID = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT 
		ClassificationLevelLanguages.ClassificationLevelID
		, ClassificationLevelLanguages.Name 
		, ClassificationLevelLanguages.Description
		, ClassificationLevelLanguages.MenuName
		, ClassificationLevelLanguages.MouseOver
		FROM ClassificationLevelLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLevelLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
JOIN AspNetUsers Creator
	ON Creator.Id = ClassificationLevels.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ClassificationLevels.ModifierID
LEFT JOIN (SELECT 
			DateLevelLanguages.DateLevelID
			, DateLevelLanguages.Name
		FROM DateLevelLanguages
		WHERE DateLevelLanguages.LanguageID = @LanguageID) UserDateLevelLanguage
	ON ClassificationLevels.DateLevelID = UserDateLevelLanguage.DateLevelID
LEFT JOIN (SELECT 
			DateLevelLanguages.DateLevelID
			, DateLevelLanguages.Name
		FROM DateLevelLanguages
		JOIN Settings
			ON Settings.IntValue = DateLevelLanguages.LanguageID ) DefaultDateLevelLanguage
	ON ClassificationLevels.DateLevelID = DefaultDateLevelLanguage.DateLevelID
WHERE (ClassificationLevels.ClassificationLevelID = @ClassificationLevelID OR @ClassificationLevelID IS NULL) 
	AND ClassificationLevels.ClassificationID = @ClassificationID
	ORDER BY ClassificationLevels.Sequence
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ClassificationPageSectionViewGet]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionViewGet] (@LanguageID int, @ClassificationPageID int, @ClassificationPageSectionID int = NULL)
AS
BEGIN
SELECT
	ClassificationPageSections.ClassificationPageSectionID
	, ClassificationPageSections.ClassificationPageID
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) ClassificationName
	, ClassificationPages.ClassificationID
	, ISNULL(UserClassificationPageLanguage.Name, ISNULL(DefaultClassificationPageLanguage.Name, '')) ClassificationPageName
	, ClassificationPageSections.CreatedDate
	, ClassificationPageSections.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier	
	, ClassificationPageSections.Sequence
	, ClassificationPageSections.ShowSectionTitleName
	, ClassificationPageSections.ShowSectionTitleDescription
	, ClassificationPageSections.ShowContentTypeTitleName
	, ClassificationPageSections.ShowContentTypeTitleDescription
	, ClassificationPageSections.MaxContent
	, ClassificationPageSections.HasPaging
	, ISNULL(UserClassificationPageSectionLanguage.Name, ISNULL(DefaultClassificationPageSectionLanguage.Name, '')) Name
	, ISNULL(UserClassificationPageSectionLanguage.Description, ISNULL(DefaultClassificationPageSectionLanguage.Description, '')) Description
	, ISNULL(UserClassificationPageSectionLanguage.MenuName, ISNULL(DefaultClassificationPageSectionLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationPageSectionLanguage.MouseOver, ISNULL(DefaultClassificationPageSectionLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserClassificationPageSectionLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationPageSectionLanguage
	, ISNULL(UserPageSectionTypeLanguage.Name, ISNULL(DefaultPageSectionTypeLanguage.Name, '')) PageSectionTypeName
	, CAST(CASE WHEN UserPageSectionTypeLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultPageSectionTypeLanguage
	, ISNULL(UserContentTypeLanguage.Name, ISNULL(DefaultContentTypeLanguage.Name, '')) ContentTypeName
	, CAST(CASE WHEN UserContentTypeLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultContentTypeLanguage
	, CAST(CASE WHEN ClassificationPageSections.ContentTypeID IS NULL  THEN 0 ELSE 1 END AS bit) HasContentType
	, ISNULL(UserSortByLanguage.Name, ISNULL(DefaultSortByLanguage.Name, '')) SortByName
	, CAST(CASE WHEN UserSortByLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultSortByLanguage
FROM ClassificationPageSections
JOIN ClassificationPages
	ON ClassificationPageSections.ClassificationPageID = ClassificationPages.ClassificationPageID
JOIN Classifications
	ON Classifications.ClassificationID = ClassificationPages.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		WHERE ClassificationLanguages.LanguageID = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		WHERE ClassificationPageLanguages.LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageSectionLanguages.ClassificationPageSectionID
		, ClassificationPageSectionLanguages.Name 
		, ClassificationPageSectionLanguages.Description
		, ClassificationPageSectionLanguages.MenuName
		, ClassificationPageSectionLanguages.MouseOver
		FROM ClassificationPageSectionLanguages
		WHERE ClassificationPageSectionLanguages.LanguageID = @LanguageID) UserClassificationPageSectionLanguage
	ON UserClassificationPageSectionLanguage.ClassificationPageSectionID = ClassificationPageSections.ClassificationPageSectionID
LEFT JOIN (SELECT 
		ClassificationPageSectionLanguages.ClassificationPageSectionID
		, ClassificationPageSectionLanguages.Name 
		, ClassificationPageSectionLanguages.Description
		, ClassificationPageSectionLanguages.MenuName
		, ClassificationPageSectionLanguages.MouseOver
		FROM ClassificationPageSectionLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageSectionLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationPageSectionLanguage
	ON DefaultClassificationPageSectionLanguage.ClassificationPageSectionID = ClassificationPageSections.ClassificationPageSectionID
JOIN AspNetUsers Creator
	ON Creator.Id = ClassificationPageSections.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ClassificationPageSections.ModifierID
LEFT JOIN (SELECT 
			PageSectionTypeLanguages.PageSectionTypeID
			, PageSectionTypeLanguages.Name
		FROM PageSectionTypeLanguages
		WHERE PageSectionTypeLanguages.LanguageID = @LanguageID) UserPageSectionTypeLanguage
	ON ClassificationPageSections.PageSectionTypeID = UserPageSectionTypeLanguage.PageSectionTypeID
LEFT JOIN (SELECT 
			PageSectionTypeLanguages.PageSectionTypeID
			, PageSectionTypeLanguages.Name
		FROM PageSectionTypeLanguages
		JOIN Settings
			ON Settings.IntValue = PageSectionTypeLanguages.LanguageID ) DefaultPageSectionTypeLanguage
	ON ClassificationPageSections.PageSectionTypeID = DefaultPageSectionTypeLanguage.PageSectionTypeID
LEFT JOIN (SELECT 
			ContentTypeLanguages.ContentTypeID
			, ContentTypeLanguages.Name
		FROM ContentTypeLanguages
		WHERE ContentTypeLanguages.LanguageID = @LanguageID) UserContentTypeLanguage
	ON ClassificationPageSections.ContentTypeID = UserContentTypeLanguage.ContentTypeID
LEFT JOIN (SELECT 
			ContentTypeLanguages.ContentTypeID
			, ContentTypeLanguages.Name
		FROM ContentTypeLanguages
		JOIN Settings
			ON Settings.IntValue = ContentTypeLanguages.LanguageID ) DefaultContentTypeLanguage
	ON ClassificationPageSections.ContentTypeID = DefaultContentTypeLanguage.ContentTypeID
LEFT JOIN (SELECT 
			SortByLanguages.SortByID
			, SortByLanguages.Name
		FROM SortByLanguages
		WHERE SortByLanguages.LanguageID = @LanguageID) UserSortByLanguage
	ON ClassificationPageSections.SortByID = UserSortByLanguage.SortByID
LEFT JOIN (SELECT 
			SortByLanguages.SortByID
			, SortByLanguages.Name
		FROM SortByLanguages
		JOIN Settings
			ON Settings.IntValue = SortByLanguages.LanguageID ) DefaultSortByLanguage
	ON ClassificationPageSections.SortByID = DefaultSortByLanguage.SortByID
WHERE (ClassificationPageSections.ClassificationPageSectionID = @ClassificationPageSectionID OR @ClassificationPageSectionID IS NULL) 
	AND ClassificationPageSections.ClassificationPageID = @ClassificationPageID
	ORDER BY Sequence
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ClassificationPageViewGet]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ClassificationPageViewGet] (@LanguageID int, @ClassificationID int, @ClassificationPageID int = NULL)
AS
BEGIN
SELECT
	ClassificationPages.ClassificationPageID
	, ClassificationPages.ClassificationID
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) ClassificationName
	, ClassificationPages.CreatedDate
	, ClassificationPages.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier	
	, ClassificationPages.ShowTitleName
	, ClassificationPages.ShowTitleDescription
	, ISNULL(UserClassificationPageLanguage.Name, ISNULL(DefaultClassificationPageLanguage.Name, '')) Name
	, ISNULL(UserClassificationPageLanguage.Description, ISNULL(DefaultClassificationPageLanguage.Description, '')) Description
	, ISNULL(UserClassificationPageLanguage.MenuName, ISNULL(DefaultClassificationPageLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationPageLanguage.MouseOver, ISNULL(DefaultClassificationPageLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserClassificationPageLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationPageLanguage
	, ISNULL(UserStatusLanguage.Name, ISNULL(DefaultStatusLanguage.Name, '')) StatusName
	, CAST(CASE WHEN UserStatusLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultStatusLanguage
FROM ClassificationPages 
JOIN Classifications
	ON Classifications.ClassificationID = ClassificationPages.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		WHERE ClassificationLanguages.LanguageID = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		, ClassificationPageLanguages.Description
		, ClassificationPageLanguages.MenuName
		, ClassificationPageLanguages.MouseOver
		FROM ClassificationPageLanguages
		WHERE ClassificationPageLanguages.LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		, ClassificationPageLanguages.Description
		, ClassificationPageLanguages.MenuName
		, ClassificationPageLanguages.MouseOver
		FROM ClassificationPageLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
JOIN AspNetUsers Creator
	ON Creator.Id = ClassificationPages.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ClassificationPages.ModifierID
LEFT JOIN (SELECT 
			StatusLanguages.StatusID
			, StatusLanguages.Name
		FROM StatusLanguages
		WHERE StatusLanguages.LanguageID = @LanguageID) UserStatusLanguage
	ON ClassificationPages.StatusID = UserStatusLanguage.StatusID
LEFT JOIN (SELECT 
			StatusLanguages.StatusID
			, StatusLanguages.Name
		FROM StatusLanguages
		JOIN Settings
			ON Settings.IntValue = StatusLanguages.LanguageID ) DefaultStatusLanguage
	ON ClassificationPages.StatusID = DefaultStatusLanguage.StatusID
WHERE (ClassificationPages.ClassificationPageID = @ClassificationPageID OR @ClassificationPageID IS NULL) 
	AND ClassificationPages.ClassificationID = @ClassificationID
	ORDER BY Name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ClassificationUpdatePut]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ClassificationUpdatePut] (
	@ClassificationID int
	, @DefaultPageId int = 0
	, @Name nvarchar(50)
	, @Description nvarchar(MAX)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @DropDownSequence int
	, @HasDropDown bit
	, @LanguageId int
	, @StatusId int
	, @ModifierID nvarchar(45)
	)
AS
BEGIN
BEGIN TRANSACTION
DECLARE @OldDropDownSequence int
SELECT @OldDropDownSequence = DropDownSequence FROM Classifications WHERE ClassificationID = @ClassificationID
IF @OldDropDownSequence > @DropDownSequence
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence + 1 WHERE DropDownSequence < @DropDownSequence AND DropDownSequence >= @DropDownSequence
END
ELSE
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence <= @DropDownSequence AND DropDownSequence > @DropDownSequence
END


UPDATE Classifications SET
	DefaultPageID = @DefaultPageID
	, HasDropDown = @HasDropDown
	, StatusID = @StatusId
	, DropDownSequence = @DropDownSequence
	, ModifierID = @ModifierID
	, ModifiedDate = getdate()
WHERE ClassificationID = @ClassificationID

UPDATE ClassificationLanguages SET
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @ModifierID
	, ModifiedDate = getdate()
WHERE ClassificationID = @ClassificationID
	AND LanguageID = @LanguageId

COMMIT TRANSACTION
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ClassificationViewGet]    Script Date: 4/23/2020 5:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ClassificationViewGet] (@LanguageID int, @ClassificationID int = NULL)
AS
BEGIN
SELECT
	Classifications.ClassificationID
	, Classifications.HasDropDown
	, Classifications.DropDownSequence
	, ISNULL(UserStatusLanguage.Name, ISNULL(DefaultStatusLanguage.Name, '')) StatusName
	, CAST(CASE WHEN UserStatusLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultStatusLanguage
	, ISNULL(UserClassificationPageLanguage.Name, ISNULL(DefaultClassificationPageLanguage.Name, '')) ClassificationPageName
	, CAST(CASE WHEN UserClassificationLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationLanguage
	, Classifications.CreatedDate
	, Classifications.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) Name
	, ISNULL(UserClassificationLanguage.Description, ISNULL(DefaultClassificationLanguage.Description, '')) Description
	, ISNULL(UserClassificationLanguage.MenuName, ISNULL(DefaultClassificationLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationLanguage.MouseOver, ISNULL(DefaultClassificationLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserStatusLanguage.Name IS NULL AND DefaultClassificationPageLanguage.Name IS NOT NULL THEN 1 ELSE 0 END AS bit) DefaultClassificationPageLanguage
FROM Classifications
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		, ClassificationLanguages.Description
		, ClassificationLanguages.MenuName
		, ClassificationLanguages.MouseOver
		FROM ClassificationLanguages
		WHERE ClassificationLanguages.LanguageID = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		, ClassificationLanguages.Description
		, ClassificationLanguages.MenuName
		, ClassificationLanguages.MouseOver
		FROM ClassificationLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationID = Classifications.ClassificationID
JOIN AspNetUsers Creator
	ON Creator.Id = Classifications.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = Classifications.ModifierID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		WHERE ClassificationPageLanguages.LanguageID = @LanguageID) UserClassificationPageLanguage
	ON Classifications.DefaultPageID = UserClassificationPageLanguage.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageLanguages.LanguageID ) DefaultClassificationPageLanguage
	ON Classifications.DefaultPageID = DefaultClassificationPageLanguage.ClassificationPageID
LEFT JOIN (SELECT 
		StatusLanguages.StatusID
		, StatusLanguages.Name 
		FROM StatusLanguages
		WHERE StatusLanguages.LanguageID = @LanguageID) UserStatusLanguage
	ON Classifications.DefaultPageID = UserStatusLanguage.StatusID
LEFT JOIN (SELECT 
		StatusLanguages.StatusID
		, StatusLanguages.Name 
		FROM StatusLanguages
		JOIN Settings
			ON Settings.IntValue = StatusLanguages.LanguageID ) DefaultStatusLanguage
	ON Classifications.StatusID = DefaultStatusLanguage.StatusID
WHERE (Classifications.ClassificationID = @ClassificationID OR @ClassificationID IS NULL)
ORDER BY Name
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClassificationLanguages', @level2type=N'COLUMN',@level2name=N'ClassificationLanguageID'
GO
USE [master]
GO
ALTER DATABASE [sip] SET  READ_WRITE 
GO
