
/****** Object:  Table [dbo].[AddressTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AddressTypes](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
	[ModifierID] [nvarchar](450) NULL,
	[ModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[RoleGroupID] [int] NULL,
	[OrganizationId] [int] NULL,
	[ProjectId] [int] NULL,
	[CanAssignContentOwnership] [bit] NOT NULL,
	[CanReceiveContentOwnership] [bit] NOT NULL,
	[CanAssignContentRead] [bit] NOT NULL,
	[CanReceiveContentRead] [bit] NOT NULL,
	[CanAssignContentEdit] [bit] NOT NULL,
	[CanReceiveContentEdit] [bit] NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ClaimGroups]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClaimGroups](
	[ClaimGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ClaimGroups] PRIMARY KEY CLUSTERED 
(
	[ClaimGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Claims]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Claims](
	[ClaimID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimGroupID] [int] NOT NULL,
	[ClaimType] [nchar](50) NOT NULL,
	[ClaimValue] [nchar](50) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[FullText]  AS (([Name]+' ')+[Description]),
 CONSTRAINT [PK_ClassificationLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationLevelLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationLevelLanguages](
	[ClassificationLevelLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ClassificationLevelProperties]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationLevelProperties](
	[ClassificationLevelPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationLevelID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ClassificationLevelPropertyStatusId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationLevelProperties] PRIMARY KEY CLUSTERED 
(
	[ClassificationLevelPropertyID] ASC,
	[ClassificationLevelID] ASC,
	[ClassificationID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationLevelPropertyStatuses]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationLevelPropertyStatuses](
	[ClassificationLevelPropertyStatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ClassificationLevelPropertyStatuses] PRIMARY KEY CLUSTERED 
(
	[ClassificationLevelPropertyStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationLevels]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[ClassificationLevelID] ASC,
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationPageLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationPageLanguages](
	[ClassificationPageLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ClassificationPages]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[ClassificationPageID] ASC,
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationPageSectionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationPageSectionLanguages](
	[ClassificationPageSectionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ClassificationPageID] [int] NOT NULL,
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
 CONSTRAINT [PK_ClassificationPageSectionLanguages_Name] PRIMARY KEY CLUSTERED 
(
	[ClassificationPageSectionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationPageSections]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationPageSections](
	[ClassificationPageSectionID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ClassificationPageID] [int] NOT NULL,
	[PageSectionTypeID] [int] NOT NULL,
	[PageSectionDataTypeID] [int] NOT NULL,
	[ShowSectionTitleName] [bit] NOT NULL,
	[ShowSectionTitleDescription] [bit] NOT NULL,
	[ShowContentTypeTitleName] [bit] NOT NULL,
	[ShowContentTypeTitleDescription] [bit] NOT NULL,
	[QueryBuilderRule] [nvarchar](max) NULL,
	[SizeX] [int] NOT NULL,
	[SizeY] [int] NOT NULL,
	[DashboardRow] [int] NOT NULL,
	[DashboardColumn] [int] NOT NULL,
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
	[ClassificationPageSectionID] ASC,
	[ClassificationID] ASC,
	[ClassificationPageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationRelationTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationRelationTypeLanguages](
	[ClassificationRelationTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationRelationTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationRelationTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationRelationTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationRelationTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationRelationTypes](
	[ClassificationRelationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationRelationTypes] PRIMARY KEY CLUSTERED 
(
	[ClassificationRelationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationRoles]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationRoles](
	[ClassificationRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [nvarchar](450) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ClassificationRelationTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationRoles] PRIMARY KEY CLUSTERED 
(
	[ClassificationRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Classifications]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Classifications](
	[ClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[DefaultPageID] [int] NULL,
	[HasDropDown] [bit] NOT NULL,
	[DropDownSequence] [int] NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Classifications] PRIMARY KEY CLUSTERED 
(
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationUsers]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationUsers](
	[ClassificationUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ClassificationRelationTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationUsers] PRIMARY KEY CLUSTERED 
(
	[ClassificationUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValueLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValueLanguages](
	[ClassificationValueLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
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
	[FullText]  AS (([Name]+' ')+[Description]),
 CONSTRAINT [PK_ClassificationValueLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValueProperties]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValueProperties](
	[ClassificationValuePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[PropertyValueID] [int] NULL,
	[PropertyDate] [datetimeoffset](7) NULL,
	[PropertyString] [nvarchar](max) NULL,
	[PropertyInt] [nvarchar](450) NULL,
	[PropertyBool] [bit] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValueProperties] PRIMARY KEY CLUSTERED 
(
	[ClassificationValuePropertyID] ASC,
	[ClassificationValueID] ASC,
	[ClassificationID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValuePropertyLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValuePropertyLanguages](
	[ClassificationValuePropertyLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationValuePropertyID] [int] NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValuePropertyLanguages] PRIMARY KEY CLUSTERED 
(
	[ClassificationValuePropertyLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValueRoles]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValueRoles](
	[ClassificationValueRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [nvarchar](450) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationRelationTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValueRoles] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValues]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[ClassificationValueID] ASC,
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationValueUsers]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValueUsers](
	[ClassificationValueUserID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationRelationTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClassificationValueUsers] PRIMARY KEY CLUSTERED 
(
	[ClassificationValueUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentClassificationValues]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentClassificationValues](
	[ContentClassificationValueID] [int] IDENTITY(1,1) NOT NULL,
	[ContentID] [int] NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentClassificationValues] PRIMARY KEY CLUSTERED 
(
	[ContentClassificationValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Contents]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Contents](
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
	[ProcessID] [int] NULL,
	[FullText]  AS (([Title]+' ')+[Description]),
	[IsOrganizationBasedEdit] [bit] NOT NULL,
	[IsOrganizationBasedEditSub] [bit] NOT NULL,
	[IsOrganizationBasedEditParent] [bit] NOT NULL,
	[IsOrganizationBasedRead] [bit] NOT NULL,
	[IsOrganizationBasedReadSub] [bit] NOT NULL,
	[IsOrganizationBasedReadParent] [bit] NOT NULL,
	[IsProjectBasedEdit] [bit] NOT NULL,
	[IsProjectBasedEditSub] [bit] NOT NULL,
	[IsProjectBasedEditParent] [bit] NOT NULL,
	[IsProjectBasedRead] [bit] NOT NULL,
	[IsProjectBasedReadSub] [bit] NOT NULL,
	[IsProjectBasedReadParent] [bit] NOT NULL,
	[OwnerId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ContentStatuses]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentStatuses](
	[ContentStatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ContentStatuses] PRIMARY KEY CLUSTERED 
(
	[ContentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeClassifications]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ContentTypeClassificationStatuses]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeClassificationStatuses](
	[ContentTypeClassificationStatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ContentTypeClassificationStatus] PRIMARY KEY CLUSTERED 
(
	[ContentTypeClassificationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeGroupLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ContentTypeGroups]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ContentTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ContentTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypes](
	[ContentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeGroupID] [int] NOT NULL,
	[ProcessTemplateID] [int] NULL,
	[SecurityLevelID] [int] NOT NULL,
	[IsRelationBasedOwnership] [bit] NOT NULL,
	[IsProjectBasedOwnership] [bit] NOT NULL,
	[IsOrganizationBasedOwnership] [bit] NOT NULL,
	[IsFreeOwnership] [bit] NOT NULL,
	[IsRelationBasedEdit] [bit] NOT NULL,
	[IsRelationBasedEditSelectable] [bit] NOT NULL,
	[IsOrganizationBasedEdit] [bit] NOT NULL,
	[IsOrganizationBasedEditSelectable] [bit] NOT NULL,
	[IsOrganizationBasedEditSub] [bit] NOT NULL,
	[IsOrganizationBasedEditParent] [bit] NOT NULL,
	[IsProjectBasedEdit] [bit] NOT NULL,
	[IsProjectBasedEditSelectable] [bit] NOT NULL,
	[IsProjectBasedEditSub] [bit] NOT NULL,
	[IsProjectBasedEditParent] [bit] NOT NULL,
	[IsFreeEdit] [bit] NOT NULL,
	[IsFreeEditSelectable] [bit] NOT NULL,
	[IsRelationBasedRead] [bit] NOT NULL,
	[IsRelationBasedReadSelectable] [bit] NOT NULL,
	[IsOrganizationBasedRead] [bit] NOT NULL,
	[IsOrganizationBasedReadSelectable] [bit] NOT NULL,
	[IsOrganizationBasedReadSub] [bit] NOT NULL,
	[IsOrganizationBasedReadParent] [bit] NOT NULL,
	[IsProjectBasedRead] [bit] NOT NULL,
	[IsProjectBasedReadSelectable] [bit] NOT NULL,
	[IsProjectBasedReadSub] [bit] NOT NULL,
	[IsProjectBasedReadParent] [bit] NOT NULL,
	[IsFreeRead] [bit] NOT NULL,
	[IsFreeReadSelectable] [bit] NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED 
(
	[ContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentUserEdit]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentUserEdit](
	[ContentUserEditID] [int] IDENTITY(1,1) NOT NULL,
	[ContentID] [int] NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentUserEdit] PRIMARY KEY CLUSTERED 
(
	[ContentUserEditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentUserRead]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentUserRead](
	[ContentUserReadID] [int] IDENTITY(1,1) NOT NULL,
	[ContentID] [int] NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentUserRead] PRIMARY KEY CLUSTERED 
(
	[ContentUserReadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Countries]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[NameTermID] [int] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[DateLevels]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DateLevels](
	[DateLevelID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_DateLevels] PRIMARY KEY CLUSTERED 
(
	[DateLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ErrorMessages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ErrorMessages](
	[ErrorMessageID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ErrorMessages] PRIMARY KEY CLUSTERED 
(
	[ErrorMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Genders]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Genders](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Icons]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Icons](
	[IconId] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[FileName] [nchar](20) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
 CONSTRAINT [PK_Icons] PRIMARY KEY CLUSTERED 
(
	[IconId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[IntermediateRegions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[IntermediateRegions](
	[IntermediateRegionID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_IntermediateRegions] PRIMARY KEY CLUSTERED 
(
	[IntermediateRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Languages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ForeignName] [nvarchar](max) NOT NULL,
	[ISO6391] [char](2) NOT NULL,
	[ISO6392] [char](3) NOT NULL,
	[StatusID] [int] NOT NULL,
	[NameTermID] [int] NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Menu1]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Menu1](
	[Menu1] [int] IDENTITY(1,1) NOT NULL,
	[MenuTypeID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ClassificationID] [int] NULL,
	[PageID] [int] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu1Options] PRIMARY KEY CLUSTERED 
(
	[Menu1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Menu1Languages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Menu1Languages](
	[Menu1LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Menu1ID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu1OptionLanguages] PRIMARY KEY CLUSTERED 
(
	[Menu1LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Menu2]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Menu2](
	[Menu2ID] [int] IDENTITY(1,1) NOT NULL,
	[Menu1ID] [int] NOT NULL,
	[MenuTypeID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[PageID] [int] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu2Options] PRIMARY KEY CLUSTERED 
(
	[Menu2ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Menu2Languages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Menu2Languages](
	[Menu2LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Menu2ID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu2OptionLanguages] PRIMARY KEY CLUSTERED 
(
	[Menu2LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Menu3]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Menu3](
	[Menu3OptionID] [int] IDENTITY(1,1) NOT NULL,
	[Menu2OptionID] [int] NOT NULL,
	[MenuTypeID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Menu3Options] PRIMARY KEY CLUSTERED 
(
	[Menu3OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Menu3Languages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Menu3Languages](
	[Menu3OptionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Menu3OptionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[MenuTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MenuTypes](
	[MenuTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
	[FirstLevelOnly] [bit] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_MenuTypes] PRIMARY KEY CLUSTERED 
(
	[MenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MVCUIScreenLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[MVCUIScreens]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[MVCUITermScreens]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[OrganizationAddresses]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[ProvinceState] [nvarchar](50) NULL,
	[County] [nvarchar](50) NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationAddresses] PRIMARY KEY CLUSTERED 
(
	[OrganizationAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[FullText]  AS (([Name]+' ')+[Description]),
 CONSTRAINT [PK_OrganizationLanguages] PRIMARY KEY CLUSTERED 
(
	[OrganizationLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Organizations]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[OrganizationSettings]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationSettings](
	[OrganizationSettingID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationSettingTypeID] [int] NOT NULL,
	[OrganizationID] [int] NULL,
	[IntValue] [int] NULL,
	[StringValue] [nvarchar](max) NULL,
	[DateTimeValue] [datetime2](7) NULL,
	[GuidValue] [uniqueidentifier] NULL,
	[LocationValue] [geography] NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationSettings] PRIMARY KEY CLUSTERED 
(
	[OrganizationSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationSettingTypeGroups]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationSettingTypeGroups](
	[OrganizationSettingTypeGroupID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_OrganizationSettingTypeGroups] PRIMARY KEY CLUSTERED 
(
	[OrganizationSettingTypeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationSettingTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationSettingTypes](
	[OrganizationSettingTypeID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationSettingTypeGroupID] [int] NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_OrganizationSettingTypes] PRIMARY KEY CLUSTERED 
(
	[OrganizationSettingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTelecomPhones]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[OrganizationTelecoms]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTelecoms](
	[OrganizationTelecomID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[TelecomTypeID] [int] NOT NULL,
	[TelecomValue] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTelecoms] PRIMARY KEY CLUSTERED 
(
	[OrganizationTelecomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypes](
	[OrganizationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Internal] [bit] NOT NULL,
	[LegalEntity] [bit] NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypes] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[PageLanguageID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Pages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[StatusID] [int] NOT NULL,
	[ShowTitleName] [bit] NOT NULL,
	[ShowTitleDescription] [bit] NOT NULL,
	[UserID] [nvarchar](450) NULL,
	[OrganizationID] [int] NULL,
	[ProjectID] [int] NULL,
	[ClassificationID] [int] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionClassificationValueConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionClassificationValueConditionLanguages](
	[PageSectionClassificationValueConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageSectionClassificationValueConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionClassificationValueConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionClassificationValueConditionLanguageID] ASC,
	[PageID] ASC,
	[PageSectionID] ASC,
	[PageSectionClassificationValueConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionClassificationValueConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionClassificationValueConditions](
	[PageSectionClassificationValueConditionID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionClassificationValueConditionTypeId] [int] NOT NULL,
	[PageSectionClassificationValueConditionInt] [int] NULL,
	[PageSectionClassificationValueConditionString] [nvarchar](max) NULL,
	[PageSectionClassificationValueConditionDate] [datetime] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionClassificationValueConditions] PRIMARY KEY CLUSTERED 
(
	[PageSectionClassificationValueConditionID] ASC,
	[PageSectionID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionClassificationValueConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionClassificationValueConditionTypes](
	[PageSectionClassificationValueConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PageSectionClassificationValueConditionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionClassificationValueConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionContentConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionContentConditionLanguages](
	[PageSectionContentConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageSectionContentConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionContentConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionContentConditionLanguageID] ASC,
	[PageID] ASC,
	[PageSectionID] ASC,
	[PageSectionContentConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionContentConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionContentConditions](
	[PageSectionContentConditionID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionContentConditionTypeId] [int] NOT NULL,
	[PageSectionContentConditionInt] [int] NULL,
	[PageSectionContentConditionString] [nvarchar](max) NULL,
	[PageSectionContentConditionDate] [datetime] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionContentConditions] PRIMARY KEY CLUSTERED 
(
	[PageSectionContentConditionID] ASC,
	[PageSectionID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionContentConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionContentConditionTypes](
	[PageSectionContentConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PageSectionContentConditionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionContentConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionDataTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionDataTypes](
	[PageSectionDataTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PageSectionDataTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionDataTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionLanguages](
	[PageSectionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[PageSectionOrganizationConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionOrganizationConditionLanguages](
	[PageSectionOrganizationConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageSectionOrganizationConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionOrganizationConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionOrganizationConditionLanguageID] ASC,
	[PageID] ASC,
	[PageSectionID] ASC,
	[PageSectionOrganizationConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionOrganizationConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionOrganizationConditions](
	[PageSectionOrganizationConditionID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionOrganizationConditionTypeId] [int] NOT NULL,
	[PageSectionOrganizationConditionInt] [int] NULL,
	[PageSectionOrganizationConditionString] [nvarchar](max) NULL,
	[PageSectionOrganizationConditionDate] [datetime] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionOrganizationConditions] PRIMARY KEY CLUSTERED 
(
	[PageSectionOrganizationConditionID] ASC,
	[PageSectionID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionOrganizationConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionOrganizationConditionTypes](
	[PageSectionOrganizationConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_PageSectionOrganizationConditionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionOrganizationConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionPersonConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionPersonConditionLanguages](
	[PageSectionPersonConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageSectionPersonConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionPersonConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionPersonConditionLanguageID] ASC,
	[PageID] ASC,
	[PageSectionID] ASC,
	[PageSectionPersonConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionPersonConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionPersonConditions](
	[PageSectionPersonConditionID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionPersonConditionTypeId] [int] NOT NULL,
	[PageSectionPersonConditionInt] [int] NULL,
	[PageSectionPersonConditionString] [nvarchar](max) NULL,
	[PageSectionPersonConditionDate] [datetime] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionPersonConditions] PRIMARY KEY CLUSTERED 
(
	[PageSectionPersonConditionID] ASC,
	[PageSectionID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionPersonConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionPersonConditionTypes](
	[PageSectionPersonConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PageSectionPersonConditionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionPersonConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionProcessConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionProcessConditionLanguages](
	[PageSectionProcessConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageSectionProcessConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionProcessConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionProcessConditionLanguageID] ASC,
	[PageID] ASC,
	[PageSectionID] ASC,
	[PageSectionProcessConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionProcessConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionProcessConditions](
	[PageSectionProcessConditionID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionProcessConditionTypeId] [int] NOT NULL,
	[PageSectionProcessConditionInt] [int] NULL,
	[PageSectionProcessConditionString] [nvarchar](max) NULL,
	[PageSectionProcessConditionDate] [datetime] NULL,
	[PageSectionProcessConditionBit] [bit] NULL,
	[RoleRelationId] [int] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionProcessConditions] PRIMARY KEY CLUSTERED 
(
	[PageSectionProcessConditionID] ASC,
	[PageSectionID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionProcessConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionProcessConditionTypes](
	[PageSectionProcessConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PageSectionProcessConditionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionProcessConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionProjectConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionProjectConditionLanguages](
	[PageSectionProjectConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageSectionProjectConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionProjectConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[PageSectionProjectConditionLanguageID] ASC,
	[PageID] ASC,
	[PageSectionID] ASC,
	[PageSectionProjectConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionProjectConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionProjectConditions](
	[PageSectionProjectConditionID] [int] IDENTITY(1,1) NOT NULL,
	[PageSectionID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionProjectConditionTypeId] [int] NOT NULL,
	[PageSectionProjectConditionInt] [int] NULL,
	[PageSectionProjectConditionString] [nvarchar](max) NULL,
	[PageSectionProjectConditionDate] [datetime] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PageSectionProjectConditions] PRIMARY KEY CLUSTERED 
(
	[PageSectionProjectConditionID] ASC,
	[PageSectionID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionProjectConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionProjectConditionTypes](
	[PageSectionProjectConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PageSectionProjectConditionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionProjectConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PageSections]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSections](
	[PageSectionID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[PageSectionTypeID] [int] NOT NULL,
	[PageSectionDataTypeID] [int] NOT NULL,
	[ShowSectionTitleName] [bit] NOT NULL,
	[ShowSectionTitleDescription] [bit] NOT NULL,
	[ShowContentTypeTitleName] [bit] NOT NULL,
	[ShowContentTypeTitleDescription] [bit] NOT NULL,
	[QueryBuilderRule] [nvarchar](max) NULL,
	[SizeX] [int] NOT NULL,
	[SizeY] [int] NOT NULL,
	[DashboardRow] [int] NOT NULL,
	[DashboardColumn] [int] NOT NULL,
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
	[PageSectionID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PageSectionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PageSectionTypes](
	[PageSectionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PageSectionTypes] PRIMARY KEY CLUSTERED 
(
	[PageSectionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonAddresses]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[ProvinceState] [nvarchar](50) NULL,
	[County] [nvarchar](50) NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonAddresses] PRIMARY KEY CLUSTERED 
(
	[PersonAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PersonRelations]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonRelations](
	[PersonRelationID] [int] IDENTITY(1,1) NOT NULL,
	[FromPersonID] [int] NOT NULL,
	[ToPersonID] [int] NOT NULL,
	[ValidFrom] [datetime] NOT NULL,
	[ValidTill] [datetime] NULL,
	[PersonRelationTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonRelations] PRIMARY KEY CLUSTERED 
(
	[PersonRelationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonRelationTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonRelationTypeLanguages](
	[PersonRelationTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PersonRelationTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[FromIsAnXOfTo] [nvarchar](50) NOT NULL,
	[ToIsAnXOfFrom] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonRelationTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[PersonRelationTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PersonRelationTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonRelationTypes](
	[PersonRelationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SeePersonal] [bit] NOT NULL,
	[CanAssignOwnershipFromTo] [bit] NOT NULL,
	[CanAssignOwnershipToFrom] [bit] NOT NULL,
	[CanAssignEditFromTo] [bit] NULL,
	[CanAssignEditToFrom] [bit] NULL,
	[CanAssignReadFromTo] [bit] NULL,
	[CanAssignReadToFrom] [bit] NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonRelationTypes] PRIMARY KEY CLUSTERED 
(
	[PersonRelationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Persons]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[DefaultOrganizationID] [int] NOT NULL,
	[UserID] [nvarchar](450) NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[FullText]  AS (((((((((((([FirstName]+' ')+[MiddleName])+' ')+[LastName])+' ')+[NickName])+' ')+[FirstNameLocal])+' ')+[MiddleNameLocal])+' ')+[LastNameLocal]),
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTelecomPhones]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[PersonTelecoms]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTelecoms](
	[PersonTelecomID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[TelecomTypeID] [int] NOT NULL,
	[TelecomValue] [nvarchar](50) NOT NULL,
	[CreatorID] [nchar](450) NOT NULL,
	[ModifierID] [nchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonTelecoms] PRIMARY KEY CLUSTERED 
(
	[PersonTelecomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PreferenceTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PreferenceTypes](
	[PreferenceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_PreferenceTypes] PRIMARY KEY CLUSTERED 
(
	[PreferenceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Processes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Processes](
	[ProcessID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateStageID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ProcessMultiID] [int] NULL,
 CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED 
(
	[ProcessID] ASC,
	[ProcessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessFields]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessFields](
	[ProcessFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[StringValue] [nvarchar](max) NULL,
	[IntValue] [int] NULL,
	[LocationValue] [geography] NULL,
	[DateTimeValue] [datetime] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessFields] PRIMARY KEY CLUSTERED 
(
	[ProcessFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessMultis]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ProcessTemplateFieldConditionComparisonOperators]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators](
	[ProcessTemplateFieldConditionComparisonOperatorID] [int] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](2) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTemplateFieldConditionComparisonOperators] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldConditionComparisonOperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFieldConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFieldConditionLanguages](
	[ProcessTemplateFieldConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[ProcessTemplateFieldConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldConditionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFieldConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFieldConditions](
	[ProcessTemplateFieldConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ProcessTemplateFieldConditionTypeID] [int] NOT NULL,
	[ComparisonOperatorID] [int] NULL,
	[ProcessTemplateFieldConditionString] [nvarchar](max) NULL,
	[ProcessTemplateFieldConditionInt] [int] NULL,
	[ProcessTemplateFieldConditionDate] [datetime2](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldConditions] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldConditionID] ASC,
	[ProcessTemplateID] ASC,
	[ProcessTemplateFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFieldConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFieldConditionTypes](
	[ProcessTemplateFieldConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateFieldTypeID] [int] NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldConditionTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFieldLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFieldLanguages](
	[ProcessTemplateFieldLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
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
	[MissingValueText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFields]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[ProcessTemplateFieldID] ASC,
	[ProcessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFieldTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFieldTypes](
	[ProcessTemplateFieldTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFieldTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFieldTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowConditionComparisonOperators]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators](
	[ProcessTemplateFlowConditionComparisonOperatorID] [int] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](2) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTemplateFlowConditionComparisonOperators] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowConditionComparisonOperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowConditionLanguages](
	[ProcessTemplateFlowConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFlowID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ProcessTemplateFlowConditions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowConditions](
	[ProcessTemplateFlowConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFlowID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ProcessTemplateFlowConditionTypeID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NULL,
	[ProcessTemplateFieldIDRole] [int] NULL,
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
	[ProcessTemplateFlowConditionID] ASC,
	[ProcessTemplateID] ASC,
	[ProcessTemplateFlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowConditionTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowConditionTypes](
	[ProcessTemplateFlowConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowConditionTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowLanguages](
	[ProcessTemplateFlowLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ProcessTemplateFlowPassComparisonOperators]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators](
	[ProcessTemplateFlowPassComparisonOperatorID] [int] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](2) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTemplateFlowPassComparisonOperators] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowPassComparisonOperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowPasses]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowPasses](
	[ProcessTemplateFlowPassID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFlowID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ProcessTemplateFlowPassTypeID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NULL,
	[ProcessTemplateFieldIDRole] [int] NULL,
	[ComparisonOperatorID] [int] NULL,
	[ProcessTemplateFlowPassString] [nvarchar](max) NULL,
	[ProcessTemplateFlowPassInt] [int] NULL,
	[ProcessTemplateFlowPassDate] [datetime2](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowPasses] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowPassID] ASC,
	[ProcessTemplateID] ASC,
	[ProcessTemplateFlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowPassLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowPassLanguages](
	[ProcessTemplateFlowPassLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateFlowID] [int] NOT NULL,
	[ProcessTemplateFlowPassID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowPassLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowPassLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlowPassTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateFlowPassTypes](
	[ProcessTemplateFlowPassTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTemplateFlowPassTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateFlowPassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateFlows]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[ProcessTemplateFlowID] ASC,
	[ProcessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateGroupLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ProcessTemplateGroups]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ProcessTemplateLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[ProcessTemplates]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplates](
	[ProcessTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateGroupID] [int] NOT NULL,
	[ShowInPersonalCalendar] [bit] NOT NULL,
	[ShowInOrganizationCalendar] [bit] NULL,
	[ShowInProjectCalendar] [bit] NULL,
	[ShowInEventCalendar] [bit] NOT NULL,
	[ProcessMultiMax] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsPersonal] [bit] NOT NULL,
	[ShowInNew] [bit] NOT NULL,
	[ShowInSearch] [bit] NOT NULL,
	[ShowInReports] [bit] NOT NULL,
	[HideEverywhere] [bit] NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplates] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageFields]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageFields](
	[ProcessTemplateStageFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateStageID] [int] NOT NULL,
	[ProcessTemplateFieldID] [int] NOT NULL,
	[ProcessTemplateStageFieldStatusID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ValueUpdateTypeID] [int] NOT NULL,
	[StringValue] [nvarchar](max) NULL,
	[IntValue] [int] NULL,
	[LocationValue] [geography] NULL,
	[DateTimeValue] [datetime2](7) NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageFields] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageFieldStatuses]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageFieldStatuses](
	[ProcessTemplateStageFieldStatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTemplateStageFieldStatuses] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageFieldStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageLanguages](
	[ProcessTemplateStageLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ProcessTemplateStages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStages](
	[ProcessTemplateStageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTemplateID] [int] NOT NULL,
	[ProcessTemplateStageTypeID] [int] NOT NULL,
	[InToDo] [bit] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageID] ASC,
	[ProcessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTemplateStageTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTemplateStageTypes](
	[ProcessTemplateStageTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTemplateStageTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTemplateStageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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
	[FullText]  AS (([Name]+' ')+[Description]),
 CONSTRAINT [PK_ProjectLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Projects]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ParentProjectID] [int] NULL,
	[ProjectTypeID] [int] NOT NULL,
	[SecurityLevelID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ProjectTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeLanguages](
	[ProjectTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypes](
	[ProjectTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypes] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Properties]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Properties](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PropertyLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PropertyLanguages](
	[PropertyLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PropertyLanguages] PRIMARY KEY CLUSTERED 
(
	[PropertyLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PropertyTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PropertyTypes](
	[PropertyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PropertyTypes] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PropertyValueLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PropertyValueLanguages](
	[PropertyValueLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[PropertyValueID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PropertyValueLanguages] PRIMARY KEY CLUSTERED 
(
	[PropertyValueLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PropertyValues]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PropertyValues](
	[PropertyValueID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[Sequence] [int] NULL,
	[PropertyValueBool] [bit] NULL,
	[PropertyValueInt] [int] NULL,
	[PropertyValueString] [nvarchar](max) NULL,
	[PropertyValueDate] [datetime] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PropertyValues] PRIMARY KEY CLUSTERED 
(
	[PropertyValueID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Regions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Regions](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RoleGroupLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RoleGroupLanguages](
	[RoleGroupLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[RoleGroupID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RoleGroupLanguages] PRIMARY KEY CLUSTERED 
(
	[RoleGroupLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[RoleGroups]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RoleGroups](
	[RoleGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RoleGroups] PRIMARY KEY CLUSTERED 
(
	[RoleGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RoleLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RoleLanguages](
	[RoleLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [nvarchar](450) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RoleLanguages] PRIMARY KEY CLUSTERED 
(
	[RoleLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[SecurityLevels]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SecurityLevels](
	[SecurityLevelID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
 CONSTRAINT [PK_SecurityLevels] PRIMARY KEY CLUSTERED 
(
	[SecurityLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Settings]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Settings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[IntValue] [int] NULL,
	[StringValue] [nvarchar](max) NULL,
	[DateTimeValue] [datetime2](7) NULL,
	[GuidValue] [uniqueidentifier] NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[TypeID] [int] NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[SortBys]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SortBys](
	[SortByID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_SortBys] PRIMARY KEY CLUSTERED 
(
	[SortByID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Statuses]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Statuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[SubRegions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[SubRegions](
	[SubRegionID] [int] IDENTITY(1,1) NOT NULL,
	[RegionID] [int] NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_SubRegions] PRIMARY KEY CLUSTERED 
(
	[SubRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[TelecomTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[TelecomTypes](
	[TelecomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneProperties] [bit] NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TelecomTypes] PRIMARY KEY CLUSTERED 
(
	[TelecomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UITermLanguageCustomizations]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[UITermLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[UITerms]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UITerms](
	[UITermID] [int] IDENTITY(1,1) NOT NULL,
	[InternalName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_UITerms] PRIMARY KEY CLUSTERED 
(
	[UITermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenus]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenus](
	[UserMenuID] [int] IDENTITY(1,1) NOT NULL,
	[UserMenuTypeIDLeft] [int] NOT NULL,
	[UserMenuTypeIDRight] [int] NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[IconID] [int] NOT NULL,
	[UserPageIdLeft] [int] NOT NULL,
	[UserPageIdRight] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserMenus] PRIMARY KEY CLUSTERED 
(
	[UserMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenuTemplateLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenuTemplateLanguages](
	[UserMenuTemplateLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[UserMenuTemplateId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserMenuTemplateLanguages] PRIMARY KEY CLUSTERED 
(
	[UserMenuTemplateLanguageID] ASC,
	[UserMenuTemplateId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenuTemplateOptionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenuTemplateOptionLanguages](
	[UserMenuTemplateOptionLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[UserMenuTemplateID] [int] NOT NULL,
	[UserMEnuTemplateOptionId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserMenuTemplateOptionLanguages] PRIMARY KEY CLUSTERED 
(
	[UserMenuTemplateOptionLanguageId] ASC,
	[UserMenuTemplateID] ASC,
	[UserMEnuTemplateOptionId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenuTemplateOptions]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenuTemplateOptions](
	[UserMenuTemplateOptionID] [int] IDENTITY(1,1) NOT NULL,
	[UserMenuTemplateId] [int] NOT NULL,
	[UserMenuTypeIDLeft] [int] NOT NULL,
	[UserMenuTypeIDRight] [int] NOT NULL,
	[IconID] [int] NOT NULL,
	[UserPageIdLeft] [int] NOT NULL,
	[UserPageIdRight] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserMenuTemplateOptions] PRIMARY KEY CLUSTERED 
(
	[UserMenuTemplateOptionID] ASC,
	[UserMenuTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenuTemplates]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenuTemplates](
	[UserMenuTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserMenuTemplates] PRIMARY KEY CLUSTERED 
(
	[UserMenuTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserMenuTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserMenuTypes](
	[UserMenuTypeID] [int] NOT NULL,
	[AvailableForLeft] [bit] NULL,
	[AvailableForRight] [bit] NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_UserMenuTypes] PRIMARY KEY CLUSTERED 
(
	[UserMenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserPreferences]    Script Date: 12/23/2020 1:36:09 PM ******/
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

