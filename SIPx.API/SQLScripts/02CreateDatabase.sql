SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AddressTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AddressTypeLanguages](
	[AddressTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AddressName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AddressTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[AddressTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AddressTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AddressTypes](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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
	[SecurityLevelID] [int] NOT NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClaimGroupLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClaimGroupLanguages](
	[ClaimGroupLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimGroupID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimGroupLanguages] PRIMARY KEY CLUSTERED 
(
	[ClaimGroupLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClaimGroups]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClaimGroups](
	[ClaimGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_ClaimGroups] PRIMARY KEY CLUSTERED 
(
	[ClaimGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClaimLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClaimLanguages](
	[ClaimLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimLanguages] PRIMARY KEY CLUSTERED 
(
	[ClaimLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Claims]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Claims](
	[ClaimID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimGroupID] [int] NOT NULL,
	[ClaimType] [nchar](50) NOT NULL,
	[ClaimValue] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationLevelLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationLevels]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationOwners]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationOwners](
	[ClassificationOwnerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationOwners] PRIMARY KEY CLUSTERED 
(
	[ClassificationOwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationPageLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationPages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationPageSectionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationPageSections]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationRoles]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationRoles](
	[ClassificationRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [nvarchar](450) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationRoles] PRIMARY KEY CLUSTERED 
(
	[ClassificationRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Classifications]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationValueLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ClassificationValueOwners]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValueOwners](
	[ClassificationValueOwnerID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerID] [nvarchar](450) NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValueOwners] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueOwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValueRoles]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValueRoles](
	[ClassificationValueRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [nvarchar](450) NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValueRoles] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValues]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValues](
	[ClassificationValueID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ParentValueID] [int] NULL,
	[DateFrom] [datetimeoffset](7) NULL,
	[DateTo] [datetimeoffset](7) NULL,
	[Location] [geography] NULL,
	[RoleOwnerID] [nvarchar](450) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValues] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Content]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentContentID] [int] NULL,
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