/****** Object:  Table [dbo].[UserPreferenceTypeGroups]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserPreferenceTypeGroups](
	[UserPreferenceTypeGroupID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_UserPreferenceTypeGroups] PRIMARY KEY CLUSTERED 
(
	[UserPreferenceTypeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[UserPreferenceTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserPreferenceTypes](
	[UserPreferenceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserPreferenceTypeGroupID] [int] NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_UserPreferenceTypes] PRIMARY KEY CLUSTERED 
(
	[UserPreferenceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ValueUpdateTypes]    Script Date: 12/23/2020 1:36:09 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ValueUpdateTypes](
	[ValueUpdateTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_[ValueUpdateTypes] PRIMARY KEY CLUSTERED 
(
	[ValueUpdateTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLanguages] ON [dbo].[ClassificationLanguages]
(
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationLevelLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLevelLanguages] ON [dbo].[ClassificationLevelLanguages]
(
	[ClassificationLevelID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationLevelLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLevelLanguages_Name] ON [dbo].[ClassificationLevelLanguages]
(
	[ClassificationID] ASC,
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationLevels]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationLevels] ON [dbo].[ClassificationLevels]
(
	[ClassificationID] ASC,
	[Sequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationPageLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationPageLanguages] ON [dbo].[ClassificationPageLanguages]
(
	[ClassificationPageID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationPageLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationPageLanguages_Name] ON [dbo].[ClassificationPageLanguages]
(
	[ClassificationID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationPageSectionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationPageSectionLanguages] ON [dbo].[ClassificationPageSectionLanguages]
(
	[ClassificationPageSectionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationPageSectionLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationPageSectionLanguages_Name] ON [dbo].[ClassificationPageSectionLanguages]
(
	[ClassificationPageID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationRelationTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationRelationTypeLanguages] ON [dbo].[ClassificationRelationTypeLanguages]
(
	[ClassificationRelationTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationValueLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationValueLanguages] ON [dbo].[ClassificationValueLanguages]
(
	[ClassificationValueID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentTypeClassifications]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypeClassifications] ON [dbo].[ContentTypeClassifications]
(
	[ClassificationID] ASC,
	[ContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentTypeGroupLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_ContentTypeGroupLanguages] ON [dbo].[ContentTypeGroupLanguages]
(
	[ContentTypeGroupID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypeLanguages] ON [dbo].[ContentTypeLanguages]
(
	[ContentTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentUserEdit]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentUserEdit] ON [dbo].[ContentUserEdit]
(
	[ContentUserEditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_MVCUIScreenLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MVCUIScreenLanguages] ON [dbo].[MVCUIScreenLanguages]
(
	[MVCUIScreenID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_OrganizationLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationLanguages] ON [dbo].[OrganizationLanguages]
(
	[OrganizationID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_OrganizationLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationLanguages_Name] ON [dbo].[OrganizationLanguages]
(
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_OrganizationTypeLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationTypeLanguages] ON [dbo].[OrganizationTypeLanguages]
(
	[OrganizationTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_OrganizationTypeLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationTypeLanguages_Name] ON [dbo].[OrganizationTypeLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_PageLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageLanguages] ON [dbo].[PageLanguages]
(
	[PageID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_PageLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageLanguages_Name] ON [dbo].[PageLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_PageSectionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageSectionLanguages] ON [dbo].[PageSectionLanguages]
(
	[PageID] ASC,
	[PageSectionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_PageSectionLanguages_1]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageSectionLanguages_1] ON [dbo].[PageSectionLanguages]
(
	[PageID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTemplateFieldLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateFieldLanguages] ON [dbo].[ProcessTemplateFieldLanguages]
(
	[ProcessTemplateFieldID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTemplateFieldLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateFieldLanguages_Name] ON [dbo].[ProcessTemplateFieldLanguages]
(
	[ProcessTemplateID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTemplateFlowConditionLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateFlowConditionLanguages] ON [dbo].[ProcessTemplateFlowConditionLanguages]
(
	[ProcessTemplateFlowConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTemplateFlowConditionLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateFlowConditionLanguages_Name] ON [dbo].[ProcessTemplateFlowConditionLanguages]
(
	[ProcessTemplateFlowID] ASC,
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTemplateFlowLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateFlowLanguages] ON [dbo].[ProcessTemplateFlowLanguages]
(
	[ProcessTemplateFlowID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTemplateFlowLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateFlowLanguages_Name] ON [dbo].[ProcessTemplateFlowLanguages]
(
	[ProcessTemplateID] ASC,
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTemplateGroupLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateGroupLanguages] ON [dbo].[ProcessTemplateGroupLanguages]
(
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTemplateLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProcessTemplateLanguages] ON [dbo].[ProcessTemplateLanguages]
(
	[ProcessTemplateID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTemplateLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateLanguages_Name] ON [dbo].[ProcessTemplateLanguages]
(
	[LanguageID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTemplateStageFields]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateStageFields] ON [dbo].[ProcessTemplateStageFields]
(
	[ProcessTemplateFieldID] ASC,
	[ProcessTemplateStageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTemplateStageLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateStageLanguages] ON [dbo].[ProcessTemplateStageLanguages]
(
	[ProcessTemplateStageID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTemplateStageLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTemplateStageLanguages_Name] ON [dbo].[ProcessTemplateStageLanguages]
(
	[ProcessTemplateID] ASC,
	[LanguageID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_RoleGroupLanguages]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RoleGroupLanguages] ON [dbo].[RoleGroupLanguages]
(
	[LanguageID] ASC,
	[RoleGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_RoleGroupLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RoleGroupLanguages_Name] ON [dbo].[RoleGroupLanguages]
(
	[LanguageID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_RoleLanguages_Name]    Script Date: 12/23/2020 1:36:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RoleLanguages_Name] ON [dbo].[RoleLanguages]
(
	[LanguageID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

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

ALTER TABLE [dbo].[PersonTelecoms] ADD  CONSTRAINT [DF_PersonTelecoms_CreatorID]  DEFAULT (N'a') FOR [CreatorID]

ALTER TABLE [dbo].[PersonTelecoms] ADD  CONSTRAINT [DF_PersonTelecoms_ModifierID]  DEFAULT (N'a') FOR [ModifierID]

ALTER TABLE [dbo].[PersonTelecoms] ADD  CONSTRAINT [DF_PersonTelecoms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]

ALTER TABLE [dbo].[PersonTelecoms] ADD  CONSTRAINT [DF_PersonTelecoms_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]

ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypes_AspNetUsers]

ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypesDescription_UITerms]

ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypesMenuName_UITerms]

ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypesMouseOver_UITerms]

ALTER TABLE [dbo].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypesName_UITerms]

ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE

ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]

ALTER TABLE [dbo].[AspNetRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoles_RoleGroups] FOREIGN KEY([RoleGroupID])
REFERENCES [dbo].[RoleGroups] ([RoleGroupID])

ALTER TABLE [dbo].[AspNetRoles] CHECK CONSTRAINT [FK_AspNetRoles_RoleGroups]

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

ALTER TABLE [dbo].[ClaimGroups]  WITH CHECK ADD  CONSTRAINT [FK_ClaimGroupsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClaimGroups] CHECK CONSTRAINT [FK_ClaimGroupsDescription_UITerms]

ALTER TABLE [dbo].[ClaimGroups]  WITH CHECK ADD  CONSTRAINT [FK_ClaimGroupsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClaimGroups] CHECK CONSTRAINT [FK_ClaimGroupsMenuName_UITerms]

ALTER TABLE [dbo].[ClaimGroups]  WITH CHECK ADD  CONSTRAINT [FK_ClaimGroupsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClaimGroups] CHECK CONSTRAINT [FK_ClaimGroupsMouseOver_UITerms]

ALTER TABLE [dbo].[ClaimGroups]  WITH CHECK ADD  CONSTRAINT [FK_ClaimGroupsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClaimGroups] CHECK CONSTRAINT [FK_ClaimGroupsName_UITerms]

ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_ClaimGroups] FOREIGN KEY([ClaimGroupID])
REFERENCES [dbo].[ClaimGroups] ([ClaimGroupID])

ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_ClaimGroups]

ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_ClaimsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_ClaimsDescription_UITerms]

ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_ClaimsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_ClaimsMenuName_UITerms]

ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_ClaimsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_ClaimsMouseOver_UITerms]

ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_ClaimsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_ClaimsName_UITerms]

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

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguage_Language]

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelLanguages_ClassificationLevels] FOREIGN KEY([ClassificationLevelID], [ClassificationID])
REFERENCES [dbo].[ClassificationLevels] ([ClassificationLevelID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationLevelLanguages] CHECK CONSTRAINT [FK_ClassificationLevelLanguages_ClassificationLevels]

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_AspNetUsers]

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_ClassificationLevelPropertyStatuses] FOREIGN KEY([ClassificationLevelPropertyStatusId])
REFERENCES [dbo].[ClassificationLevelPropertyStatuses] ([ClassificationLevelPropertyStatusID])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_ClassificationLevelPropertyStatuses]

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_ClassificationLevels] FOREIGN KEY([ClassificationLevelID], [ClassificationID])
REFERENCES [dbo].[ClassificationLevels] ([ClassificationLevelID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_ClassificationLevels]

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_Properties]

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses] CHECK CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms]

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses] CHECK CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms1]

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses] CHECK CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms2]

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ClassificationLevelPropertyStatuses] CHECK CONSTRAINT [FK_ClassificationLevelPropertyStatuses_UITerms3]

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

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguage_Language]

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageLanguages_ClassificationPages] FOREIGN KEY([ClassificationPageID], [ClassificationID])
REFERENCES [dbo].[ClassificationPages] ([ClassificationPageID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationPageLanguages] CHECK CONSTRAINT [FK_ClassificationPageLanguages_ClassificationPages]

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

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguage_Language]

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSectionLanguages_ClassificationPageSections] FOREIGN KEY([ClassificationPageSectionID], [ClassificationID], [ClassificationPageID])
REFERENCES [dbo].[ClassificationPageSections] ([ClassificationPageSectionID], [ClassificationID], [ClassificationPageID])

ALTER TABLE [dbo].[ClassificationPageSectionLanguages] CHECK CONSTRAINT [FK_ClassificationPageSectionLanguages_ClassificationPageSections]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_AspNetUsers]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_ClassificationPages] FOREIGN KEY([ClassificationPageID], [ClassificationID])
REFERENCES [dbo].[ClassificationPages] ([ClassificationPageID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_ClassificationPages]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_PageSectionDataTypes] FOREIGN KEY([PageSectionDataTypeID])
REFERENCES [dbo].[PageSectionDataTypes] ([PageSectionDataTypeID])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_PageSectionDataTypes]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_PageSectionTypes]

ALTER TABLE [dbo].[ClassificationPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationPageSections_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])

ALTER TABLE [dbo].[ClassificationPageSections] CHECK CONSTRAINT [FK_ClassificationPageSections_SortBys]

ALTER TABLE [dbo].[ClassificationRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationRelationTypeLanguages_ClassificationRelationTypes] FOREIGN KEY([ClassificationRelationTypeID])
REFERENCES [dbo].[ClassificationRelationTypes] ([ClassificationRelationTypeID])

ALTER TABLE [dbo].[ClassificationRelationTypeLanguages] CHECK CONSTRAINT [FK_ClassificationRelationTypeLanguages_ClassificationRelationTypes]

ALTER TABLE [dbo].[ClassificationRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationRelationTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationRelationTypes] CHECK CONSTRAINT [FK_ClassificationRelationTypes_AspNetUsers]

ALTER TABLE [dbo].[ClassificationRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationRelationTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationRelationTypes] CHECK CONSTRAINT [FK_ClassificationRelationTypes_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationRoles_AspNetRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[AspNetRoles] ([Id])

ALTER TABLE [dbo].[ClassificationRoles] CHECK CONSTRAINT [FK_ClassificationRoles_AspNetRoles]

ALTER TABLE [dbo].[ClassificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationRoles_ClassificationRelationTypes] FOREIGN KEY([ClassificationRelationTypeID])
REFERENCES [dbo].[ClassificationRelationTypes] ([ClassificationRelationTypeID])

ALTER TABLE [dbo].[ClassificationRoles] CHECK CONSTRAINT [FK_ClassificationRoles_ClassificationRelationTypes]

ALTER TABLE [dbo].[ClassificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationRoles_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ClassificationRoles] CHECK CONSTRAINT [FK_ClassificationRoles_Classifications]

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

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_Classifications_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_Classifications_Icons]

ALTER TABLE [dbo].[Classifications]  WITH CHECK ADD  CONSTRAINT [FK_DbClassification_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[Classifications] CHECK CONSTRAINT [FK_DbClassification_DbStatus]

ALTER TABLE [dbo].[ClassificationUsers]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationUsers_ClassificationRelationTypes] FOREIGN KEY([ClassificationRelationTypeID])
REFERENCES [dbo].[ClassificationRelationTypes] ([ClassificationRelationTypeID])

ALTER TABLE [dbo].[ClassificationUsers] CHECK CONSTRAINT [FK_ClassificationUsers_ClassificationRelationTypes]

ALTER TABLE [dbo].[ClassificationUsers]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationUsers_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ClassificationUsers] CHECK CONSTRAINT [FK_ClassificationUsers_Classifications]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_ClassificationValues]

ALTER TABLE [dbo].[ClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ClassificationValueLanguages] CHECK CONSTRAINT [FK_ClassificationValueLanguages_Languages]

ALTER TABLE [dbo].[ClassificationValueProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueProperties_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationValueProperties] CHECK CONSTRAINT [FK_ClassificationValueProperties_ClassificationValues]

ALTER TABLE [dbo].[ClassificationValueProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[ClassificationValueProperties] CHECK CONSTRAINT [FK_ClassificationValueProperties_Properties]

ALTER TABLE [dbo].[ClassificationValuePropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValuePropertyLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValuePropertyLanguages] CHECK CONSTRAINT [FK_ClassificationValuePropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ClassificationValuePropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValuePropertyLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValuePropertyLanguages] CHECK CONSTRAINT [FK_ClassificationValuePropertyLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationValuePropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValuePropertyLanguages_ClassificationValueProperties] FOREIGN KEY([ClassificationValuePropertyID], [ClassificationValueID], [ClassificationID], [PropertyID])
REFERENCES [dbo].[ClassificationValueProperties] ([ClassificationValuePropertyID], [ClassificationValueID], [ClassificationID], [PropertyID])

ALTER TABLE [dbo].[ClassificationValuePropertyLanguages] CHECK CONSTRAINT [FK_ClassificationValuePropertyLanguages_ClassificationValueProperties]

ALTER TABLE [dbo].[ClassificationValueRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueRoles_AspNetRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[AspNetRoles] ([Id])

ALTER TABLE [dbo].[ClassificationValueRoles] CHECK CONSTRAINT [FK_ClassificationValueRoles_AspNetRoles]

ALTER TABLE [dbo].[ClassificationValueRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueRoles_ClassificationRelationTypes] FOREIGN KEY([ClassificationRelationTypeID])
REFERENCES [dbo].[ClassificationRelationTypes] ([ClassificationRelationTypeID])

ALTER TABLE [dbo].[ClassificationValueRoles] CHECK CONSTRAINT [FK_ClassificationValueRoles_ClassificationRelationTypes]

ALTER TABLE [dbo].[ClassificationValueRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueRoles_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationValueRoles] CHECK CONSTRAINT [FK_ClassificationValueRoles_ClassificationValues]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers2]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_AspNetUsers3]

ALTER TABLE [dbo].[ClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValues_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ClassificationValues] CHECK CONSTRAINT [FK_ClassificationValues_Classifications]

ALTER TABLE [dbo].[ClassificationValueUsers]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueUsers_ClassificationRelationTypes] FOREIGN KEY([ClassificationRelationTypeID])
REFERENCES [dbo].[ClassificationRelationTypes] ([ClassificationRelationTypeID])

ALTER TABLE [dbo].[ClassificationValueUsers] CHECK CONSTRAINT [FK_ClassificationValueUsers_ClassificationRelationTypes]

ALTER TABLE [dbo].[ClassificationValueUsers]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationValueUsers_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationValueUsers] CHECK CONSTRAINT [FK_ClassificationValueUsers_ClassificationValues]

ALTER TABLE [dbo].[ContentClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ContentClassificationValues_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[ContentClassificationValues] CHECK CONSTRAINT [FK_ContentClassificationValues_ClassificationValues]

ALTER TABLE [dbo].[ContentClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ContentClassificationValues_Content] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Contents] ([ContentID])

ALTER TABLE [dbo].[ContentClassificationValues] CHECK CONSTRAINT [FK_ContentClassificationValues_Content]

ALTER TABLE [dbo].[ContentClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ContentClassificationValuesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentClassificationValues] CHECK CONSTRAINT [FK_ContentClassificationValuesCreator_AspNetUsers]

ALTER TABLE [dbo].[ContentClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ContentClassificationValuesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentClassificationValues] CHECK CONSTRAINT [FK_ContentClassificationValuesModifier_AspNetUsers]

ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Content_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Content_AspNetUsers]

ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Content_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Content_AspNetUsers1]

ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Content_Content] FOREIGN KEY([ParentContentID])
REFERENCES [dbo].[Contents] ([ContentID])

ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Content_Content]

ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentStatuses] FOREIGN KEY([ContentStatusID])
REFERENCES [dbo].[ContentStatuses] ([ContentStatusID])

ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Content_ContentStatuses]

ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Content_SecurityLevels] FOREIGN KEY([SecurityLevelID])
REFERENCES [dbo].[SecurityLevels] ([SecurityLevelID])

ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Content_SecurityLevels]

ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Contents_AspNetUsers] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Contents_AspNetUsers]

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

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_Icons]

ALTER TABLE [dbo].[ContentUserEdit]  WITH CHECK ADD  CONSTRAINT [FK_ContentUserEdit_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentUserEdit] CHECK CONSTRAINT [FK_ContentUserEdit_AspNetUsers]

ALTER TABLE [dbo].[ContentUserEdit]  WITH CHECK ADD  CONSTRAINT [FK_ContentUserEdit_AspNetUsers1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentUserEdit] CHECK CONSTRAINT [FK_ContentUserEdit_AspNetUsers1]

ALTER TABLE [dbo].[ContentUserEdit]  WITH CHECK ADD  CONSTRAINT [FK_ContentUserEdit_Contents] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Contents] ([ContentID])

ALTER TABLE [dbo].[ContentUserEdit] CHECK CONSTRAINT [FK_ContentUserEdit_Contents]

ALTER TABLE [dbo].[ContentUserRead]  WITH CHECK ADD  CONSTRAINT [FK_ContentUserRead_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentUserRead] CHECK CONSTRAINT [FK_ContentUserRead_AspNetUsers]

ALTER TABLE [dbo].[ContentUserRead]  WITH CHECK ADD  CONSTRAINT [FK_ContentUserRead_AspNetUsers1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentUserRead] CHECK CONSTRAINT [FK_ContentUserRead_AspNetUsers1]

ALTER TABLE [dbo].[ContentUserRead]  WITH CHECK ADD  CONSTRAINT [FK_ContentUserRead_Contents] FOREIGN KEY([ContentID])
REFERENCES [dbo].[Contents] ([ContentID])

ALTER TABLE [dbo].[ContentUserRead] CHECK CONSTRAINT [FK_ContentUserRead_Contents]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_IntermediateRegions] FOREIGN KEY([IntermediateRegionID])
REFERENCES [dbo].[IntermediateRegions] ([IntermediateRegionID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_IntermediateRegions]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_SubRegions] FOREIGN KEY([SubRegionID])
REFERENCES [dbo].[SubRegions] ([SubRegionID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_SubRegions]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_CountriesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_CountriesName_UITerms]

ALTER TABLE [dbo].[ErrorMessages]  WITH CHECK ADD  CONSTRAINT [FK_ErrorMessages_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ErrorMessages] CHECK CONSTRAINT [FK_ErrorMessages_UITerms]

ALTER TABLE [dbo].[ErrorMessages]  WITH CHECK ADD  CONSTRAINT [FK_ErrorMessages_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ErrorMessages] CHECK CONSTRAINT [FK_ErrorMessages_UITerms1]

ALTER TABLE [dbo].[ErrorMessages]  WITH CHECK ADD  CONSTRAINT [FK_ErrorMessages_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ErrorMessages] CHECK CONSTRAINT [FK_ErrorMessages_UITerms2]

ALTER TABLE [dbo].[ErrorMessages]  WITH CHECK ADD  CONSTRAINT [FK_ErrorMessages_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ErrorMessages] CHECK CONSTRAINT [FK_ErrorMessages_UITerms3]

ALTER TABLE [dbo].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Genders] CHECK CONSTRAINT [FK_Genders_AspNetUsers]

ALTER TABLE [dbo].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_GendersDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Genders] CHECK CONSTRAINT [FK_GendersDescription_UITerms]

ALTER TABLE [dbo].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_GendersMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Genders] CHECK CONSTRAINT [FK_GendersMenuName_UITerms]

ALTER TABLE [dbo].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_GendersMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Genders] CHECK CONSTRAINT [FK_GendersMouseOver_UITerms]

ALTER TABLE [dbo].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_GendersName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Genders] CHECK CONSTRAINT [FK_GendersName_UITerms]

ALTER TABLE [dbo].[Icons]  WITH CHECK ADD  CONSTRAINT [FK_Icons_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Icons] CHECK CONSTRAINT [FK_Icons_UITerms]

ALTER TABLE [dbo].[Icons]  WITH CHECK ADD  CONSTRAINT [FK_Icons_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Icons] CHECK CONSTRAINT [FK_Icons_UITerms1]

ALTER TABLE [dbo].[Icons]  WITH CHECK ADD  CONSTRAINT [FK_Icons_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Icons] CHECK CONSTRAINT [FK_Icons_UITerms2]

ALTER TABLE [dbo].[Icons]  WITH CHECK ADD  CONSTRAINT [FK_Icons_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Icons] CHECK CONSTRAINT [FK_Icons_UITerms3]

ALTER TABLE [dbo].[IntermediateRegions]  WITH CHECK ADD  CONSTRAINT [FK_IntermediateRegionsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[IntermediateRegions] CHECK CONSTRAINT [FK_IntermediateRegionsDescription_UITerms]

ALTER TABLE [dbo].[IntermediateRegions]  WITH CHECK ADD  CONSTRAINT [FK_IntermediateRegionsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[IntermediateRegions] CHECK CONSTRAINT [FK_IntermediateRegionsMenuName_UITerms]

ALTER TABLE [dbo].[IntermediateRegions]  WITH CHECK ADD  CONSTRAINT [FK_IntermediateRegionsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[IntermediateRegions] CHECK CONSTRAINT [FK_IntermediateRegionsMouseOver_UITerms]

ALTER TABLE [dbo].[IntermediateRegions]  WITH CHECK ADD  CONSTRAINT [FK_IntermediateRegionsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[IntermediateRegions] CHECK CONSTRAINT [FK_IntermediateRegionsName_UITerms]

ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_DbLanguage_DbStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_DbLanguage_DbStatus]

ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_Languages_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_Languages_AspNetUsers]

ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_LanguagesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_LanguagesName_UITerms]

ALTER TABLE [dbo].[Menu1]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1] CHECK CONSTRAINT [FK_Menu1Options_AspNetUsers]

ALTER TABLE [dbo].[Menu1]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1] CHECK CONSTRAINT [FK_Menu1Options_AspNetUsers1]

ALTER TABLE [dbo].[Menu1]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[Menu1] CHECK CONSTRAINT [FK_Menu1Options_Classifications]

ALTER TABLE [dbo].[Menu1]  WITH CHECK ADD  CONSTRAINT [FK_Menu1Options_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])

ALTER TABLE [dbo].[Menu1] CHECK CONSTRAINT [FK_Menu1Options_MenuTypes]

ALTER TABLE [dbo].[Menu1Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1Languages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[Menu1Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu1Languages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[Menu1Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[Menu1Languages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_Languages]

ALTER TABLE [dbo].[Menu1Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu1OptionLanguages_Menu1Options] FOREIGN KEY([Menu1ID])
REFERENCES [dbo].[Menu1] ([Menu1])

ALTER TABLE [dbo].[Menu1Languages] CHECK CONSTRAINT [FK_Menu1OptionLanguages_Menu1Options]

ALTER TABLE [dbo].[Menu2]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2] CHECK CONSTRAINT [FK_Menu2Options_AspNetUsers]

ALTER TABLE [dbo].[Menu2]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2] CHECK CONSTRAINT [FK_Menu2Options_AspNetUsers1]

ALTER TABLE [dbo].[Menu2]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_Classifications] FOREIGN KEY([PageID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[Menu2] CHECK CONSTRAINT [FK_Menu2Options_Classifications]

ALTER TABLE [dbo].[Menu2]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_Menu1Options] FOREIGN KEY([Menu1ID])
REFERENCES [dbo].[Menu1] ([Menu1])

ALTER TABLE [dbo].[Menu2] CHECK CONSTRAINT [FK_Menu2Options_Menu1Options]

ALTER TABLE [dbo].[Menu2]  WITH CHECK ADD  CONSTRAINT [FK_Menu2Options_MenuTypes] FOREIGN KEY([MenuTypeID])
REFERENCES [dbo].[MenuTypes] ([MenuTypeID])

ALTER TABLE [dbo].[Menu2] CHECK CONSTRAINT [FK_Menu2Options_MenuTypes]

ALTER TABLE [dbo].[Menu2Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2Languages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[Menu2Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu2Languages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[Menu2Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[Menu2Languages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_Languages]

ALTER TABLE [dbo].[Menu2Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu2OptionLanguages_Menu2Options] FOREIGN KEY([Menu2ID])
REFERENCES [dbo].[Menu2] ([Menu2ID])

ALTER TABLE [dbo].[Menu2Languages] CHECK CONSTRAINT [FK_Menu2OptionLanguages_Menu2Options]

ALTER TABLE [dbo].[Menu3]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3] CHECK CONSTRAINT [FK_Menu3Options_AspNetUsers]

ALTER TABLE [dbo].[Menu3]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3] CHECK CONSTRAINT [FK_Menu3Options_AspNetUsers1]

ALTER TABLE [dbo].[Menu3]  WITH CHECK ADD  CONSTRAINT [FK_Menu3Options_Menu2Options] FOREIGN KEY([Menu2OptionID])
REFERENCES [dbo].[Menu2] ([Menu2ID])

ALTER TABLE [dbo].[Menu3] CHECK CONSTRAINT [FK_Menu3Options_Menu2Options]

ALTER TABLE [dbo].[Menu3Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3Languages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[Menu3Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Menu3Languages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[Menu3Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[Menu3Languages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_Languages]

ALTER TABLE [dbo].[Menu3Languages]  WITH CHECK ADD  CONSTRAINT [FK_Menu3OptionLanguages_Menu3Options] FOREIGN KEY([Menu3OptionID])
REFERENCES [dbo].[Menu3] ([Menu3OptionID])

ALTER TABLE [dbo].[Menu3Languages] CHECK CONSTRAINT [FK_Menu3OptionLanguages_Menu3Options]

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

ALTER TABLE [dbo].[OrganizationSettings]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettings_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationSettings] CHECK CONSTRAINT [FK_OrganizationSettings_AspNetUsers]

ALTER TABLE [dbo].[OrganizationSettings]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettings_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationSettings] CHECK CONSTRAINT [FK_OrganizationSettings_Organizations]

ALTER TABLE [dbo].[OrganizationSettings]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettings_OrganizationSettingTypes] FOREIGN KEY([OrganizationSettingTypeID])
REFERENCES [dbo].[OrganizationSettingTypes] ([OrganizationSettingTypeID])

ALTER TABLE [dbo].[OrganizationSettings] CHECK CONSTRAINT [FK_OrganizationSettings_OrganizationSettingTypes]

ALTER TABLE [dbo].[OrganizationSettingTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypeGroups] CHECK CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms]

ALTER TABLE [dbo].[OrganizationSettingTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypeGroups] CHECK CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms1]

ALTER TABLE [dbo].[OrganizationSettingTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypeGroups] CHECK CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms2]

ALTER TABLE [dbo].[OrganizationSettingTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypeGroups] CHECK CONSTRAINT [FK_OrganizationSettingTypeGroups_UITerms3]

ALTER TABLE [dbo].[OrganizationSettingTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypes_OrganizationSettingTypeGroups] FOREIGN KEY([OrganizationSettingTypeGroupID])
REFERENCES [dbo].[OrganizationSettingTypeGroups] ([OrganizationSettingTypeGroupID])

ALTER TABLE [dbo].[OrganizationSettingTypes] CHECK CONSTRAINT [FK_OrganizationSettingTypes_OrganizationSettingTypeGroups]

ALTER TABLE [dbo].[OrganizationSettingTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypes] CHECK CONSTRAINT [FK_OrganizationSettingTypes_UITerms]

ALTER TABLE [dbo].[OrganizationSettingTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypes] CHECK CONSTRAINT [FK_OrganizationSettingTypes_UITerms1]

ALTER TABLE [dbo].[OrganizationSettingTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypes] CHECK CONSTRAINT [FK_OrganizationSettingTypes_UITerms2]

ALTER TABLE [dbo].[OrganizationSettingTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationSettingTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[OrganizationSettingTypes] CHECK CONSTRAINT [FK_OrganizationSettingTypes_UITerms3]

ALTER TABLE [dbo].[OrganizationTelecomPhones]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTelecomPhones_OrganizationTelecoms] FOREIGN KEY([OrganizationTelecomID])
REFERENCES [dbo].[OrganizationTelecoms] ([OrganizationTelecomID])

ALTER TABLE [dbo].[OrganizationTelecomPhones] CHECK CONSTRAINT [FK_OrganizationTelecomPhones_OrganizationTelecoms]

ALTER TABLE [dbo].[OrganizationTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTelecoms_OrganizationAddresses] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[OrganizationAddresses] ([OrganizationAddressID])

ALTER TABLE [dbo].[OrganizationTelecoms] CHECK CONSTRAINT [FK_OrganizationTelecoms_OrganizationAddresses]

ALTER TABLE [dbo].[OrganizationTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTelecoms_TelecomTypes] FOREIGN KEY([TelecomTypeID])
REFERENCES [dbo].[TelecomTypes] ([TelecomTypeID])

ALTER TABLE [dbo].[OrganizationTelecoms] CHECK CONSTRAINT [FK_OrganizationTelecoms_TelecomTypes]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_Languages]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes]

ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_Icons]

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

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_PageSectionClassificationValueConditions] FOREIGN KEY([PageSectionClassificationValueConditionID], [PageSectionID], [PageID])
REFERENCES [dbo].[PageSectionClassificationValueConditions] ([PageSectionClassificationValueConditionID], [PageSectionID], [PageID])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionLanguages] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionLanguages_PageSectionClassificationValueConditions]

ALTER TABLE [dbo].[PageSectionClassificationValueConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditions_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionClassificationValueConditions] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditions_AspNetUsers]

ALTER TABLE [dbo].[PageSectionClassificationValueConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditions_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionClassificationValueConditions] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditions_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms]

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms1]

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms2]

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionClassificationValueConditionTypes] CHECK CONSTRAINT [FK_PageSectionClassificationValueConditionTypes_UITerms3]

ALTER TABLE [dbo].[PageSectionContentConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionContentConditionLanguages] CHECK CONSTRAINT [FK_PageSectionContentConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionContentConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionContentConditionLanguages] CHECK CONSTRAINT [FK_PageSectionContentConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionContentConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionContentConditionLanguages] CHECK CONSTRAINT [FK_PageSectionContentConditionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionContentConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionLanguages_PageSectionContentConditions] FOREIGN KEY([PageSectionContentConditionID], [PageSectionID], [PageID])
REFERENCES [dbo].[PageSectionContentConditions] ([PageSectionContentConditionID], [PageSectionID], [PageID])

ALTER TABLE [dbo].[PageSectionContentConditionLanguages] CHECK CONSTRAINT [FK_PageSectionContentConditionLanguages_PageSectionContentConditions]

ALTER TABLE [dbo].[PageSectionContentConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditions_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionContentConditions] CHECK CONSTRAINT [FK_PageSectionContentConditions_AspNetUsers]

ALTER TABLE [dbo].[PageSectionContentConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditions_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionContentConditions] CHECK CONSTRAINT [FK_PageSectionContentConditions_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionContentConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditions_PageSectionContentConditionTypes] FOREIGN KEY([PageSectionContentConditionTypeId])
REFERENCES [dbo].[PageSectionContentConditionTypes] ([PageSectionContentConditionTypeID])

ALTER TABLE [dbo].[PageSectionContentConditions] CHECK CONSTRAINT [FK_PageSectionContentConditions_PageSectionContentConditionTypes]

ALTER TABLE [dbo].[PageSectionContentConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionContentConditionTypes] CHECK CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms]

ALTER TABLE [dbo].[PageSectionContentConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionContentConditionTypes] CHECK CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms1]

ALTER TABLE [dbo].[PageSectionContentConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionContentConditionTypes] CHECK CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms2]

ALTER TABLE [dbo].[PageSectionContentConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionContentConditionTypes] CHECK CONSTRAINT [FK_PageSectionContentConditionTypes_UITerms3]

ALTER TABLE [dbo].[PageSectionDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionDataTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionDataTypes] CHECK CONSTRAINT [FK_PageSectionDataTypesDescription_UITerms]

ALTER TABLE [dbo].[PageSectionDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionDataTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionDataTypes] CHECK CONSTRAINT [FK_PageSectionDataTypesMenuName_UITerms]

ALTER TABLE [dbo].[PageSectionDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionDataTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionDataTypes] CHECK CONSTRAINT [FK_PageSectionDataTypesMouseOver_UITerms]

ALTER TABLE [dbo].[PageSectionDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionDataTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionDataTypes] CHECK CONSTRAINT [FK_PageSectionDataTypesName_UITerms]

ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionLanguages] CHECK CONSTRAINT [FK_PageSectionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages] CHECK CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages] CHECK CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages] CHECK CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_PageSectionOrganizationConditions] FOREIGN KEY([PageSectionOrganizationConditionID], [PageSectionID], [PageID])
REFERENCES [dbo].[PageSectionOrganizationConditions] ([PageSectionOrganizationConditionID], [PageSectionID], [PageID])

ALTER TABLE [dbo].[PageSectionOrganizationConditionLanguages] CHECK CONSTRAINT [FK_PageSectionOrganizationConditionLanguages_PageSectionOrganizationConditions]

ALTER TABLE [dbo].[PageSectionOrganizationConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionOrganizationConditions_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionOrganizationConditions] CHECK CONSTRAINT [FK_PageSectionOrganizationConditions_AspNetUsers]

ALTER TABLE [dbo].[PageSectionOrganizationConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionOrganizationConditions_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionOrganizationConditions] CHECK CONSTRAINT [FK_PageSectionOrganizationConditions_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionOrganizationConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionOrganizationConditions_PageSectionOrganizationConditionTypes] FOREIGN KEY([PageSectionOrganizationConditionTypeId])
REFERENCES [dbo].[PageSectionOrganizationConditionTypes] ([PageSectionOrganizationConditionTypeID])

ALTER TABLE [dbo].[PageSectionOrganizationConditions] CHECK CONSTRAINT [FK_PageSectionOrganizationConditions_PageSectionOrganizationConditionTypes]

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionPersonConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages] CHECK CONSTRAINT [FK_PageSectionPersonConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionPersonConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages] CHECK CONSTRAINT [FK_PageSectionPersonConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionPersonConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages] CHECK CONSTRAINT [FK_PageSectionPersonConditionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionPersonConditionLanguages_PageSectionPersonConditions] FOREIGN KEY([PageSectionPersonConditionID], [PageSectionID], [PageID])
REFERENCES [dbo].[PageSectionPersonConditions] ([PageSectionPersonConditionID], [PageSectionID], [PageID])

ALTER TABLE [dbo].[PageSectionPersonConditionLanguages] CHECK CONSTRAINT [FK_PageSectionPersonConditionLanguages_PageSectionPersonConditions]

ALTER TABLE [dbo].[PageSectionPersonConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionPersonConditions_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionPersonConditions] CHECK CONSTRAINT [FK_PageSectionPersonConditions_AspNetUsers]

ALTER TABLE [dbo].[PageSectionPersonConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionPersonConditions_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionPersonConditions] CHECK CONSTRAINT [FK_PageSectionPersonConditions_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionPersonConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionPersonConditions_PageSectionPersonConditionTypes] FOREIGN KEY([PageSectionPersonConditionTypeId])
REFERENCES [dbo].[PageSectionPersonConditionTypes] ([PageSectionPersonConditionTypeID])

ALTER TABLE [dbo].[PageSectionPersonConditions] CHECK CONSTRAINT [FK_PageSectionPersonConditions_PageSectionPersonConditionTypes]

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProcessConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProcessConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProcessConditionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionLanguages_PageSectionProcessConditions] FOREIGN KEY([PageSectionProcessConditionID], [PageSectionID], [PageID])
REFERENCES [dbo].[PageSectionProcessConditions] ([PageSectionProcessConditionID], [PageSectionID], [PageID])

ALTER TABLE [dbo].[PageSectionProcessConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProcessConditionLanguages_PageSectionProcessConditions]

ALTER TABLE [dbo].[PageSectionProcessConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditions_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProcessConditions] CHECK CONSTRAINT [FK_PageSectionProcessConditions_AspNetUsers]

ALTER TABLE [dbo].[PageSectionProcessConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditions_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProcessConditions] CHECK CONSTRAINT [FK_PageSectionProcessConditions_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionProcessConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditions_PageSectionProcessConditionTypes] FOREIGN KEY([PageSectionProcessConditionTypeId])
REFERENCES [dbo].[PageSectionProcessConditionTypes] ([PageSectionProcessConditionTypeID])

ALTER TABLE [dbo].[PageSectionProcessConditions] CHECK CONSTRAINT [FK_PageSectionProcessConditions_PageSectionProcessConditionTypes]

ALTER TABLE [dbo].[PageSectionProcessConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditions_PageSections] FOREIGN KEY([PageSectionID], [PageID])
REFERENCES [dbo].[PageSections] ([PageSectionID], [PageID])

ALTER TABLE [dbo].[PageSectionProcessConditions] CHECK CONSTRAINT [FK_PageSectionProcessConditions_PageSections]

ALTER TABLE [dbo].[PageSectionProcessConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionProcessConditionTypes] CHECK CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms]

ALTER TABLE [dbo].[PageSectionProcessConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionProcessConditionTypes] CHECK CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms1]

ALTER TABLE [dbo].[PageSectionProcessConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionProcessConditionTypes] CHECK CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms2]

ALTER TABLE [dbo].[PageSectionProcessConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionProcessConditionTypes] CHECK CONSTRAINT [FK_PageSectionProcessConditionTypes_UITerms3]

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProjectConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProjectConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProjectConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProjectConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProjectConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProjectConditionLanguages_Languages]

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProjectConditionLanguages_PageSectionProjectConditions] FOREIGN KEY([PageSectionProjectConditionID], [PageSectionID], [PageID])
REFERENCES [dbo].[PageSectionProjectConditions] ([PageSectionProjectConditionID], [PageSectionID], [PageID])

ALTER TABLE [dbo].[PageSectionProjectConditionLanguages] CHECK CONSTRAINT [FK_PageSectionProjectConditionLanguages_PageSectionProjectConditions]

ALTER TABLE [dbo].[PageSectionProjectConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProjectConditions_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProjectConditions] CHECK CONSTRAINT [FK_PageSectionProjectConditions_AspNetUsers]

ALTER TABLE [dbo].[PageSectionProjectConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProjectConditions_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSectionProjectConditions] CHECK CONSTRAINT [FK_PageSectionProjectConditions_AspNetUsers1]

ALTER TABLE [dbo].[PageSectionProjectConditions]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionProjectConditions_PageSectionProjectConditionTypes] FOREIGN KEY([PageSectionProjectConditionTypeId])
REFERENCES [dbo].[PageSectionProjectConditionTypes] ([PageSectionProjectConditionTypeID])

ALTER TABLE [dbo].[PageSectionProjectConditions] CHECK CONSTRAINT [FK_PageSectionProjectConditions_PageSectionProjectConditionTypes]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_AspNetUsers]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_AspNetUsers1]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([PageID])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_Pages]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_PageSectionDataTypes] FOREIGN KEY([PageSectionDataTypeID])
REFERENCES [dbo].[PageSectionDataTypes] ([PageSectionDataTypeID])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_PageSectionDataTypes]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_PageSectionTypes] FOREIGN KEY([PageSectionTypeID])
REFERENCES [dbo].[PageSectionTypes] ([PageSectionTypeID])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_PageSectionTypes]

ALTER TABLE [dbo].[PageSections]  WITH CHECK ADD  CONSTRAINT [FK_PageSections_SortBys] FOREIGN KEY([SortByID])
REFERENCES [dbo].[SortBys] ([SortByID])

ALTER TABLE [dbo].[PageSections] CHECK CONSTRAINT [FK_PageSections_SortBys]

ALTER TABLE [dbo].[PageSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionTypes] CHECK CONSTRAINT [FK_PageSectionTypesDescription_UITerms]

ALTER TABLE [dbo].[PageSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionTypes] CHECK CONSTRAINT [FK_PageSectionTypesMenuName_UITerms]

ALTER TABLE [dbo].[PageSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionTypes] CHECK CONSTRAINT [FK_PageSectionTypesMouseOver_UITerms]

ALTER TABLE [dbo].[PageSectionTypes]  WITH CHECK ADD  CONSTRAINT [FK_PageSectionTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PageSectionTypes] CHECK CONSTRAINT [FK_PageSectionTypesName_UITerms]

ALTER TABLE [dbo].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_AddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])

ALTER TABLE [dbo].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_AddressTypes]

ALTER TABLE [dbo].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])

ALTER TABLE [dbo].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Persons]

ALTER TABLE [dbo].[PersonRelations]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelations_PersonRelationTypes] FOREIGN KEY([PersonRelationTypeID])
REFERENCES [dbo].[PersonRelationTypes] ([PersonRelationTypeID])

ALTER TABLE [dbo].[PersonRelations] CHECK CONSTRAINT [FK_PersonRelations_PersonRelationTypes]

ALTER TABLE [dbo].[PersonRelations]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationsCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonRelations] CHECK CONSTRAINT [FK_PersonRelationsCreator_AspNetUsers]

ALTER TABLE [dbo].[PersonRelations]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationsModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonRelations] CHECK CONSTRAINT [FK_PersonRelationsModifier_AspNetUsers]

ALTER TABLE [dbo].[PersonRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PersonRelationTypeLanguages] CHECK CONSTRAINT [FK_PersonRelationTypeLanguages_Languages]

ALTER TABLE [dbo].[PersonRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationTypeLanguages_PersonRelationTypes] FOREIGN KEY([PersonRelationTypeID])
REFERENCES [dbo].[PersonRelationTypes] ([PersonRelationTypeID])

ALTER TABLE [dbo].[PersonRelationTypeLanguages] CHECK CONSTRAINT [FK_PersonRelationTypeLanguages_PersonRelationTypes]

ALTER TABLE [dbo].[PersonRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationTypeLanguagesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonRelationTypeLanguages] CHECK CONSTRAINT [FK_PersonRelationTypeLanguagesCreator_AspNetUsers]

ALTER TABLE [dbo].[PersonRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationTypeLanguagesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonRelationTypeLanguages] CHECK CONSTRAINT [FK_PersonRelationTypeLanguagesModifier_AspNetUsers]

ALTER TABLE [dbo].[PersonRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonRelationTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[PersonRelationTypes] CHECK CONSTRAINT [FK_PersonRelationTypes_Icons]

ALTER TABLE [dbo].[PersonTelecomPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecomPhones_PersonTelecoms] FOREIGN KEY([PersonTelecomID])
REFERENCES [dbo].[PersonTelecoms] ([PersonTelecomID])

ALTER TABLE [dbo].[PersonTelecomPhones] CHECK CONSTRAINT [FK_PersonTelecomPhones_PersonTelecoms]

ALTER TABLE [dbo].[PersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecoms_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])

ALTER TABLE [dbo].[PersonTelecoms] CHECK CONSTRAINT [FK_PersonTelecoms_Persons]

ALTER TABLE [dbo].[PersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecoms_TelecomTypes] FOREIGN KEY([TelecomTypeID])
REFERENCES [dbo].[TelecomTypes] ([TelecomTypeID])

ALTER TABLE [dbo].[PersonTelecoms] CHECK CONSTRAINT [FK_PersonTelecoms_TelecomTypes]

ALTER TABLE [dbo].[PreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PreferenceTypes] CHECK CONSTRAINT [FK_PreferenceTypesDescription_UITerms]

ALTER TABLE [dbo].[PreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PreferenceTypes] CHECK CONSTRAINT [FK_PreferenceTypesMenuName_UITerms]

ALTER TABLE [dbo].[PreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PreferenceTypes] CHECK CONSTRAINT [FK_PreferenceTypesMouseOver_UITerms]

ALTER TABLE [dbo].[PreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_PreferenceTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PreferenceTypes] CHECK CONSTRAINT [FK_PreferenceTypesName_UITerms]

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

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_ProcessTemplateStages] FOREIGN KEY([ProcessTemplateStageID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID], [ProcessTemplateID])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_AspNetUsers]

ALTER TABLE [dbo].[ProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessFields_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessFields] CHECK CONSTRAINT [FK_ProcessFields_AspNetUsers1]

ALTER TABLE [dbo].[ProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ProcessMultis_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessMultis] CHECK CONSTRAINT [FK_ProcessMultis_AspNetUsers]

ALTER TABLE [dbo].[ProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ProcessMultis_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessMultis] CHECK CONSTRAINT [FK_ProcessMultis_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms1]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms2]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionComparisonOperators_UITerms3]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_ProcessTemplateFieldConditions] FOREIGN KEY([ProcessTemplateFieldConditionID], [ProcessTemplateID], [ProcessTemplateFieldID])
REFERENCES [dbo].[ProcessTemplateFieldConditions] ([ProcessTemplateFieldConditionID], [ProcessTemplateID], [ProcessTemplateFieldID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionLanguages_ProcessTemplateFieldConditions]

ALTER TABLE [dbo].[ProcessTemplateFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldConditions] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditions_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldConditions] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditions_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditions_ProcessTemplateFieldConditionComparisonOperators] FOREIGN KEY([ComparisonOperatorID])
REFERENCES [dbo].[ProcessTemplateFieldConditionComparisonOperators] ([ProcessTemplateFieldConditionComparisonOperatorID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditions] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditions_ProcessTemplateFieldConditionComparisonOperators]

ALTER TABLE [dbo].[ProcessTemplateFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditions_ProcessTemplateFieldConditionTypes] FOREIGN KEY([ProcessTemplateFieldConditionTypeID])
REFERENCES [dbo].[ProcessTemplateFieldConditionTypes] ([ProcessTemplateFieldConditionTypeID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditions] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditions_ProcessTemplateFieldConditionTypes]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_ProcessTemplateFieldTypes] FOREIGN KEY([ProcessTemplateFieldTypeID])
REFERENCES [dbo].[ProcessTemplateFieldTypes] ([ProcessTemplateFieldTypeID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_ProcessTemplateFieldTypes]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms1]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms2]

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldConditionTypes_UITerms3]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldLanguages_ProcessTemplateFields] FOREIGN KEY([ProcessTemplateFieldID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateFields] ([ProcessTemplateFieldID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFieldLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFieldLanguages_ProcessTemplateFields]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers2]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_AspNetUsers3]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplateFieldTypes] FOREIGN KEY([ProcessTemplateFieldTypeID])
REFERENCES [dbo].[ProcessTemplateFieldTypes] ([ProcessTemplateFieldTypeID])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplateFieldTypes]

ALTER TABLE [dbo].[ProcessTemplateFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFields] CHECK CONSTRAINT [FK_ProcessTemplateFields_ProcessTemplates]

ALTER TABLE [dbo].[ProcessTemplateFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms1]

ALTER TABLE [dbo].[ProcessTemplateFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms2]

ALTER TABLE [dbo].[ProcessTemplateFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFieldTypes] CHECK CONSTRAINT [FK_ProcessTemplateFieldTypes_UITerms3]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsDescription_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsMenuName_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsMouseOver_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionComparisonOperatorsName_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_ProcessTemplateFlowConditions] FOREIGN KEY([ProcessTemplateFlowConditionID], [ProcessTemplateID], [ProcessTemplateFlowID])
REFERENCES [dbo].[ProcessTemplateFlowConditions] ([ProcessTemplateFlowConditionID], [ProcessTemplateID], [ProcessTemplateFlowID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionLanguages_ProcessTemplateFlowConditions]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlowConditionComparisonOperators] FOREIGN KEY([ComparisonOperatorID])
REFERENCES [dbo].[ProcessTemplateFlowConditionComparisonOperators] ([ProcessTemplateFlowConditionComparisonOperatorID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlowConditionComparisonOperators]

ALTER TABLE [dbo].[ProcessTemplateFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlows] FOREIGN KEY([ProcessTemplateFlowID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateFlows] ([ProcessTemplateFlowID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditions] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditions_ProcessTemplateFlows]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypesDescription_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypesMenuName_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypesMouseOver_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowConditionTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowConditionTypesName_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowLanguages_ProcessTemplateFlows] FOREIGN KEY([ProcessTemplateFlowID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateFlows] ([ProcessTemplateFlowID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFlowLanguages] CHECK CONSTRAINT [FK_ProcessTemplateFlowLanguages_ProcessTemplateFlows]

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms1]

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms2]

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassComparisonOperators_UITerms3]

ALTER TABLE [dbo].[ProcessTemplateFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPasses_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowPasses] CHECK CONSTRAINT [FK_ProcessTemplateFlowPasses_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPasses_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlowPasses] CHECK CONSTRAINT [FK_ProcessTemplateFlowPasses_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPasses_ProcessTemplateFlows] FOREIGN KEY([ProcessTemplateFlowID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateFlows] ([ProcessTemplateFlowID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFlowPasses] CHECK CONSTRAINT [FK_ProcessTemplateFlowPasses_ProcessTemplateFlows]

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms]

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms1]

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms2]

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTemplateFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTemplateFlowPassTypes_UITerms3]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplates]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateStages] FOREIGN KEY([ProcessTemplateFromStageID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateFlows] CHECK CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessTemplateFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateFlows_ProcessTemplateStages1] FOREIGN KEY([ProcessTemplateToStageID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID], [ProcessTemplateID])

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

ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_Icons]

ALTER TABLE [dbo].[ProcessTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplates_ProcessTemplateGroups] FOREIGN KEY([ProcessTemplateGroupID])
REFERENCES [dbo].[ProcessTemplateGroups] ([ProcessTemplateGroupID])

ALTER TABLE [dbo].[ProcessTemplates] CHECK CONSTRAINT [FK_ProcessTemplates_ProcessTemplateGroups]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateFields] FOREIGN KEY([ProcessTemplateFieldID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateFields] ([ProcessTemplateFieldID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateFields]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStageFieldStatuses] FOREIGN KEY([ProcessTemplateStageFieldStatusID])
REFERENCES [dbo].[ProcessTemplateStageFieldStatuses] ([ProcessTemplateStageFieldStatusID])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStageFieldStatuses]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStages] FOREIGN KEY([ProcessTemplateStageID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessTemplateStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageFields_ValueUpdateTypes] FOREIGN KEY([ValueUpdateTypeID])
REFERENCES [dbo].[ValueUpdateTypes] ([ValueUpdateTypeID])

ALTER TABLE [dbo].[ProcessTemplateStageFields] CHECK CONSTRAINT [FK_ProcessTemplateStageFields_ValueUpdateTypes]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageLanguages_ProcessTemplateStages] FOREIGN KEY([ProcessTemplateStageID], [ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplateStages] ([ProcessTemplateStageID], [ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateStageLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageLanguages_ProcessTemplateStages]

ALTER TABLE [dbo].[ProcessTemplateStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplates] FOREIGN KEY([ProcessTemplateID])
REFERENCES [dbo].[ProcessTemplates] ([ProcessTemplateID])

ALTER TABLE [dbo].[ProcessTemplateStages] CHECK CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplates]

ALTER TABLE [dbo].[ProcessTemplateStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplateStageTypes] FOREIGN KEY([ProcessTemplateStageTypeID])
REFERENCES [dbo].[ProcessTemplateStageTypes] ([ProcessTemplateStageTypeID])

ALTER TABLE [dbo].[ProcessTemplateStages] CHECK CONSTRAINT [FK_ProcessTemplateStages_ProcessTemplateStageTypes]

ALTER TABLE [dbo].[ProcessTemplateStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStagesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStages] CHECK CONSTRAINT [FK_ProcessTemplateStagesCreator_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStagesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStages] CHECK CONSTRAINT [FK_ProcessTemplateStagesModifier_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_Languages]

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_ProcessTemplateStageTypes] FOREIGN KEY([ProcessTemplateStageTypeID])
REFERENCES [dbo].[ProcessTemplateStageTypes] ([ProcessTemplateStageTypeID])

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageTypeLanguages_ProcessTemplateStageTypes]

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypeLanguagesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageTypeLanguagesCreator_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypeLanguagesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTemplateStageTypeLanguagesModifier_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ProcessTemplateStageTypes] CHECK CONSTRAINT [FK_ProcessTemplateStageTypes_Icons]

ALTER TABLE [dbo].[ProcessTemplateStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageTypes] CHECK CONSTRAINT [FK_ProcessTemplateStageTypesCreator_AspNetUsers]

ALTER TABLE [dbo].[ProcessTemplateStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTemplateStageTypesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTemplateStageTypes] CHECK CONSTRAINT [FK_ProcessTemplateStageTypesModifier_AspNetUsers]

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

ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_ProjectTypes] FOREIGN KEY([ProjectTypeID])
REFERENCES [dbo].[ProjectTypes] ([ProjectTypeID])

ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_ProjectTypes]

ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_SecurityLevels] FOREIGN KEY([SecurityLevelID])
REFERENCES [dbo].[SecurityLevels] ([SecurityLevelID])

ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_SecurityLevels]

ALTER TABLE [dbo].[ProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeLanguages] CHECK CONSTRAINT [FK_ProjectTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeLanguages] CHECK CONSTRAINT [FK_ProjectTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProjectTypeLanguages] CHECK CONSTRAINT [FK_ProjectTypeLanguages_Languages]

ALTER TABLE [dbo].[ProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeLanguages_ProjectTypes] FOREIGN KEY([ProjectTypeID])
REFERENCES [dbo].[ProjectTypes] ([ProjectTypeID])

ALTER TABLE [dbo].[ProjectTypeLanguages] CHECK CONSTRAINT [FK_ProjectTypeLanguages_ProjectTypes]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_AspNetUsers1]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_Icons]

ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_AspNetUsers]

ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_AspNetUsers1]

ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_PropertyTypes] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[PropertyTypes] ([PropertyTypeID])

ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_PropertyTypes]

ALTER TABLE [dbo].[PropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PropertyLanguages] CHECK CONSTRAINT [FK_PropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[PropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PropertyLanguages] CHECK CONSTRAINT [FK_PropertyLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PropertyLanguages] CHECK CONSTRAINT [FK_PropertyLanguages_Languages]

ALTER TABLE [dbo].[PropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyLanguages_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[PropertyLanguages] CHECK CONSTRAINT [FK_PropertyLanguages_Properties]

ALTER TABLE [dbo].[PropertyTypes]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PropertyTypes] CHECK CONSTRAINT [FK_PropertyTypes_UITerms]

ALTER TABLE [dbo].[PropertyTypes]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PropertyTypes] CHECK CONSTRAINT [FK_PropertyTypes_UITerms1]

ALTER TABLE [dbo].[PropertyTypes]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PropertyTypes] CHECK CONSTRAINT [FK_PropertyTypes_UITerms2]

ALTER TABLE [dbo].[PropertyTypes]  WITH CHECK ADD  CONSTRAINT [FK_PropertyTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[PropertyTypes] CHECK CONSTRAINT [FK_PropertyTypes_UITerms3]

ALTER TABLE [dbo].[PropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValueLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PropertyValueLanguages] CHECK CONSTRAINT [FK_PropertyValueLanguages_AspNetUsers]

ALTER TABLE [dbo].[PropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValueLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PropertyValueLanguages] CHECK CONSTRAINT [FK_PropertyValueLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValueLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PropertyValueLanguages] CHECK CONSTRAINT [FK_PropertyValueLanguages_Languages]

ALTER TABLE [dbo].[PropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValueLanguages_Languages1] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PropertyValueLanguages] CHECK CONSTRAINT [FK_PropertyValueLanguages_Languages1]

ALTER TABLE [dbo].[PropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValueLanguages_PropertyValues] FOREIGN KEY([PropertyValueID], [PropertyID])
REFERENCES [dbo].[PropertyValues] ([PropertyValueID], [PropertyID])

ALTER TABLE [dbo].[PropertyValueLanguages] CHECK CONSTRAINT [FK_PropertyValueLanguages_PropertyValues]

ALTER TABLE [dbo].[PropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValues_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PropertyValues] CHECK CONSTRAINT [FK_PropertyValues_AspNetUsers]

ALTER TABLE [dbo].[PropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValues_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PropertyValues] CHECK CONSTRAINT [FK_PropertyValues_AspNetUsers1]

ALTER TABLE [dbo].[PropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValues_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[PropertyValues] CHECK CONSTRAINT [FK_PropertyValues_Properties]

ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_RegionsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_RegionsDescription_UITerms]

ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_RegionsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_RegionsMenuName_UITerms]

ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_RegionsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_RegionsMouseOver_UITerms]

ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_RegionsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_RegionsName_UITerms]

ALTER TABLE [dbo].[RoleGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[RoleGroupLanguages] CHECK CONSTRAINT [FK_RoleGroupLanguages_AspNetUsers]

ALTER TABLE [dbo].[RoleGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[RoleGroupLanguages] CHECK CONSTRAINT [FK_RoleGroupLanguages_AspNetUsers1]

ALTER TABLE [dbo].[RoleGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[RoleGroupLanguages] CHECK CONSTRAINT [FK_RoleGroupLanguages_Languages]

ALTER TABLE [dbo].[RoleGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupLanguages_RoleGroups] FOREIGN KEY([RoleGroupID])
REFERENCES [dbo].[RoleGroups] ([RoleGroupID])

ALTER TABLE [dbo].[RoleGroupLanguages] CHECK CONSTRAINT [FK_RoleGroupLanguages_RoleGroups]

ALTER TABLE [dbo].[RoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroups_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[RoleGroups] CHECK CONSTRAINT [FK_RoleGroups_AspNetUsers]

ALTER TABLE [dbo].[RoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroups_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[RoleGroups] CHECK CONSTRAINT [FK_RoleGroups_AspNetUsers1]

ALTER TABLE [dbo].[RoleLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RoleLanguages_AspNetRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[AspNetRoles] ([Id])

ALTER TABLE [dbo].[RoleLanguages] CHECK CONSTRAINT [FK_RoleLanguages_AspNetRoles]

ALTER TABLE [dbo].[RoleLanguages]  WITH CHECK ADD  CONSTRAINT [FK_RoleLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[RoleLanguages] CHECK CONSTRAINT [FK_RoleLanguages_Languages]

ALTER TABLE [dbo].[SecurityLevels]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SecurityLevels] CHECK CONSTRAINT [FK_SecurityLevelsDescription_UITerms]

ALTER TABLE [dbo].[SecurityLevels]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SecurityLevels] CHECK CONSTRAINT [FK_SecurityLevelsMenuName_UITerms]

ALTER TABLE [dbo].[SecurityLevels]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SecurityLevels] CHECK CONSTRAINT [FK_SecurityLevelsMouseOver_UITerms]

ALTER TABLE [dbo].[SecurityLevels]  WITH CHECK ADD  CONSTRAINT [FK_SecurityLevelsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SecurityLevels] CHECK CONSTRAINT [FK_SecurityLevelsName_UITerms]

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_AspNetUsers]

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_SettingsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_SettingsDescription_UITerms]

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_SettingsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_SettingsMenuName_UITerms]

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_SettingsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_SettingsMouseOver_UITerms]

ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_SettingsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_SettingsName_UITerms]

ALTER TABLE [dbo].[SortBys]  WITH CHECK ADD  CONSTRAINT [FK_SortBysDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SortBys] CHECK CONSTRAINT [FK_SortBysDescription_UITerms]

ALTER TABLE [dbo].[SortBys]  WITH CHECK ADD  CONSTRAINT [FK_SortBysMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SortBys] CHECK CONSTRAINT [FK_SortBysMenuName_UITerms]

ALTER TABLE [dbo].[SortBys]  WITH CHECK ADD  CONSTRAINT [FK_SortBysMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SortBys] CHECK CONSTRAINT [FK_SortBysMouseOver_UITerms]

ALTER TABLE [dbo].[SortBys]  WITH CHECK ADD  CONSTRAINT [FK_SortBysName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SortBys] CHECK CONSTRAINT [FK_SortBysName_UITerms]

ALTER TABLE [dbo].[Statuses]  WITH CHECK ADD  CONSTRAINT [FK_StatusesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Statuses] CHECK CONSTRAINT [FK_StatusesDescription_UITerms]

ALTER TABLE [dbo].[Statuses]  WITH CHECK ADD  CONSTRAINT [FK_StatusesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Statuses] CHECK CONSTRAINT [FK_StatusesMenuName_UITerms]

ALTER TABLE [dbo].[Statuses]  WITH CHECK ADD  CONSTRAINT [FK_StatusesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Statuses] CHECK CONSTRAINT [FK_StatusesMouseOver_UITerms]

ALTER TABLE [dbo].[Statuses]  WITH CHECK ADD  CONSTRAINT [FK_StatusesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Statuses] CHECK CONSTRAINT [FK_StatusesName_UITerms]

ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_SubRegions_Regions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Regions] ([RegionID])

ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_SubRegions_Regions]

ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_SubRegionsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_SubRegionsDescription_UITerms]

ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_SubRegionsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_SubRegionsMenuName_UITerms]

ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_SubRegionsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_SubRegionsMouseOver_UITerms]

ALTER TABLE [dbo].[SubRegions]  WITH CHECK ADD  CONSTRAINT [FK_SubRegionsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[SubRegions] CHECK CONSTRAINT [FK_SubRegionsName_UITerms]

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

ALTER TABLE [dbo].[UserMenus]  WITH CHECK ADD  CONSTRAINT [FK_UserMenus_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenus] CHECK CONSTRAINT [FK_UserMenus_AspNetUsers]

ALTER TABLE [dbo].[UserMenus]  WITH CHECK ADD  CONSTRAINT [FK_UserMenus_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenus] CHECK CONSTRAINT [FK_UserMenus_AspNetUsers1]

ALTER TABLE [dbo].[UserMenus]  WITH CHECK ADD  CONSTRAINT [FK_UserMenus_AspNetUsers2] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenus] CHECK CONSTRAINT [FK_UserMenus_AspNetUsers2]

ALTER TABLE [dbo].[UserMenus]  WITH CHECK ADD  CONSTRAINT [FK_UserMenus_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[UserMenus] CHECK CONSTRAINT [FK_UserMenus_Icons]

ALTER TABLE [dbo].[UserMenus]  WITH CHECK ADD  CONSTRAINT [FK_UserMenus_UserMenuTypes] FOREIGN KEY([UserMenuTypeIDLeft])
REFERENCES [dbo].[UserMenuTypes] ([UserMenuTypeID])

ALTER TABLE [dbo].[UserMenus] CHECK CONSTRAINT [FK_UserMenus_UserMenuTypes]

ALTER TABLE [dbo].[UserMenus]  WITH CHECK ADD  CONSTRAINT [FK_UserMenus_UserMenuTypes1] FOREIGN KEY([UserMenuTypeIDRight])
REFERENCES [dbo].[UserMenuTypes] ([UserMenuTypeID])

ALTER TABLE [dbo].[UserMenus] CHECK CONSTRAINT [FK_UserMenus_UserMenuTypes1]

ALTER TABLE [dbo].[UserMenuTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateLanguages_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplateLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateLanguages_AspNetUsers]

ALTER TABLE [dbo].[UserMenuTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateLanguages_AspNetUsers1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplateLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateLanguages_AspNetUsers1]

ALTER TABLE [dbo].[UserMenuTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateLanguages_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[UserMenuTemplateLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateLanguages_Languages]

ALTER TABLE [dbo].[UserMenuTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateLanguages_UserMenuTemplates] FOREIGN KEY([UserMenuTemplateId])
REFERENCES [dbo].[UserMenuTemplates] ([UserMenuTemplateId])

ALTER TABLE [dbo].[UserMenuTemplateLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateLanguages_UserMenuTemplates]

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateOptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateOptionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptionLanguages_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateOptionLanguages_Languages]

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptionLanguages_UserMenuTemplateOptions] FOREIGN KEY([UserMEnuTemplateOptionId], [UserMenuTemplateID])
REFERENCES [dbo].[UserMenuTemplateOptions] ([UserMenuTemplateOptionID], [UserMenuTemplateId])

ALTER TABLE [dbo].[UserMenuTemplateOptionLanguages] CHECK CONSTRAINT [FK_UserMenuTemplateOptionLanguages_UserMenuTemplateOptions]

ALTER TABLE [dbo].[UserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplateOptions] CHECK CONSTRAINT [FK_UserMenuTemplateOptions_AspNetUsers]

ALTER TABLE [dbo].[UserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplateOptions] CHECK CONSTRAINT [FK_UserMenuTemplateOptions_AspNetUsers1]

ALTER TABLE [dbo].[UserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptions_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[UserMenuTemplateOptions] CHECK CONSTRAINT [FK_UserMenuTemplateOptions_Icons]

ALTER TABLE [dbo].[UserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTemplates] FOREIGN KEY([UserMenuTemplateId])
REFERENCES [dbo].[UserMenuTemplates] ([UserMenuTemplateId])

ALTER TABLE [dbo].[UserMenuTemplateOptions] CHECK CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTemplates]

ALTER TABLE [dbo].[UserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTemplates1] FOREIGN KEY([UserMenuTemplateId])
REFERENCES [dbo].[UserMenuTemplates] ([UserMenuTemplateId])

ALTER TABLE [dbo].[UserMenuTemplateOptions] CHECK CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTemplates1]

ALTER TABLE [dbo].[UserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTypes] FOREIGN KEY([UserMenuTypeIDLeft])
REFERENCES [dbo].[UserMenuTypes] ([UserMenuTypeID])

ALTER TABLE [dbo].[UserMenuTemplateOptions] CHECK CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTypes]

ALTER TABLE [dbo].[UserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTypes1] FOREIGN KEY([UserMenuTypeIDRight])
REFERENCES [dbo].[UserMenuTypes] ([UserMenuTypeID])

ALTER TABLE [dbo].[UserMenuTemplateOptions] CHECK CONSTRAINT [FK_UserMenuTemplateOptions_UserMenuTypes1]

ALTER TABLE [dbo].[UserMenuTemplates]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplates_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplates] CHECK CONSTRAINT [FK_UserMenuTemplates_AspNetUsers]

ALTER TABLE [dbo].[UserMenuTemplates]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTemplates_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserMenuTemplates] CHECK CONSTRAINT [FK_UserMenuTemplates_AspNetUsers1]

ALTER TABLE [dbo].[UserMenuTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserMenuTypes] CHECK CONSTRAINT [FK_UserMenuTypes_UITerms]

ALTER TABLE [dbo].[UserMenuTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserMenuTypes] CHECK CONSTRAINT [FK_UserMenuTypes_UITerms1]

ALTER TABLE [dbo].[UserMenuTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserMenuTypes] CHECK CONSTRAINT [FK_UserMenuTypes_UITerms2]

ALTER TABLE [dbo].[UserMenuTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserMenuTypes] CHECK CONSTRAINT [FK_UserMenuTypes_UITerms3]

ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferences_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UserPreferences] CHECK CONSTRAINT [FK_UserPreferences_AspNetUsers]

ALTER TABLE [dbo].[UserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferences_UserPreferenceTypes1] FOREIGN KEY([PreferenceTypeID])
REFERENCES [dbo].[UserPreferenceTypes] ([UserPreferenceTypeID])

ALTER TABLE [dbo].[UserPreferences] CHECK CONSTRAINT [FK_UserPreferences_UserPreferenceTypes1]

ALTER TABLE [dbo].[UserPreferenceTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypeGroups] CHECK CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms]

ALTER TABLE [dbo].[UserPreferenceTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypeGroups] CHECK CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms1]

ALTER TABLE [dbo].[UserPreferenceTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypeGroups] CHECK CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms2]

ALTER TABLE [dbo].[UserPreferenceTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypeGroups] CHECK CONSTRAINT [FK_UserPreferenceTypeGroups_UITerms3]

ALTER TABLE [dbo].[UserPreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypes] CHECK CONSTRAINT [FK_UserPreferenceTypes_UITerms]

ALTER TABLE [dbo].[UserPreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypes] CHECK CONSTRAINT [FK_UserPreferenceTypes_UITerms1]

ALTER TABLE [dbo].[UserPreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypes] CHECK CONSTRAINT [FK_UserPreferenceTypes_UITerms2]

ALTER TABLE [dbo].[UserPreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[UserPreferenceTypes] CHECK CONSTRAINT [FK_UserPreferenceTypes_UITerms3]

ALTER TABLE [dbo].[UserPreferenceTypes]  WITH CHECK ADD  CONSTRAINT [FK_UserPreferenceTypes_UserPreferenceTypeGroups] FOREIGN KEY([UserPreferenceTypeGroupID])
REFERENCES [dbo].[UserPreferenceTypeGroups] ([UserPreferenceTypeGroupID])

ALTER TABLE [dbo].[UserPreferenceTypes] CHECK CONSTRAINT [FK_UserPreferenceTypes_UserPreferenceTypeGroups]