/****** Object:  Table [dbo].[ContentStatuses]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentStatuses](
	[ContentStatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ContentStatuses] PRIMARY KEY CLUSTERED 
(
	[ContentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentStatusLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ContentTypeClassifications]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ContentTypeClassificationStatuses]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeClassificationStatuses](
	[ContentTypeClassificationStatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ContentTypeClassificationStatus] PRIMARY KEY CLUSTERED 
(
	[ContentTypeClassificationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeClassificationStatusLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ContentTypeGroupLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ContentTypeGroups]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ContentTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ContentTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Countries]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[CountryLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[DateLevelLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[DateLevels]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DateLevels](
	[DateLevelID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DateLevels] PRIMARY KEY CLUSTERED 
(
	[DateLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[IntermediateRegionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[IntermediateRegionLanguages](
	[IntermediateRegionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[IntermediateRegionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IntermediateRegionLanguages] PRIMARY KEY CLUSTERED 
(
	[IntermediateRegionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[IntermediateRegions]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[IntermediateRegions](
	[IntermediateRegionID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_IntermediateRegions] PRIMARY KEY CLUSTERED 
(
	[IntermediateRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Languages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Menu1OptionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Menu1Options]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Menu2OptionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Menu2Options]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Menu3OptionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Menu3Options]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[MenuTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[MenuTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MenuTypes](
	[MenuTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_MenuTypes] PRIMARY KEY CLUSTERED 
(
	[MenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MVCUIScreenLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MVCUIScreenLanguages](
	[MVCUIScreenLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MVCUIScreenLangauges] PRIMARY KEY CLUSTERED 
(
	[MVCUIScreenLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[MVCUIScreens]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MVCUIScreens](
	[MVCUIScreenID] [int] IDENTITY(1,1) NOT NULL,
	[Controller] [varchar](50) NOT NULL,
	[Action] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MVCUIScreens] PRIMARY KEY CLUSTERED 
(
	[MVCUIScreenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MVCUITermScreens]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MVCUITermScreens](
	[MVCUITermScreenID] [int] IDENTITY(1,1) NOT NULL,
	[UITermID] [int] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_MVCUITermScreens] PRIMARY KEY CLUSTERED 
(
	[MVCUITermScreenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationAddresses]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationAddresses](
	[OrganizationAddressID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[AttnName] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[HouseNumber] [nvarchar](20) NULL,
	[HouseNumberExt] [nvarchar](20) NULL,
	[Location] [geography] NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[PostalCodeExt] [nvarchar](50) NULL,
	[CountryID] [int] NOT NULL,
	[Province] [nvarchar](50) NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationAddresses] PRIMARY KEY CLUSTERED 
(
	[OrganizationAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Organizations]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[OrganizationTelecomPhones]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTelecomPhones](
	[OrganizationTelecomID] [int] NOT NULL,
	[CountryCode] [nvarchar](10) NULL,
	[AreaCode] [nvarchar](10) NULL,
	[ExtensionCode] [nvarchar](10) NULL,
	[AskForName] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrganizationTelecomPhones] PRIMARY KEY CLUSTERED 
(
	[OrganizationTelecomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTelecoms]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTelecoms](
	[OrganizationTelecomID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[TelecomTypeID] [int] NOT NULL,
	[TelecomValue] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrganizationTelecoms] PRIMARY KEY CLUSTERED 
(
	[OrganizationTelecomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypeLanguages](
	[OrganizationTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypes](
	[OrganizationTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrganizationTypes] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Pages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[PageSectionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[PageSections]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[PageSectionTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[PageSectionTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionTypes](
	[PageSectionTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PageSectionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonAddresses]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonAddresses](
	[PersonAddressID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[AttnName] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[HouseNumber] [nvarchar](20) NULL,
	[HouseNumberExt] [nvarchar](20) NULL,
	[Location] [geography] NULL,
	[City] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[PostalCodeExt] [nvarchar](50) NULL,
	[CountryID] [int] NOT NULL,
	[Province] [nvarchar](50) NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonAddresses] PRIMARY KEY CLUSTERED 
(
	[PersonAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Persons]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Salutation] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PersonalTitle] [nvarchar](50) NULL,
	[Suffix] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[FirstNameLocal] [nvarchar](50) NULL,
	[MiddleNameLocal] [nvarchar](50) NULL,
	[LastNameLocal] [nvarchar](50) NULL,
	[GenderID] [int] NOT NULL,
	[BirthDate] [date] NULL,
	[DeceasedDate] [date] NULL,
	[PersonTypeID] [int] NOT NULL,
	[DefaultOrganizationID] [int] NOT NULL,
	[UserID] [nvarchar](450) NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTelecomPhones]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTelecomPhones](
	[PersonTelecomID] [int] NOT NULL,
	[CountryCode] [nvarchar](10) NULL,
	[AreaCode] [nvarchar](10) NULL,
	[ExtensionCode] [nvarchar](10) NULL,
	[AskForName] [nvarchar](50) NULL,
 CONSTRAINT [PK_PersonTelecomPhones] PRIMARY KEY CLUSTERED 
(
	[PersonTelecomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTelecoms]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTelecoms](
	[PersonTelecomID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[TelecomTypeID] [int] NOT NULL,
	[TelecomValue] [nvarchar](50) NULL,
 CONSTRAINT [PK_PersonTelecoms] PRIMARY KEY CLUSTERED 
(
	[PersonTelecomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTypeLanguages](
	[PersonTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PersonName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PersonTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[PersonTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTypes](
	[PersonTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PersonTypes] PRIMARY KEY CLUSTERED 
(
	[PersonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PreferenceTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PreferenceTypeLanguages](
	[PreferenceTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PreferenceTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DbPreferenceTypeLanguage] PRIMARY KEY CLUSTERED 
(
	[PreferenceTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PreferenceTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PreferenceTypes](
	[PreferenceTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PreferenceTypes] PRIMARY KEY CLUSTERED 
(
	[PreferenceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Processes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Processes](
	[ProcessID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[StageID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ProcessFields]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessFields](
	[ProcessFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[StringValue] [nvarchar](max) NULL,
	[IntValue] [int] NULL,
	[LocationValue] [geography] NULL,
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

/****** Object:  Table [dbo].[ProcessMultis]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateFieldLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateFields]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateFieldTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateFieldTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFieldTypes](
	[ProcessTemplateFieldTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowConditionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateFlowConditions]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowConditions](
	[ProcessTemplateFlowConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFlowID] [int] NOT NULL,
	[ProcessTemplateConditionTypeID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NULL,
	[ComparisonOperatorID] [int] NULL,
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

/****** Object:  Table [dbo].[ProcessTemplateFlowConditionTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateFlowConditionTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowConditionTypes](
	[ProcessTemplateFlowConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowConditionTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateFlows]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlows](
	[ProcessTemplateFlowID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFromStageID] [int] NOT NULL,
	[ProcessTemplateToStageID] [int] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlows] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateGroupLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateGroups]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplateLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[ProcessTemplates]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplates](
	[ProcessTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateGroupID] [int] NOT NULL,
	[ShowInPersonalCalendar] [bit] NOT NULL,
	[ShowInEventCalendar] [bit] NOT NULL,
	[ProcessMultiMax] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplates] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageFields]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageFields](
	[ProcessTemplateStageFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStageID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[ProcessTemplateStageFieldStatusID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageFields] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageFieldStatuses]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageFieldStatuses](
	[ProcessTemplateStageFieldStatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageFieldStatuses] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageFieldStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageFieldStatusLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages](
	[ProcessTemplateStageFieldStatusLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStageFieldStatusID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageFieldStatusLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageFieldStatusLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageLanguages](
	[ProcessTemplateStageLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStageID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStages](
	[ProcessTemplateStageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateStageTypeID] [int] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageTypeLanguages](
	[ProcessTemplateStageTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateStageTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageTypes](
	[ProcessTemplateStageTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Projects]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[RegionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RegionLanguages](
	[RegionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[RegionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RegionLanguages] PRIMARY KEY CLUSTERED 
(
	[RegionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Regions]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Regions](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[SecurityLevelLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[SecurityLevels]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SecurityLevels](
	[SecurityLevelID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SecurityLevels] PRIMARY KEY CLUSTERED 
(
	[SecurityLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[SettingLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[Settings]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[SortByLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[SortBys]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SortBys](
	[SortByID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SortBys] PRIMARY KEY CLUSTERED 
(
	[SortByID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Statuses]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[StatusLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

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

/****** Object:  Table [dbo].[SubRegionLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SubRegionLanguages](
	[SubRegionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[SubRegionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SubregionLanguages] PRIMARY KEY CLUSTERED 
(
	[SubRegionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[SubRegions]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SubRegions](
	[SubRegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_SubRegions] PRIMARY KEY CLUSTERED 
(
	[SubRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TelecomTypeLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TelecomTypeLanguages](
	[TelecomTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[TelecomTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[TelecomName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TelecomTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[TelecomTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[TelecomTypes]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TelecomTypes](
	[TelecomTypeID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TelecomTypes] PRIMARY KEY CLUSTERED 
(
	[TelecomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UITermLanguageCustomizations]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UITermLanguageCustomizations](
	[UITermLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[UITermID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Customization] [nvarchar](max) NULL,
 CONSTRAINT [PK_UITermLanguages] PRIMARY KEY CLUSTERED 
(
	[UITermLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UITermLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UITermLanguages](
	[UITermLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[UITermID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UITermLangauges] PRIMARY KEY CLUSTERED 
(
	[UITermLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UITerms]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UITerms](
	[UITermID] [int] IDENTITY(1,1) NOT NULL,
	[InternalName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UITerms] PRIMARY KEY CLUSTERED 
(
	[UITermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenuLanguages]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenuLanguages](
	[UserMenuLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[UserMenuID] [int] NOT NULL,
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
 CONSTRAINT [PK_UserMenuLanguages] PRIMARY KEY CLUSTERED 
(
	[UserMenuLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenus]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenus](
	[UserMenuID] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_UserMenus] PRIMARY KEY CLUSTERED 
(
	[UserMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenuUsers]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenuUsers](
	[UserMenuUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserMenuID] [int] NOT NULL,
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
 CONSTRAINT [PK_UserMenuUsers] PRIMARY KEY CLUSTERED 
(
	[UserMenuUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UserPreferences]    Script Date: 6/5/2020 9:30:28 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserPreferences](
	[UserPreferenceID] [int] IDENTITY(1,1) NOT NULL,
	[PreferenceTypeID] [int] NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[IntPreference] [int] NULL,
	[StringPreference] [nvarchar](max) NULL,
	[DateTimePreference] [datetime2](7) NULL,
	[GuidPreference] [uniqueidentifier] NULL,
	[LocationPreference] [geography] NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserPreferences] PRIMARY KEY CLUSTERED 
(
	[UserPreferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreatorID]  DEFAULT (N'a') FOR [CreatorID]

ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_ModifierID]  DEFAULT (N'a') FOR [ModifierID]

ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]

ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]

ALTER TABLE [dbo].[OrganizationAddresses] ADD  CONSTRAINT [DF_OrganizationAddresses_CreatorID]  DEFAULT (N'a') FOR [CreatorID]

ALTER TABLE [dbo].[OrganizationAddresses] ADD  CONSTRAINT [DF_OrganizationAddresses_ModifierID]  DEFAULT (N'a') FOR [ModifierID]

ALTER TABLE [dbo].[OrganizationAddresses] ADD  CONSTRAINT [DF_OrganizationAddresses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]

ALTER TABLE [dbo].[OrganizationAddresses] ADD  CONSTRAINT [DF_OrganizationAddresses_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]

ALTER TABLE [dbo].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_CreatorID]  DEFAULT (N'a') FOR [CreatorID]

ALTER TABLE [dbo].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_ModifierID]  DEFAULT (N'a') FOR [ModifierID]

ALTER TABLE [dbo].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]

ALTER TABLE [dbo].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]

ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [DF_Persons_CreatorID]  DEFAULT (N'a') FOR [CreatorID]

ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [DF_Persons_ModifierID]  DEFAULT (N'a') FOR [ModifierID]

ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [DF_Persons_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]

ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [DF_Persons_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]

ALTER TABLE [dbo].[AddressTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeLanguages_AddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])

ALTER TABLE [dbo].[AddressTypeLanguages] CHECK CONSTRAINT [FK_AddressTypeLanguages_AddressTypes]

ALTER TABLE [dbo].[AddressTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[AddressTypeLanguages] CHECK CONSTRAINT [FK_AddressTypeLanguages_Languages]

ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]

ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]

ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]

ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_SecurityLevels] FOREIGN KEY([SecurityLevelID])
REFERENCES [dbo].[SecurityLevels] ([SecurityLevelID])

ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_SecurityLevels]

ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]

ALTER TABLE [dbo].[ClaimGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClaimGroupLanguages_ClaimGroups] FOREIGN KEY([ClaimGroupID])
REFERENCES [dbo].[ClaimGroups] ([ClaimGroupID])

ALTER TABLE [dbo].[ClaimGroupLanguages] CHECK CONSTRAINT [FK_ClaimGroupLanguages_ClaimGroups]

ALTER TABLE [dbo].[ClaimGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClaimGroupLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClaimGroupLanguages] CHECK CONSTRAINT [FK_ClaimGroupLanguages_Languages]

ALTER TABLE [dbo].[ClaimLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClaimLanguages_Claims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claims] ([ClaimID])

ALTER TABLE [dbo].[ClaimLanguages] CHECK CONSTRAINT [FK_ClaimLanguages_Claims]

ALTER TABLE [dbo].[ClaimLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClaimLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClaimLanguages] CHECK CONSTRAINT [FK_ClaimLanguages_Languages]

ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_ClaimGroups] FOREIGN KEY([ClaimGroupID])
REFERENCES [dbo].[ClaimGroups] ([ClaimGroupID])

ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_ClaimGroups]

ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_ClassificationLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_ClassificationLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbClassificationLanguage_DbClassification] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_DbClassificationLanguage_DbClassification]

ALTER TABLE [dbo].[ClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbClassificationLanguage_DbLanguage] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationLanguages] CHECK CONSTRAINT [FK_DbClassificationLanguage_DbLanguage]

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguage_ClassificationLevel] FOREIGN KEY([ClassificationLevelID])
REFERENCES [dbo].[ClassificationLevels] ([ClassificationLevelID])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguage_ClassificationLevel]

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguage_Language]

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevel_Classification] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevel_Classification]

ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_AspNetUsers]

ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_AspNetUsers2] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_AspNetUsers2]

ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_DateLevels] FOREIGN KEY([DateLevelID])
REFERENCES [dbo].[DateLevels] ([DateLevelID])

ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_DateLevels]

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguage_ClassificationPage] FOREIGN KEY([ClassificationPageID])
REFERENCES [dbo].[ClassificationPages] ([ClassificationPageID])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguage_ClassificationPage]

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguage_Language]

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPage_Classification] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPage_Classification]

ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPage_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPage_Status]

ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationPages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPages] CHECK CONSTRAINT [FK_ClassificationPages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguage_ClassificationPageSection] FOREIGN KEY([ClassificationPageSectionID])
REFERENCES [dbo].[ClassificationPageSections] ([ClassificationPageSectionID])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguage_ClassificationPageSection]

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguage_Language]

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSection_ClassificationPage] FOREIGN KEY([ClassificationPageID])
REFERENCES [dbo].[ClassificationPages] ([ClassificationPageID])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSection_ClassificationPage]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_AspNetUsers]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_PageSectionTypes]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_SortBys]

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers]

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers1]

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers2]

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers3]

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_AspNetUsers4] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_AspNetUsers4]

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_DbClassification_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_DbClassification_DbStatus]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_ClassificationValues] FOREIGN KEY([ClassificationValueID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_ClassificationValues]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_Languages]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_Classifications]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_ClassificationValues] FOREIGN KEY([ParentValueID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_ClassificationValues]

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_AspNetUsers]

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_AspNetUsers1]

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_Content] FOREIGN KEY([ParentContentID])
REFERENCES [dbo].[Content] ([ContentID])

ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Content]

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentStatuses] FOREIGN KEY([ContentStatusID])
REFERENCES [dbo].[ContentStatuses] ([ContentStatusID])

ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_ContentStatuses]

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_ContentTypes]

ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_SecurityLevels] FOREIGN KEY([SecurityLevelID])
REFERENCES [dbo].[SecurityLevels] ([SecurityLevelID])

ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_SecurityLevels]

ALTER TABLE [dbo].[ContentStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentStatusLanguages_ContentStatuses] FOREIGN KEY([ContentStatusID])
REFERENCES [dbo].[ContentStatuses] ([ContentStatusID])

ALTER TABLE [dbo].[ContentStatusLanguages] CHECK CONSTRAINT [FK_ContentStatusLanguages_ContentStatuses]

ALTER TABLE [dbo].[ContentStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentStatusLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ContentStatusLanguages] CHECK CONSTRAINT [FK_ContentStatusLanguages_Languages]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_Classifications]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_ContentTypeClassificationStatuses] FOREIGN KEY([ContentTypeClassificationStatusID])
REFERENCES [dbo].[ContentTypeClassificationStatuses] ([ContentTypeClassificationStatusID])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_ContentTypeClassificationStatuses]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_ContentTypes]

ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_ContentTypeClassificationStatuses] FOREIGN KEY([ContentTypeClassificationStatusID])
REFERENCES [dbo].[ContentTypeClassificationStatuses] ([ContentTypeClassificationStatusID])

ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages] CHECK CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_ContentTypeClassificationStatuses]

ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ContentTypeClassificationStatusLanguages] CHECK CONSTRAINT [FK_ContentTypeClassificationStatusLanguages_Languages]

ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_ContentTypeGroups] FOREIGN KEY([ContentTypeGroupID])
REFERENCES [dbo].[ContentTypeGroups] ([ContentTypeGroupID])

ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_ContentTypeGroups]

ALTER TABLE [dbo].[ContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroupLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ContentTypeGroupLanguages_Languages]

ALTER TABLE [dbo].[ContentTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroups_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeGroups] CHECK CONSTRAINT [FK_ContentTypeGroups_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeGroups_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeGroups] CHECK CONSTRAINT [FK_ContentTypeGroups_AspNetUsers1]

ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_ContentTypes]

ALTER TABLE [dbo].[ContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ContentTypeLanguages] CHECK CONSTRAINT [FK_ContentTypeLanguages_Languages]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_AspNetUsers]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_AspNetUsers1]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_ContentTypeGroups] FOREIGN KEY([ContentTypeGroupID])
REFERENCES [dbo].[ContentTypeGroups] ([ContentTypeGroupID])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_ContentTypeGroups]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_IntermediateRegions] FOREIGN KEY([IntermediateRegionID])
REFERENCES [dbo].[IntermediateRegions] ([IntermediateRegionID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_IntermediateRegions]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_SubRegions] FOREIGN KEY([SubRegionID])
REFERENCES [dbo].[SubRegions] ([SubRegionID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_SubRegions]

ALTER TABLE [dbo].[CountryLanguages]  WITH CHECK ADD  CONSTRAINT [FK_CountryLanguages_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])

ALTER TABLE [dbo].[CountryLanguages] CHECK CONSTRAINT [FK_CountryLanguages_Countries]

ALTER TABLE [dbo].[CountryLanguages]  WITH CHECK ADD  CONSTRAINT [FK_CountryLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[CountryLanguages] CHECK CONSTRAINT [FK_CountryLanguages_Languages]

ALTER TABLE [dbo].[DateLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DateLevelLanguages_DateLevels] FOREIGN KEY([DateLevelID])
REFERENCES [dbo].[DateLevels] ([DateLevelID])

ALTER TABLE [dbo].[DateLevelLanguages] CHECK CONSTRAINT [FK_DateLevelLanguages_DateLevels]

ALTER TABLE [dbo].[IntermediateRegionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_IntermediateRegionLanguages_IntermediateRegions] FOREIGN KEY([IntermediateRegionID])
REFERENCES [dbo].[IntermediateRegions] ([IntermediateRegionID])

ALTER TABLE [dbo].[IntermediateRegionLanguages] CHECK CONSTRAINT [FK_IntermediateRegionLanguages_IntermediateRegions]

ALTER TABLE [dbo].[IntermediateRegionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_IntermediateRegionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[IntermediateRegionLanguages] CHECK CONSTRAINT [FK_IntermediateRegionLanguages_Languages]

ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_DbLanguage_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_DbLanguage_DbStatus]

ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_Languages_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_Languages_AspNetUsers]

ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_Languages]

ALTER TABLE [dbo].[Menu1OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_Menu1Options] FOREIGN KEY([Menu1OptionID])
REFERENCES [dbo].[Menu1Options] ([Menu1OptionID])

ALTER TABLE [dbo].[Menu1OptionLanguages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_Menu1Options]

ALTER TABLE [dbo].[Menu1Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1Options] CHECK CONSTRAINT [FK_Menu1Options_AspNetUsers]

ALTER TABLE [dbo].[Menu1Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1Options] CHECK CONSTRAINT [FK_Menu1Options_AspNetUsers1]

ALTER TABLE [dbo].[Menu1Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[Menu1Options] CHECK CONSTRAINT [FK_Menu1Options_Classifications]

ALTER TABLE [dbo].[Menu1Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])

ALTER TABLE [dbo].[Menu1Options] CHECK CONSTRAINT [FK_Menu1Options_MenuTypes]

ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_Languages]

ALTER TABLE [dbo].[Menu2OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_Menu2Options] FOREIGN KEY([Menu2OptionID])
REFERENCES [dbo].[Menu2Options] ([Menu2OptionID])

ALTER TABLE [dbo].[Menu2OptionLanguages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_Menu2Options]

ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_AspNetUsers]

ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_AspNetUsers1]

ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_Classifications]

ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_Menu1Options] FOREIGN KEY([Menu1OptionID])
REFERENCES [dbo].[Menu1Options] ([Menu1OptionID])

ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_Menu1Options]

ALTER TABLE [dbo].[Menu2Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])

ALTER TABLE [dbo].[Menu2Options] CHECK CONSTRAINT [FK_Menu2Options_MenuTypes]

ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_Languages]

ALTER TABLE [dbo].[Menu3OptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_Menu3Options] FOREIGN KEY([Menu3OptionID])
REFERENCES [dbo].[Menu3Options] ([Menu3OptionID])

ALTER TABLE [dbo].[Menu3OptionLanguages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_Menu3Options]

ALTER TABLE [dbo].[Menu3Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3Options] CHECK CONSTRAINT [FK_Menu3Options_AspNetUsers]

ALTER TABLE [dbo].[Menu3Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3Options] CHECK CONSTRAINT [FK_Menu3Options_AspNetUsers1]

ALTER TABLE [dbo].[Menu3Options]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_Menu2Options] FOREIGN KEY([Menu2OptionID])
REFERENCES [dbo].[Menu2Options] ([Menu2OptionID])

ALTER TABLE [dbo].[Menu3Options] CHECK CONSTRAINT [FK_Menu3Options_Menu2Options]

ALTER TABLE [dbo].[MenuTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MenuTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[MenuTypeLanguages] CHECK CONSTRAINT [FK_MenuTypeLanguages_Languages]

ALTER TABLE [dbo].[MenuTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MenuTypeLanguages_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])

ALTER TABLE [dbo].[MenuTypeLanguages] CHECK CONSTRAINT [FK_MenuTypeLanguages_MenuTypes]

ALTER TABLE [dbo].[MVCUIScreenLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MVCUIScreenLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[MVCUIScreenLanguages] CHECK CONSTRAINT [FK_MVCUIScreenLanguages_Languages]

ALTER TABLE [dbo].[MVCUIScreenLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MVCUIScreenLanguages_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[MVCUIScreenLanguages] CHECK CONSTRAINT [FK_MVCUIScreenLanguages_MVCUIScreens]

ALTER TABLE [dbo].[MVCUITermScreens]  WITH CHECK ADD  CONSTRAINT [FK_MVCUITermScreens_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[MVCUITermScreens] CHECK CONSTRAINT [FK_MVCUITermScreens_MVCUIScreens]

ALTER TABLE [dbo].[MVCUITermScreens]  WITH CHECK ADD  CONSTRAINT [FK_MVCUITermScreens_UITerms] FOREIGN KEY([UITermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MVCUITermScreens] CHECK CONSTRAINT [FK_MVCUITermScreens_UITerms]

ALTER TABLE [dbo].[OrganizationAddresses]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAddresses_AddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])

ALTER TABLE [dbo].[OrganizationAddresses] CHECK CONSTRAINT [FK_OrganizationAddresses_AddressTypes]

ALTER TABLE [dbo].[OrganizationAddresses]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAddresses_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationAddresses] CHECK CONSTRAINT [FK_OrganizationAddresses_Organizations]

ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_AspNetUsers]

ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_Languages]

ALTER TABLE [dbo].[OrganizationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationLanguages_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationLanguages] CHECK CONSTRAINT [FK_OrganizationLanguages_Organizations]

ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_AspNetUsers]

ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_AspNetUsers1]

ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Organizations] FOREIGN KEY([ParentOrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_Organizations]

ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_OrganizationTypes]

ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD  CONSTRAINT [FK_Organizations_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[Organizations] CHECK CONSTRAINT [FK_Organizations_Statuses]

ALTER TABLE [dbo].[OrganizationTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTelecoms_OrganizationAddresses] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[OrganizationAddresses] ([OrganizationAddressID])

ALTER TABLE [dbo].[OrganizationTelecoms] CHECK CONSTRAINT [FK_OrganizationTelecoms_OrganizationAddresses]

ALTER TABLE [dbo].[OrganizationTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTelecoms_OrganizationTelecomPhones] FOREIGN KEY([OrganizationTelecomID])
REFERENCES [dbo].[OrganizationTelecomPhones] ([OrganizationTelecomID])

ALTER TABLE [dbo].[OrganizationTelecoms] CHECK CONSTRAINT [FK_OrganizationTelecoms_OrganizationTelecomPhones]

ALTER TABLE [dbo].[OrganizationTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTelecoms_TelecomTypes] FOREIGN KEY([TelecomTypeID])
REFERENCES [dbo].[TelecomTypes] ([TelecomTypeID])

ALTER TABLE [dbo].[OrganizationTelecoms] CHECK CONSTRAINT [FK_OrganizationTelecoms_TelecomTypes]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_Languages]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes]

ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_Languages]

ALTER TABLE [dbo].[PageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageLanguages_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])

ALTER TABLE [dbo].[PageLanguages] CHECK CONSTRAINT [FK_PageLanguages_Pages]

ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_AspNetUsers]

ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_AspNetUsers1]

ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Statuses]

ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_PageSections] FOREIGN KEY([PageSectionID])
REFERENCES [dbo].[PageSections] ([PageSectionID])

ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_PageSections]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_AspNetUsers]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_AspNetUsers1]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_Pages]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_PageSectionTypes]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_SortBys]

ALTER TABLE [dbo].[PageSectionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionTypeLanguages] CHECK CONSTRAINT [FK_PageSectionTypeLanguages_Languages]

ALTER TABLE [dbo].[PageSectionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypeLanguages_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])

ALTER TABLE [dbo].[PageSectionTypeLanguages] CHECK CONSTRAINT [FK_PageSectionTypeLanguages_PageSectionTypes]

ALTER TABLE [dbo].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_AddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])

ALTER TABLE [dbo].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_AddressTypes]

ALTER TABLE [dbo].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])

ALTER TABLE [dbo].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Persons]

ALTER TABLE [dbo].[PersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecoms_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])

ALTER TABLE [dbo].[PersonTelecoms] CHECK CONSTRAINT [FK_PersonTelecoms_Persons]

ALTER TABLE [dbo].[PersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecoms_PersonTelecomPhones] FOREIGN KEY([PersonTelecomID])
REFERENCES [dbo].[PersonTelecomPhones] ([PersonTelecomID])

ALTER TABLE [dbo].[PersonTelecoms] CHECK CONSTRAINT [FK_PersonTelecoms_PersonTelecomPhones]

ALTER TABLE [dbo].[PersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecoms_TelecomTypes] FOREIGN KEY([TelecomTypeID])
REFERENCES [dbo].[TelecomTypes] ([TelecomTypeID])

ALTER TABLE [dbo].[PersonTelecoms] CHECK CONSTRAINT [FK_PersonTelecoms_TelecomTypes]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_Languages]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_PersonTypes] FOREIGN KEY([PersonTypeID])
REFERENCES [dbo].[PersonTypes] ([PersonTypeID])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_PersonTypes]

ALTER TABLE [dbo].[PreferenceTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PreferenceTypeLanguages] CHECK CONSTRAINT [FK_PreferenceTypeLanguages_Languages]

ALTER TABLE [dbo].[PreferenceTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceTypeLanguages_PreferenceTypes] FOREIGN KEY([PreferenceTypeID])
REFERENCES [dbo].[PreferenceTypes] ([PreferenceTypeID])

ALTER TABLE [dbo].[PreferenceTypeLanguages] CHECK CONSTRAINT [FK_PreferenceTypeLanguages_PreferenceTypes]

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_AspNetUsers]

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_AspNetUsers1]

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_ProcessMultis] FOREIGN KEY([ProcessMultiID])
REFERENCES [dbo].[ProcessMultis] ([ProcessMultiID])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_ProcessMultis]

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_ProcessTemplates]

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_ProcessTemplateStages] FOREIGN KEY([StageID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_AspNetUsers]

ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_AspNetUsers1]

ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_Processes] FOREIGN KEY([ProcessID])
REFERENCES [dbo].[Processes] ([ProcessID])

ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_Processes]

ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_ProcessTemplateFields] FOREIGN KEY([ProcessTemplateFieldID])
REFERENCES [dbo].[ProcessTemplateFields] ([ProcessTemplateFieldID])

ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_ProcessTemplateFields]

ALTER TABLE [dbo].[ProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ProcessMultis_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessMultis] CHECK CONSTRAINT [FK_ProcessMultis_AspNetUsers]

ALTER TABLE [dbo].[ProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ProcessMultis_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessMultis] CHECK CONSTRAINT [FK_ProcessMultis_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_ProcessTemplateFields] FOREIGN KEY([ProcessTemplateFieldID])
REFERENCES [dbo].[ProcessTemplateFields] ([ProcessTemplateFieldID])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_ProcessTemplateFields]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplateFieldTypes] FOREIGN KEY([ProcessTemplateFieldTypeID])
REFERENCES [dbo].[ProcessTemplateFieldTypes] ([ProcessTemplateFieldTypeID])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplateFieldTypes]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplates]

ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_ProcessTemplateFieldTypes] FOREIGN KEY([ProcessTemplateFieldTypeID])
REFERENCES [dbo].[ProcessTemplateFieldTypes] ([ProcessTemplateFieldTypeID])

ALTER TABLE [dbo].[ProcessTemplateFieldTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypeLanguages_ProcessTemplateFieldTypes]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_ProcessTemplateFlowConditions] FOREIGN KEY([ProcessTemplateFlowConditionID])
REFERENCES [dbo].[ProcessTemplateFlowConditions] ([ProcessTemplateFlowConditionID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_ProcessTemplateFlowConditions]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlowConditionTypes] FOREIGN KEY([ProcessTemplateConditionTypeID])
REFERENCES [dbo].[ProcessTemplateFlowConditionTypes] ([ProcessTemplateFlowConditionTypeID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlowConditionTypes]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlows] FOREIGN KEY([ProcessTemplateFlowID])
REFERENCES [dbo].[ProcessTemplateFlows] ([ProcessTemplateFlowID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlows]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_ProcessTemplateFlowConditionTypes] FOREIGN KEY([ProcessTemplateFlowTypeConditionID])
REFERENCES [dbo].[ProcessTemplateFlowConditionTypes] ([ProcessTemplateFlowConditionTypeID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypeLanguages_ProcessTemplateFlowConditionTypes]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_ProcessTemplateFlows] FOREIGN KEY([ProcessTemplateFlowID])
REFERENCES [dbo].[ProcessTemplateFlows] ([ProcessTemplateFlowID])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_ProcessTemplateFlows]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplates]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateStages] FOREIGN KEY([ProcessTemplateFromStageID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateStages1] FOREIGN KEY([ProcessTemplateToStageID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateStages1]

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroupLanguages_ProcessTemplateGroups] FOREIGN KEY([ProcessTemplateGroupID])
REFERENCES [dbo].[ProcessTemplateGroups] ([ProcessTemplateGroupID])

ALTER TABLE [dbo].[ProcessTemplateGroupLanguages] CHECK CONSTRAINT [FK_ProcessTemplateGroupLanguages_ProcessTemplateGroups]

ALTER TABLE [dbo].[ProcessTemplateGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateGroups] CHECK CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateGroups] CHECK CONSTRAINT [FK_ProcessTemplateGroups_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateLanguages_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateLanguages] CHECK CONSTRAINT [FK_ProcessTemplateLanguages_ProcessTemplates]

ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_ProcessTemplateGroups] FOREIGN KEY([ProcessTemplateGroupID])
REFERENCES [dbo].[ProcessTemplateGroups] ([ProcessTemplateGroupID])

ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_ProcessTemplateGroups]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateFields] FOREIGN KEY([ProcessTemplateFieldID])
REFERENCES [dbo].[ProcessTemplateFields] ([ProcessTemplateFieldID])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateFields]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStageFieldStatuses] FOREIGN KEY([ProcessTemplateStageFieldStatusID])
REFERENCES [dbo].[ProcessTemplateStageFieldStatuses] ([ProcessTemplateStageFieldStatusID])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStageFieldStatuses]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStages] FOREIGN KEY([ProcessTemplateStageID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_ProcessTemplateStageFieldStatuses] FOREIGN KEY([ProcessTemplateStageFieldStatusID])
REFERENCES [dbo].[ProcessTemplateStageFieldStatuses] ([ProcessTemplateStageFieldStatusID])

ALTER TABLE [dbo].[ProcessTemplateStageFieldStatusLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageFieldStatusLanguages_ProcessTemplateStageFieldStatuses]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_ProcessTemplateStages] FOREIGN KEY([ProcessTemplateStageID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessTemplateStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateStages] CHECK CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplates]

ALTER TABLE [dbo].[ProcessTemplateStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplateStageTypes] FOREIGN KEY([ProcessTemplateStageTypeID])
REFERENCES [dbo].[ProcessTemplateStageTypes] ([ProcessTemplateStageTypeID])

ALTER TABLE [dbo].[ProcessTemplateStages] CHECK CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplateStageTypes]

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_ProcessTemplateStageTypes] FOREIGN KEY([ProcessTemplateStageTypeID])
REFERENCES [dbo].[ProcessTemplateStageTypes] ([ProcessTemplateStageTypeID])

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_ProcessTemplateStageTypes]

ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_Languages]

ALTER TABLE [dbo].[ProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectLanguages_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[ProjectLanguages] CHECK CONSTRAINT [FK_ProjectLanguages_Projects]

ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_AspNetUsers]

ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_AspNetUsers1]

ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Projects] FOREIGN KEY([ParentProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Projects]

ALTER TABLE [dbo].[RegionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RegionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[RegionLanguages] CHECK CONSTRAINT [FK_RegionLanguages_Languages]

ALTER TABLE [dbo].[RegionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RegionLanguages_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])

ALTER TABLE [dbo].[RegionLanguages] CHECK CONSTRAINT [FK_RegionLanguages_Regions]

ALTER TABLE [dbo].[SecurityLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[SecurityLevelLanguages] CHECK CONSTRAINT [FK_SecurityLevelLanguages_Languages]

ALTER TABLE [dbo].[SecurityLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelLanguages_Languages1] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[SecurityLevelLanguages] CHECK CONSTRAINT [FK_SecurityLevelLanguages_Languages1]

ALTER TABLE [dbo].[SecurityLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelLanguages_SecurityLevels] FOREIGN KEY([SecurityLevelID])
REFERENCES [dbo].[SecurityLevels] ([SecurityLevelID])

ALTER TABLE [dbo].[SecurityLevelLanguages] CHECK CONSTRAINT [FK_SecurityLevelLanguages_SecurityLevels]

ALTER TABLE [dbo].[SettingLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SettingLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[SettingLanguages] CHECK CONSTRAINT [FK_SettingLanguages_Languages]

ALTER TABLE [dbo].[SettingLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SettingLanguages_Settings] FOREIGN KEY([SettingID])
REFERENCES [dbo].[Settings] ([SettingID])

ALTER TABLE [dbo].[SettingLanguages] CHECK CONSTRAINT [FK_SettingLanguages_Settings]

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_AspNetUsers]

ALTER TABLE [dbo].[SortByLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SortByLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[SortByLanguages] CHECK CONSTRAINT [FK_SortByLanguages_Languages]

ALTER TABLE [dbo].[SortByLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SortByLanguages_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])

ALTER TABLE [dbo].[SortByLanguages] CHECK CONSTRAINT [FK_SortByLanguages_SortBys]

ALTER TABLE [dbo].[StatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbStatusLanguage_DbLanguage] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[StatusLanguages] CHECK CONSTRAINT [FK_DbStatusLanguage_DbLanguage]

ALTER TABLE [dbo].[StatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_DbStatusLanguage_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[StatusLanguages] CHECK CONSTRAINT [FK_DbStatusLanguage_DbStatus]

ALTER TABLE [dbo].[SubRegionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SubRegionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[SubRegionLanguages] CHECK CONSTRAINT [FK_SubRegionLanguages_Languages]

ALTER TABLE [dbo].[SubRegionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_SubRegionLanguages_SubRegions] FOREIGN KEY([SubRegionID])
REFERENCES [dbo].[SubRegions] ([SubRegionID])

ALTER TABLE [dbo].[SubRegionLanguages] CHECK CONSTRAINT [FK_SubRegionLanguages_SubRegions]

ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_SubRegions_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])

ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_SubRegions_Regions]

ALTER TABLE [dbo].[TelecomTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_TelecomTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[TelecomTypeLanguages] CHECK CONSTRAINT [FK_TelecomTypeLanguages_Languages]

ALTER TABLE [dbo].[TelecomTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_TelecomTypeLanguages_TelecomTypes] FOREIGN KEY([TelecomTypeID])
REFERENCES [dbo].[TelecomTypes] ([TelecomTypeID])

ALTER TABLE [dbo].[TelecomTypeLanguages] CHECK CONSTRAINT [FK_TelecomTypeLanguages_TelecomTypes]

ALTER TABLE [dbo].[UITermLanguageCustomizations]  WITH CHECK ADD  CONSTRAINT [FK_UITermLanguageCustomizations_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[UITermLanguageCustomizations] CHECK CONSTRAINT [FK_UITermLanguageCustomizations_Languages]

ALTER TABLE [dbo].[UITermLanguageCustomizations]  WITH CHECK ADD  CONSTRAINT [FK_UITermLanguageCustomizations_UITerms] FOREIGN KEY([UITermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UITermLanguageCustomizations] CHECK CONSTRAINT [FK_UITermLanguageCustomizations_UITerms]

ALTER TABLE [dbo].[UITermLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UITermLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[UITermLanguages] CHECK CONSTRAINT [FK_UITermLanguages_Languages]

ALTER TABLE [dbo].[UITermLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UITermLanguages_UITerms] FOREIGN KEY([UITermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UITermLanguages] CHECK CONSTRAINT [FK_UITermLanguages_UITerms]

ALTER TABLE [dbo].[UserMenuLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuLanguages_UserMenus] FOREIGN KEY([UserMenuID])
REFERENCES [dbo].[UserMenus] ([UserMenuID])

ALTER TABLE [dbo].[UserMenuLanguages] CHECK CONSTRAINT [FK_UserMenuLanguages_UserMenus]

ALTER TABLE [dbo].[UserMenuUsers]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuUsers_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuUsers] CHECK CONSTRAINT [FK_UserMenuUsers_AspNetUsers]

ALTER TABLE [dbo].[UserMenuUsers]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuUsers_UserMenus] FOREIGN KEY([UserMenuID])
REFERENCES [dbo].[UserMenus] ([UserMenuID])

ALTER TABLE [dbo].[UserMenuUsers] CHECK CONSTRAINT [FK_UserMenuUsers_UserMenus]

ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferences_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserPreferences] CHECK CONSTRAINT [FK_UserPreferences_AspNetUsers]

ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferences_PreferenceTypes] FOREIGN KEY([PreferenceTypeID])
REFERENCES [dbo].[PreferenceTypes] ([PreferenceTypeID])

ALTER TABLE [dbo].[UserPreferences] CHECK CONSTRAINT [FK_UserPreferences_PreferenceTypes]
