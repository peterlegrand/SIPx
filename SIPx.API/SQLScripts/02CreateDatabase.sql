
/****** Object:  Table [dbo].[AddressTypeLanguages]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AddressTypeLanguages](
	[AddressTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AddressTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[AddressTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[AddressTypes]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/9/2021 4:40:36 PM ******/
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

/****** Object:  Table [dbo].[AttachmentTypes]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[AttachmentTypes](
	[AttachmentTypeId] [int] NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
 CONSTRAINT [PK_AttachmentTypes_1] PRIMARY KEY CLUSTERED 
(
	[AttachmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogAddressTypes]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogAddressTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogAspNetUsers]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogAspNetUsers](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationLanguages]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationLevelLanguages]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationLevelLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationLevelProperties]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationLevelProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationLevels]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationLevels](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationRelationTypeLanguages]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationRelationTypeLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationRelationTypes]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationRelationTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationRoles]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationRoles](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassifications]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassifications](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogClassifications] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationUsers]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationUsers](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationValueLanguages]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationValueLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationValueProperties]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationValueProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationValuePropertyLanguages]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationValuePropertyLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationValueRoles]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationValueRoles](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationValues]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationValues](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogClassificationValueUsers]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogClassificationValueUsers](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentClassificationValues]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentClassificationValues](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentProperties]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentPropertyLanguages]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentPropertyLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContents]    Script Date: 2/9/2021 4:40:36 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContents](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentTypeClassifications]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentTypeClassifications](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentTypeGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentTypeGroupLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentTypeGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentTypeGroups](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentTypeLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentTypeProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentTypeProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentUserEdit]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentUserEdit](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogContentUserRead]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogContentUserRead](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogGenders]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogGenders](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMenu1]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMenu1](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMenu1Languages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMenu1Languages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMenu2]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMenu2](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMenu2Languages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMenu2Languages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMenu3]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMenu3](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMenu3Languages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMenu3Languages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMetaContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMetaContents](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMVCFavoriteGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMVCFavoriteGroups](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogMVCFavorites]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogMVCFavorites](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



/****** Object:  Table [dbo].[ChangeLogPageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionClassificationValueConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionClassificationValueConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionContentConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionContentConditionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionContentConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionContentConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionOrganizationConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionOrganizationConditionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionOrganizationConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionOrganizationConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionPersonConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionPersonConditionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionPersonConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionPersonConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionProcessConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionProcessConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionProjectConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionProjectConditionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSectionProjectConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSectionProjectConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPageSections]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPageSections](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonAddresses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonAddresses](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonPropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonPropertyLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonRelations]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonRelations](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonRelationTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonRelationTypeLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonRelationTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonRelationTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersons]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersons](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonTelecoms]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonTelecoms](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonTypeLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonTypeProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonTypeProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPersonTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPersonTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPositionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPositionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPositions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPositions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcesses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcesses](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessFields]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessFields](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessMultis]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessMultis](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFieldConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFieldConditionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFieldConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFieldConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFieldLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFieldLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFields]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFields](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFlowConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFlowConditionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFlowConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFlowConditions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFlowLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFlowLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFlowPasses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFlowPasses](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFlowPassLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFlowPassLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeFlows]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeFlows](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeGroupLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeGroups](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeStageFields]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeStageFields](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeStageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeStageLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeStages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeStages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeStageTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeStageTypeLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProcessTypeStageTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProcessTypeStageTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectMatrixes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectMatrixes](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectMatrixes] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectMatrixTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectMatrixTypeLanguages](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectMatrixTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectMatrixTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectMatrixTypes](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectMatrixTypes] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectPropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectPropertyLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjects]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjects](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypeChildProjectTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypeChildProjectTypeLanguages](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectTypeChildProjectTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypeChildProjectTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypeChildProjectTypes](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectTypeChildProjectTypes] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypeClassifications]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypeClassifications](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectTypeClassifications] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypeLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypeMatrixes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypeMatrixes](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectTypeMatrixes_1] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypeMatrixLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypeMatrixLanguages](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeLogProjectTypeMatrixLanguages] PRIMARY KEY CLUSTERED 
(
	[ChangeLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypeProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypeProperties](
	[ChangeLogId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProjectTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProjectTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogProperties](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPropertyLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPropertyValueLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPropertyValueLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogPropertyValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogPropertyValues](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogRoleGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogRoleGroupLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogRoleGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogRoleGroups](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogRoleLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogRoleLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogSettings]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogSettings](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogTelecomTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogTelecomTypes](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogUserMenus]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogUserMenus](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogUserMenuTemplateLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogUserMenuTemplateLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogUserMenuTemplateOptionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogUserMenuTemplateOptionLanguages](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogUserMenuTemplateOptions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogUserMenuTemplateOptions](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogUserMenuTemplates]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogUserMenuTemplates](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeLogUserPreferences]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeLogUserPreferences](
	[ChangeLogId] [int] NOT NULL,
	[ColumnId] [int] NOT NULL,
	[ChangeTypeId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ChangeLogDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ChangeTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ChangeTypes](
	[ChangeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
 CONSTRAINT [PK_ChangeTypes] PRIMARY KEY CLUSTERED 
(
	[ChangeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClaimGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Claims]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationContents](
	[ClassificationContentId] [int] NOT NULL,
	[ClassificationId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ExplanationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationLevelContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationLevelContents](
	[ClassificationLevelContentId] [int] NOT NULL,
	[ClassificationLevelId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ExplanationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassificationLevelLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationLevelProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationLevelProperties](
	[ClassificationLevelPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationLevelID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[PropertyStatusId] [int] NOT NULL,
	[IsMultiple] [bit] NOT NULL,
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

/****** Object:  Table [dbo].[ClassificationLevels]    Script Date: 2/9/2021 4:40:37 PM ******/
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
	[CodePrefix] [nvarchar](25) NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[CodeTypeId] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ClassificationPageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationPages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationPageSectionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationPageSections]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationRelationTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationRelationTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationRoles]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Classifications]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationUsers]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationValueLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationValueProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationValuePropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationValueRoles]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ClassificationValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ClassificationValues](
	[ClassificationValueID] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ParentValueID] [int] NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeInt] [int] NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[Code] [nvarchar](50) NULL,
	[DateFrom] [datetimeoffset](7) NULL,
	[DateTo] [datetimeoffset](7) NULL,
	[Location] [geography] NULL,
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

/****** Object:  Table [dbo].[ClassificationValueUsers]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[CodeTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[CodeTypes](
	[CodeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_CodeTypes] PRIMARY KEY CLUSTERED 
(
	[CodeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentClassificationValues]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ContentPropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentPropertyLanguages](
	[ContentPropertyLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ContentPropertyID] [int] NOT NULL,
	[ContentID] [int] NOT NULL,
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
 CONSTRAINT [PK_ContentPropertyLanguages] PRIMARY KEY CLUSTERED 
(
	[ContentPropertyLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ContentPropertyValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentPropertyValues](
	[ContentPropertyValueID] [int] IDENTITY(1,1) NOT NULL,
	[ContentID] [int] NOT NULL,
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
 CONSTRAINT [PK_ContentProperties] PRIMARY KEY CLUSTERED 
(
	[ContentPropertyValueID] ASC,
	[ContentID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Contents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Contents](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentContentID] [int] NULL,
	[ContentTypeID] [int] NOT NULL,
	[ContentStatusID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[ActiveVersionId] [int] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeInt] [int] NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SecurityLevelID] [int] NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[ProjectID] [int] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ProcessID] [int] NULL,
	[ProcessTypeId] [int] NULL,
	[IsFreeEdit] [bit] NOT NULL,
	[IsFreeRead] [bit] NOT NULL,
	[IsRelationBasedEdit] [bit] NOT NULL,
	[IsRelationBasedRead] [bit] NOT NULL,
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
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentStatuses]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ContentTypeAttachedFileTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeAttachedFileTypes](
	[ContentTypeAttachedFileTypeId] [int] NOT NULL,
	[ContentTypeId] [int] NOT NULL,
	[FileTypeId] [int] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeClassifications]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeClassifications](
	[ContentTypeClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ObjectTypeClassificationStatusID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeClassifications] PRIMARY KEY CLUSTERED 
(
	[ContentTypeClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeContents](
	[ContentTypeContentId] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ExplanationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeContents] PRIMARY KEY CLUSTERED 
(
	[ContentTypeContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ContentTypeGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ContentTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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
	[RatingLabel] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ContentTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeOrganizationRoles]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeOrganizationRoles](
	[ContentTypeOrganizationRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RightTypeId] [int] NOT NULL,
	[ContentTypeId] [int] NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContentTypeOrganizationRoles] PRIMARY KEY CLUSTERED 
(
	[ContentTypeOrganizationRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeProjectRoles]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeProjectRoles](
	[ContentTypeProjectRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RightTypeId] [int] NOT NULL,
	[ContentTypeId] [int] NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContentTypeProjectRoles] PRIMARY KEY CLUSTERED 
(
	[ContentTypeProjectRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeProperties](
	[ContentTypePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ObjectTypePropertyStatusId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentTypeProperties] PRIMARY KEY CLUSTERED 
(
	[ContentTypePropertyID] ASC,
	[ContentTypeID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypeRelations]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypeRelations](
	[ContentTypeProjectRelationId] [int] IDENTITY(1,1) NOT NULL,
	[RightTypeId] [int] NOT NULL,
	[ContentTypeId] [int] NOT NULL,
	[PersonRelationTypeID] [int] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContentTypeProjectRelations] PRIMARY KEY CLUSTERED 
(
	[ContentTypeProjectRelationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentTypes](
	[ContentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ContentTypeGroupID] [int] NOT NULL,
	[ContentProcessTypeID] [int] NULL,
	[ContentVersionProcessTypeId] [int] NULL,
	[SecurityLevelID] [int] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[CodeTypeId] [int] NOT NULL,
	[VersionTypeId] [int] NULL,
	[AttachmentVersionTypeId] [int] NULL,
	[AttachmentTypeId] [int] NULL,
	[ObjectTypeStatusId] [int] NOT NULL,
	[IsClaimOwnership] [int] NOT NULL,
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
	[IsOrganizationRoleBasedAllRoles] [bit] NULL,
	[IsOrganizationRoleBasedOwner] [bit] NULL,
	[IsOrganizationRoleBasedRead] [bit] NULL,
	[IsOrganizationRoleBasedEdit] [bit] NULL,
	[IsOrganizationRoleBasedReadSelectable] [bit] NULL,
	[IsOrganizationRoleBasedEditSelectable] [bit] NULL,
	[IsProjectBasedEdit] [bit] NOT NULL,
	[IsProjectBasedEditSelectable] [bit] NOT NULL,
	[IsProjectBasedEditSub] [bit] NOT NULL,
	[IsProjectBasedEditParent] [bit] NOT NULL,
	[IsFreeEdit] [bit] NOT NULL,
	[IsProjectRoleBasedAllRoles] [bit] NULL,
	[IsProjectRoleBasedOwner] [bit] NULL,
	[IsProjectRoleBasedRead] [bit] NULL,
	[IsProjectRoleBasedEdit] [bit] NULL,
	[IsProjectRoleBasedReadSelectable] [bit] NULL,
	[IsProjectRoleBasedEditSelectable] [bit] NULL,
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
	[CanRate] [bit] NOT NULL,
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

/****** Object:  Table [dbo].[ContentUserEdit]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ContentUserRead]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ContentVersionAttachments]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentVersionAttachments](
	[ContentVersionAttachmentId] [int] IDENTITY(1,1) NOT NULL,
	[ContentVersionId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ActiveVersionId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FileTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentAttachments] PRIMARY KEY CLUSTERED 
(
	[ContentVersionAttachmentId] ASC,
	[ContentVersionId] ASC,
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentVersionAttachmentVersions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentVersionAttachmentVersions](
	[ContentVersionAttachmentVersionId] [int] IDENTITY(1,1) NOT NULL,
	[ContentVersionAttachmentId] [int] NOT NULL,
	[ContentVersionId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[VersionStatusId] [int] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentAttachmentVersions] PRIMARY KEY CLUSTERED 
(
	[ContentVersionAttachmentVersionId] ASC,
	[ContentVersionAttachmentId] ASC,
	[ContentVersionId] ASC,
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ContentVersions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ContentVersions](
	[ContentVersionId] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[VersionStatusId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ProcessID] [int] NULL,
	[ProcessTypeId] [int] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ContentVersions] PRIMARY KEY CLUSTERED 
(
	[ContentVersionId] ASC,
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Countries]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[DataDictionaryColumns]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DataDictionaryColumns](
	[ColumnId] [int] IDENTITY(1,1) NOT NULL,
	[TableId] [int] NOT NULL,
	[ColumnTypeId] [int] NOT NULL,
	[ColumnName] [varchar](50) NOT NULL,
	[ColumnLength] [int] NOT NULL,
	[ColumnPrecision] [int] NOT NULL,
	[ColumnScale] [int] NOT NULL,
	[IsNullable] [bit] NOT NULL,
	[IsIdentity] [bit] NOT NULL,
	[IsComputed] [bit] NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_DataDictionaryColumns] PRIMARY KEY CLUSTERED 
(
	[ColumnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[DataDictionaryColumnTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DataDictionaryColumnTypes](
	[ColumnTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ColumnTypeName] [varchar](50) NOT NULL,
	[MicrosoftId] [int] NULL,
 CONSTRAINT [PK_DataDictionaryColumnTypes] PRIMARY KEY CLUSTERED 
(
	[ColumnTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[DataDictionaryTables]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[DataDictionaryTables](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](100) NOT NULL,
	[IsMasterTable] [bit] NOT NULL,
	[IsAspNetTable] [bit] NOT NULL,
	[IsLanguageTable] [bit] NOT NULL,
	[IsStandardLanguageTable] [bit] NOT NULL,
	[HasCreator] [bit] NOT NULL,
	[HasModifier] [bit] NOT NULL,
	[ParentTableId] [int] NULL,
	[SecondParentTableId] [int] NULL,
	[IsGroupTable] [bit] NOT NULL,
	[IsTypeTable] [bit] NOT NULL,
	[IsObsoleteTable] [bit] NOT NULL,
	[IsPropertyTable] [bit] NOT NULL,
	[IsReadLog] [bit] NULL,
	[IsChangeLog] [bit] NULL,
	[InternalName] [varchar](100) NOT NULL,
	[InternalNamePlural] [varchar](100) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[PluralNameTermID] [int] NULL,
	[PluralDescriptionTermID] [int] NULL,
	[PluralMenuNameTermID] [int] NULL,
	[PluralMouseOverTermID] [int] NULL,
 CONSTRAINT [PK_DataDictionaryTable] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[DateLevels]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ErrorMessages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ExplanationTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ExplanationTypes](
	[ExplanationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ExplanationTypes] PRIMARY KEY CLUSTERED 
(
	[ExplanationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[FileTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[FileTypes](
	[FileTypeId] [int] NOT NULL,
	[FileExtension] [nchar](20) NOT NULL,
	[MimeType] [nchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AttachmentTypes] PRIMARY KEY CLUSTERED 
(
	[FileTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Genders]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Icons]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[IntermediateRegions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Languages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Menu1]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Menu1Languages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Menu2]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Menu2Languages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Menu3]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Menu3Languages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[MenuTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[MetaContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MetaContents](
	[MetaContentId] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[MetaContentTypeId] [int] NOT NULL,
	[MetaTypeId] [int] NULL,
	[MetaRecordId] [int] NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MetaContents] PRIMARY KEY CLUSTERED 
(
	[MetaContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MetaContentTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MetaContentTypes](
	[MetaContentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
 CONSTRAINT [PK_MetaContentTypes] PRIMARY KEY CLUSTERED 
(
	[MetaContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MetaTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MetaTypes](
	[MetaTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
 CONSTRAINT [PK_MetaTypes] PRIMARY KEY CLUSTERED 
(
	[MetaTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MVCFavoriteGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MVCFavoriteGroups](
	[MVCFavoriteGroupId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_FavoriteGroups] PRIMARY KEY CLUSTERED 
(
	[MVCFavoriteGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MVCFavorites]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MVCFavorites](
	[MVCFavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sequence] [int] NOT NULL,
	[MVCFavoriteGroupId] [int] NULL,
	[Controller] [varchar](50) NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[RouteId] [int] NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[MVCFavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MVCUIScreenLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[MVCUIScreens]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[MVCUIScreens](
	[MVCUIScreenID] [int] IDENTITY(1,1) NOT NULL,
	[Controller] [varchar](50) NOT NULL,
	[Action] [varchar](50) NOT NULL,
	[IsLogRecordGrid] [bit] NOT NULL,
	[IsObsolete] [bit] NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_MVCUIScreens] PRIMARY KEY CLUSTERED 
(
	[MVCUIScreenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[MVCUITermScreens]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ObjectTypeClassificationStatuses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ObjectTypeClassificationStatuses](
	[ObjectTypeClassificationStatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ContentTypeClassificationStatus] PRIMARY KEY CLUSTERED 
(
	[ObjectTypeClassificationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ObjectTypePropertyStatuses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ObjectTypePropertyStatuses](
	[ObjectTypePropertyStatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_PropertyStatuses] PRIMARY KEY CLUSTERED 
(
	[ObjectTypePropertyStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ObjectTypeStatuses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ObjectTypeStatuses](
	[ObjectTypeStatusID] [int] NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ObjectTypeStatuses] PRIMARY KEY CLUSTERED 
(
	[ObjectTypeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationAddresses]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationClassificationValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationClassificationValues](
	[OrganizationClassificationValueID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationClassificationValues] PRIMARY KEY CLUSTERED 
(
	[OrganizationClassificationValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationPersons]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationPersons](
	[OrganizationPersonID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationPersons] PRIMARY KEY CLUSTERED 
(
	[OrganizationPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationPropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationPropertyLanguages](
	[OrganizationPropertyLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationPropertyID] [int] NOT NULL,
	[OrganizationID] [int] NOT NULL,
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
 CONSTRAINT [PK_OrganizationPropertyLanguages] PRIMARY KEY CLUSTERED 
(
	[OrganizationPropertyLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationPropertyValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationPropertyValues](
	[OrganizationPropertyValueID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationID] [int] NOT NULL,
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
 CONSTRAINT [PK_OrganizationProperties] PRIMARY KEY CLUSTERED 
(
	[OrganizationPropertyValueID] ASC,
	[OrganizationID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Organizations]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Organizations](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[ParentOrganizationID] [int] NULL,
	[StatusID] [int] NOT NULL,
	[OrganizationTypeID] [int] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeInt] [int] NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[Code] [nvarchar](50) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationSettings]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationSettingTypeGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationSettingTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationTelecomPhones]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationTelecoms]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationTypeChildOrganizationTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages](
	[OrganizationTypeChildOrganizationTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationTypeChildOrganizationTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeChildOrganizationTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeChildOrganizationTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypeChildOrganizationTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypeChildOrganizationTypes](
	[OrganizationTypeChildOrganizationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ParentOrganizationTypeId] [int] NOT NULL,
	[ChildOrganizationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeChildOrganizationTypes] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeChildOrganizationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypeClassifications]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypeClassifications](
	[OrganizationTypeClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationTypeID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ObjectTypeClassificationStatusID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeClassifications] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypeContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypeContents](
	[OrganizationTypeContentId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationTypeId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ExplanationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeContents] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypeContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[OrganizationTypeProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypeProperties](
	[OrganizationTypePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationTypeID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ObjectTypePropertyStatusId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrganizationTypeProperties] PRIMARY KEY CLUSTERED 
(
	[OrganizationTypePropertyID] ASC,
	[OrganizationTypeID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[OrganizationTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganizationTypes](
	[OrganizationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[HasAnyChildOrganization] [bit] NOT NULL,
	[Internal] [bit] NOT NULL,
	[LegalEntity] [bit] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[CodeTypeId] [int] NOT NULL,
	[ObjectTypeStatusId] [int] NOT NULL,
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

/****** Object:  Table [dbo].[PageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Pages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionClassificationValueConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionClassificationValueConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionClassificationValueConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionContentConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionContentConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionContentConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionDataTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionOrganizationConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionOrganizationConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionOrganizationConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionPersonConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionPersonConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionPersonConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionProcessConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionProcessConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionProcessConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionProjectConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionProjectConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionProjectConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSections]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PageSectionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PersonAddresses]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PersonClassificationValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonClassificationValues](
	[PersonClassificationValueID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonClassificationValues] PRIMARY KEY CLUSTERED 
(
	[PersonClassificationValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonPropertValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonPropertValues](
	[PersonPropertyValueID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
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
 CONSTRAINT [PK_PersonProperties] PRIMARY KEY CLUSTERED 
(
	[PersonPropertyValueID] ASC,
	[PersonID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PersonPropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonPropertyLanguages](
	[PersonPropertyLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PersonPropertyID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
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
 CONSTRAINT [PK_PersonPropertyLanguages] PRIMARY KEY CLUSTERED 
(
	[PersonPropertyLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PersonRelations]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PersonRelationTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PersonRelationTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Persons]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeId] [int] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeInt] [int] NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[Code] [nvarchar](50) NULL,
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

/****** Object:  Table [dbo].[PersonTelecomPhones]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PersonTelecoms]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PersonTypeClassifications]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTypeClassifications](
	[PersonTypeClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ObjectTypeClassificationStatusID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonTypeClassifications] PRIMARY KEY CLUSTERED 
(
	[PersonTypeClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTypeContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTypeContents](
	[PersonTypeContentId] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ExplanationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonTypeContents] PRIMARY KEY CLUSTERED 
(
	[PersonTypeContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTypeLanguages](
	[PersonTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[PersonTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTypeProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTypeProperties](
	[PersonTypePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PersonTypeID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ObjectTypePropertyStatusId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonTypeProperties] PRIMARY KEY CLUSTERED 
(
	[PersonTypePropertyID] ASC,
	[PersonTypeID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PersonTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PersonTypes](
	[PersonTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[CodeTypeId] [int] NOT NULL,
	[ObjectTypeStatusId] [int] NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PersonTypes] PRIMARY KEY CLUSTERED 
(
	[PersonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PositionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[PositionLanguages](
	[PositionLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[PositionId] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PositionLanguages] PRIMARY KEY CLUSTERED 
(
	[PositionLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Positions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[PreferenceTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Processes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Processes](
	[ProcessID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeStageID] [int] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeInt] [int] NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[Code] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ProcessMultiID] [int] NULL,
 CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED 
(
	[ProcessID] ASC,
	[ProcessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessFields]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessFields](
	[ProcessFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessID] [int] NOT NULL,
	[ProcessTypeFieldID] [int] NOT NULL,
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

/****** Object:  Table [dbo].[ProcessMultis]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ProcessTypeContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeContents](
	[ProcessTypeContentId] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ExplanationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypecontents] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFieldConditionComparisonOperators]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators](
	[ProcessTypeFieldConditionComparisonOperatorID] [int] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](2) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTypeFieldConditionComparisonOperators] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFieldConditionComparisonOperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFieldConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFieldConditionLanguages](
	[ProcessTypeFieldConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFieldID] [int] NOT NULL,
	[ProcessTypeFieldConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFieldConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFieldConditionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFieldConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFieldConditions](
	[ProcessTypeFieldConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFieldID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ProcessTypeFieldConditionTypeID] [int] NOT NULL,
	[ComparisonOperatorID] [int] NULL,
	[ProcessTypeFieldConditionString] [nvarchar](max) NULL,
	[ProcessTypeFieldConditionInt] [int] NULL,
	[ProcessTypeFieldConditionDate] [datetime2](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFieldConditions] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFieldConditionID] ASC,
	[ProcessTypeID] ASC,
	[ProcessTypeFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFieldConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFieldConditionTypes](
	[ProcessTypeFieldConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeFieldTypeID] [int] NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTypeFieldConditionTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFieldConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFieldLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFieldLanguages](
	[ProcessTypeFieldLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFieldID] [int] NOT NULL,
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
 CONSTRAINT [PK_ProcessTypeFieldLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFieldLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFields]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFields](
	[ProcessTypeFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFieldTypeID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DbProcessTypeField] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFieldID] ASC,
	[ProcessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFieldTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFieldTypes](
	[ProcessTypeFieldTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTypeFieldTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFieldTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowConditionComparisonOperators]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators](
	[ProcessTypeFlowConditionComparisonOperatorID] [int] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](2) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTypeFlowConditionComparisonOperators] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowConditionComparisonOperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowConditionLanguages](
	[ProcessTypeFlowConditionLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFlowID] [int] NOT NULL,
	[ProcessTypeFlowConditionID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlowConditionLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowConditionLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowConditions]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowConditions](
	[ProcessTypeFlowConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFlowID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ProcessTypeFlowConditionTypeID] [int] NOT NULL,
	[ProcessTypeFieldID] [int] NULL,
	[ProcessTypeFieldIDRole] [int] NULL,
	[ComparisonOperatorID] [int] NULL,
	[ProcessTypeFlowConditionString] [nvarchar](max) NULL,
	[ProcessTypeFlowConditionInt] [int] NULL,
	[ProcessTypeFlowConditionDate] [datetime2](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlowConditions] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowConditionID] ASC,
	[ProcessTypeID] ASC,
	[ProcessTypeFlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowConditionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowConditionTypes](
	[ProcessTypeFlowConditionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlowConditionTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowConditionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowLanguages](
	[ProcessTypeFlowLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFlowID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlowLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowPassComparisonOperators]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowPassComparisonOperators](
	[ProcessTypeFlowPassComparisonOperatorID] [int] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](2) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTypeFlowPassComparisonOperators] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowPassComparisonOperatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowPasses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowPasses](
	[ProcessTypeFlowPassID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFlowID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ProcessTypeFlowPassTypeID] [int] NOT NULL,
	[ProcessTypeFieldID] [int] NULL,
	[ProcessTypeFieldIDRole] [int] NULL,
	[ComparisonOperatorID] [int] NULL,
	[ProcessTypeFlowPassString] [nvarchar](max) NULL,
	[ProcessTypeFlowPassInt] [int] NULL,
	[ProcessTypeFlowPassDate] [datetime2](7) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlowPasses] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowPassID] ASC,
	[ProcessTypeID] ASC,
	[ProcessTypeFlowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowPassLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowPassLanguages](
	[ProcessTypeFlowPassLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFlowID] [int] NOT NULL,
	[ProcessTypeFlowPassID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlowPassLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowPassLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlowPassTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlowPassTypes](
	[ProcessTypeFlowPassTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlowPassTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowPassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeFlows]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeFlows](
	[ProcessTypeFlowID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeFromStageID] [int] NOT NULL,
	[ProcessTypeToStageID] [int] NOT NULL,
	[CreatorId] [nvarchar](450) NOT NULL,
	[ModifierId] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeFlows] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeFlowID] ASC,
	[ProcessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeGroupLanguages](
	[ProcessTypeGroupLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeGroupID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeGroupLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeGroupLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeGroups](
	[ProcessTypeGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Sequence] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeGroups] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeLanguages](
	[ProcessTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypes](
	[ProcessTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeGroupID] [int] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[CodeTypeId] [int] NOT NULL,
	[ShowInPersonalCalendar] [bit] NOT NULL,
	[ShowInOrganizationCalendar] [bit] NULL,
	[ShowInProjectCalendar] [bit] NULL,
	[ShowInEventCalendar] [bit] NOT NULL,
	[ProcessMultiMax] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsPersonal] [bit] NOT NULL,
	[ObjectTypeStatusId] [int] NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeStageFields]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeStageFields](
	[ProcessTypeStageFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeStageID] [int] NOT NULL,
	[ProcessTypeFieldID] [int] NOT NULL,
	[ProcessTypeStageFieldStatusID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[ValueUpdateTypeID] [int] NOT NULL,
	[StringValue] [nvarchar](max) NULL,
	[IntValue] [int] NULL,
	[LocationValue] [geography] NULL,
	[DateTimeValue] [datetime2](7) NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeStageFields] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeStageFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeStageFieldStatuses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeStageFieldStatuses](
	[ProcessTypeStageFieldStatusID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_ProcessTypeStageFieldStatuses] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeStageFieldStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeStageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeStageLanguages](
	[ProcessTypeStageLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeStageID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeStageLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeStageLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeStages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeStages](
	[ProcessTypeStageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeID] [int] NOT NULL,
	[ProcessTypeStageTypeID] [int] NOT NULL,
	[InToDo] [bit] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeStages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeStageID] ASC,
	[ProcessTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeStageTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeStageTypeLanguages](
	[ProcessTypeStageTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessTypeStageTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeStageTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeStageTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProcessTypeStageTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProcessTypeStageTypes](
	[ProcessTypeStageTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [char](9) NOT NULL,
	[IconID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProcessTypeStageTypes] PRIMARY KEY CLUSTERED 
(
	[ProcessTypeStageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectClassificationValues]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectClassificationValues](
	[ProjectClassificationValueID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[ClassificationValueID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectClassificationValues] PRIMARY KEY CLUSTERED 
(
	[ProjectClassificationValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ProjectMatrixes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectMatrixes](
	[ProjectMatrixID] [int] IDENTITY(1,1) NOT NULL,
	[FromProjectId] [int] NOT NULL,
	[ToProjectId] [int] NOT NULL,
	[ProjectMatrixTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectMatrixes] PRIMARY KEY CLUSTERED 
(
	[ProjectMatrixID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectMatrixLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectMatrixLanguages](
	[ProjectMatrixLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectMatrixId] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectMatrixLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectMatrixLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectMatrixTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectMatrixTypeLanguages](
	[ProjectMatrixTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectMatrixTypeId] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectMatrixTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectMatrixTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectMatrixTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectMatrixTypes](
	[ProjectMatrixTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectMatrixTypes] PRIMARY KEY CLUSTERED 
(
	[ProjectMatrixTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectProperties](
	[ProjectPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
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
 CONSTRAINT [PK_ProjectProperties] PRIMARY KEY CLUSTERED 
(
	[ProjectPropertyID] ASC,
	[ProjectID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectPropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectPropertyLanguages](
	[ProjectPropertyLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectPropertyID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
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
 CONSTRAINT [PK_ProjectPropertyLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectPropertyLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Projects]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ParentProjectID] [int] NULL,
	[ProjectTypeID] [int] NOT NULL,
	[SecurityLevelID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeInt] [int] NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[Code] [nvarchar](50) NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypeChildProjectTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeChildProjectTypeLanguages](
	[ProjectTypeChildProjectTypeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTypeChildProjectTypeID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeChildProjectTypeLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeChildProjectTypeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypeChildProjectTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeChildProjectTypes](
	[ProjectTypeChildProjectTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ParentProjectTypeId] [int] NOT NULL,
	[ChildProjectTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeChildProjectTypes] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeChildProjectTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypeClassifications]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeClassifications](
	[ProjectTypeClassificationID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTypeID] [int] NOT NULL,
	[ClassificationID] [int] NOT NULL,
	[ObjectTypeClassificationStatusID] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeClassifications] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypeContents]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeContents](
	[ProjectTypeContentId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTypeId] [int] NOT NULL,
	[ContentId] [int] NOT NULL,
	[ExplanationTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeContents] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ProjectTypeMatrixes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeMatrixes](
	[ProjectTypeMatrixID] [int] IDENTITY(1,1) NOT NULL,
	[FromProjectTypeId] [int] NOT NULL,
	[ToProjectTypeId] [int] NOT NULL,
	[ProjectMatrixTypeId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeMatrixes] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeMatrixID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypeMatrixLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeMatrixLanguages](
	[ProjectTypeMatrixLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTypeMatrixId] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeMatrixLanguages] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeMatrixLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypeProperties]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypeProperties](
	[ProjectTypePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTypeID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ObjectTypePropertyStatusId] [int] NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProjectTypeProperties] PRIMARY KEY CLUSTERED 
(
	[ProjectTypePropertyID] ASC,
	[ProjectTypeID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ProjectTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProjectTypes](
	[ProjectTypeID] [int] IDENTITY(1,1) NOT NULL,
	[HasAnyChildProject] [bit] NOT NULL,
	[HasAnyMatrixProject] [bit] NULL,
	[CodePrefix] [nvarchar](25) NULL,
	[CodeSuffix] [nvarchar](25) NULL,
	[CodeTypeId] [int] NOT NULL,
	[ObjectTypeStatusId] [int] NOT NULL,
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

/****** Object:  Table [dbo].[Properties]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PropertyLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PropertyTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PropertyValueLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[PropertyValues]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ReadLogAddressTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogAddressTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogAddressTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogAddressTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogAddressTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogAddressTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogAddressTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogAddressTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogAddressTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogAdminList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogAdminList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogAdminList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogAspNetUserCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogAspNetUserCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [nvarchar](450) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogAspNetUserCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationLevelCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationLevelCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationLevelCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationLevelLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationLevelLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationLevelLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationLevelList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationLevelList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationLevelList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationLevelPropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationLevelPropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationLevelPropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationLevelPropertyList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationLevelPropertyList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationLevelPropertyList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationRelationTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationRelationTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationRelationTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationRelationTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationRelationTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationRelationTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationRelationTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationRelationTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationRelationTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationRoleCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationRoleCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationRoleCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationRoleList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationRoleList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationRoleList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationUserCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationUserCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationUserCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationUserList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationUserList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationUserList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValueCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValueCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValueCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValueLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValueLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValueLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValueList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValueList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValueList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValuePropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValuePropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValuePropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValuePropertyLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValuePropertyLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValuePropertyLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValuePropertyList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValuePropertyList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValuePropertyList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValueRoleCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValueRoleCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValueRoleCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValueRoleList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValueRoleList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValueRoleList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValueUserCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValueUserCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValueUserCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogClassificationValueUserList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogClassificationValueUserList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogClassificationValueUserList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentClassificationValueCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentClassificationValueCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentClassificationValueCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentPropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentPropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentPropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentPropertyLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentPropertyLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentPropertyLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypeClassificationCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypeClassificationCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypeClassificationCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypeGroupCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypeGroupCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypeGroupCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypeGroupLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypeGroupLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypeGroupLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypeGroupList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypeGroupList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypeGroupList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypePropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypePropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypePropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentTypePropertyList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentTypePropertyList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentTypePropertyList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentUserEditCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentUserEditCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentUserEditCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogContentUserReadCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogContentUserReadCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogContentUserReadCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontOrganizationList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontOrganizationList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontOrganizationList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontProjectList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontProjectList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontProjectList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontUserFavoriteList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontUserFavoriteList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontUserFavoriteList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontUserMenuList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontUserMenuList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontUserMenuList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontUserPageList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontUserPageList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontUserPageList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontUserPageSectionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontUserPageSectionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontUserPageSectionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogFrontUserPreferenceList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogFrontUserPreferenceList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogFrontUserPreferenceList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogGenderCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogGenderCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogGenderCUD_1] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogLanguageList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogLanguageList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogLanguageList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMenu1CUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMenu1CUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMenu1CUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMenu1LanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMenu1LanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMenu1LanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMenu2CUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMenu2CUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMenu2CUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMenu2LanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMenu2LanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMenu2LanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMenu3CUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMenu3CUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMenu3CUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMenu3LanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMenu3LanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMenu3LanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMetaContentCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMetaContentCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMetaContentCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMetaContentList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMetaContentList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMetaContentList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMVCFavoriteCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMVCFavoriteCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMVCFavoriteCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMVCFavoriteGroupCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMVCFavoriteGroupCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMVCFavoriteGroupCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogMVCUIScreenList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogMVCUIScreenList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogMVCUIScreenList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[ReadLogPageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionClassificationValueConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionClassificationValueConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionClassificationValueConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionClassificationValueConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionClassificationValueConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionClassificationValueConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionContentConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionContentConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionContentConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionContentConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionContentConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionContentConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionContentConditionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionContentConditionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionContentConditionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionOrganizationConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionOrganizationConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionOrganizationConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionOrganizationConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionPersonConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionPersonConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionPersonConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionPersonConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionPersonConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionPersonConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionProcessConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionProcessConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionProcessConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionProcessConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionProcessConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionProcessConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionProcessConditionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionProcessConditionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionProcessConditionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionProjectConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionProjectConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionProjectConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPageSectionProjectConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPageSectionProjectConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPageSectionProjectConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonAddressCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonAddressCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonAddressCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonAddressList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonAddressList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonAddressList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonPositionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonPositionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonPositionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonPropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonPropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonPropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonPropertyLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonPropertyLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonPropertyLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonRelationCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonRelationCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonRelationCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonRelationList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonRelationList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonRelationList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonRelationTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonRelationTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonRelationTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonRelationTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonRelationTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonRelationTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonRelationTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonRelationTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonRelationTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonTelecomCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonTelecomCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonTelecomCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonTelecomList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonTelecomList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonTelecomList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonTypePropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonTypePropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonTypePropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPersonTypePropertyList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPersonTypePropertyList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPersonTypePropertyList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPositionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPositionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPositionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPositionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPositionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPositionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPositionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPositionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPositionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessFieldCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessFieldCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessFieldCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessMultiCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessMultiCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessMultiCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFieldConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFieldConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFieldConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFieldConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFieldCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFieldCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFieldCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFieldLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFieldLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFieldLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFieldList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFieldList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFieldList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFieldStageList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFieldStageList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFieldStageList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowConditionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowConditionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowConditionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowConditionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowConditionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowConditionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowConditionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowPassCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowPassCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowPassCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowPassLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowPassLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowPassLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeFlowPassList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeFlowPassList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeFlowPassList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeGroupCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeGroupCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeGroupCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeGroupLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeGroupLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeGroupLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeGroupList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeGroupList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeGroupList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageFieldCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageFieldCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageFieldU] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageFieldList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageFieldList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageFieldList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProcessTypeStageTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProcessTypeStageTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProcessTypeStageTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectMatrixTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectMatrixTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectMatrixTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectMatrixTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectMatrixTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectMatrixTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectPropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectPropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectPropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectPropertyLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectPropertyLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectPropertyLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectTypeClassificationCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectTypeClassificationCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectTypeClassificationCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectTypeClassificationList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectTypeClassificationList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectTypeClassificationList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectTypeLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectTypeLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectTypeLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectTypeList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectTypeList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectTypeList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectTypePropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectTypePropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectTypePropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogProjectTypePropertyList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogProjectTypePropertyList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogProjectTypePropertyList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPropertyCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPropertyCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPropertyCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPropertyLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPropertyLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPropertyLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPropertyList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPropertyList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPropertyList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPropertyValueCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPropertyValueCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPropertyValueCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPropertyValueLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPropertyValueLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPropertyValueLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogPropertyValueList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogPropertyValueList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogPropertyValueList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogRoleClaimList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogRoleClaimList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogRoleClaimList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogRoleGroupCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogRoleGroupCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogRoleGroupCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogRoleGroupLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogRoleGroupLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogRoleGroupLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogRoleGroupList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogRoleGroupList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogRoleGroupList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogRoleLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogRoleLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogRoleLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogSettingCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogSettingCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogSettingCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogSettingList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogSettingList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogSettingList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogTelecomTypeCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogTelecomTypeCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogTelecomTypeCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogTodoList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogTodoList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogTodoList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUITermList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUITermList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUITermList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserMenuCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserMenuCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserMenuCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserMenuTemplateCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserMenuTemplateCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserMenuTemplateCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserMenuTemplateLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserMenuTemplateLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserMenuTemplateLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserMenuTemplateList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserMenuTemplateList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserMenuTemplateList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserMenuTemplateOptionCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserMenuTemplateOptionCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserMenuTemplateOptionCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserMenuTemplateOptionLanguageCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserMenuTemplateOptionList]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserMenuTemplateOptionList](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserMenuTemplateOptionList] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReadLogUserPreferenceCUD]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ReadLogUserPreferenceCUD](
	[ReadLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ReadLogDate] [datetime] NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableId] [int] NOT NULL,
 CONSTRAINT [PK_ReadLogUserPreferenceCUD] PRIMARY KEY CLUSTERED 
(
	[ReadLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


/****** Object:  Table [dbo].[Regions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[RightTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[RightTypes](
	[RightTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NameTermID] [int] NULL,
	[DescriptionTermID] [int] NULL,
	[MenuNameTermID] [int] NULL,
	[MouseOverTermID] [int] NULL,
 CONSTRAINT [PK_RightTypes] PRIMARY KEY CLUSTERED 
(
	[RightTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[RoleGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[RoleGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[RoleLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ScreenTables]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ScreenTables](
	[ScreenTableId] [int] IDENTITY(1,1) NOT NULL,
	[MVCUIScreenID] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[IsMainTable] [bit] NULL,
 CONSTRAINT [PK_ScreenTables] PRIMARY KEY CLUSTERED 
(
	[ScreenTableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[SecurityLevels]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Settings]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Settings](
	[SettingID] [int] NOT NULL,
	[IntValue] [int] NULL,
	[StringValue] [nvarchar](max) NULL,
	[DateTimeValue] [datetime2](7) NULL,
	[GuidValue] [uniqueidentifier] NULL,
	[BoolValue] [bit] NULL,
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

/****** Object:  Table [dbo].[SortBys]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[Statuses]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[SubRegions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[TelecomTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UITermLanguageCustomizations]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UITermLanguageCustomizations](
	[UITermLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[UITermID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Customization] [nvarchar](max) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[MofidiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UITermLanguages] PRIMARY KEY CLUSTERED 
(
	[UITermLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[UITermLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UITerms]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserMenus]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserMenuTemplateLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserMenuTemplateOptionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserMenuTemplateOptions]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserMenuTemplates]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserMenuTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserPreferences]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserPreferenceTypeGroups]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[UserPreferenceTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[ValueUpdateTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
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

/****** Object:  Table [dbo].[VersionStatuses]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[VersionStatuses](
	[VersionStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_VersionStatuses] PRIMARY KEY CLUSTERED 
(
	[VersionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[VersionStatusLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[VersionStatusLanguages](
	[VersionStatusLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[VersionStatusId] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MouseOver] [nvarchar](50) NOT NULL,
	[CreatorID] [nvarchar](450) NOT NULL,
	[ModifierID] [nvarchar](450) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_VersionStatusLanguages] PRIMARY KEY CLUSTERED 
(
	[VersionStatusLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[VersionTypes]    Script Date: 2/9/2021 4:40:37 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[VersionTypes](
	[VersionTypeId] [int] NOT NULL,
	[NameTermID] [int] NOT NULL,
	[DescriptionTermID] [int] NOT NULL,
	[MenuNameTermID] [int] NOT NULL,
	[MouseOverTermID] [int] NOT NULL,
 CONSTRAINT [PK_VersionTypes] PRIMARY KEY CLUSTERED 
(
	[VersionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLanguages] ON [dbo].[ClassificationLanguages]
(
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationLevelLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLevelLanguages] ON [dbo].[ClassificationLevelLanguages]
(
	[ClassificationLevelID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationLevelLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationLevelLanguages_Name] ON [dbo].[ClassificationLevelLanguages]
(
	[ClassificationID] ASC,
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationLevels]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationLevels] ON [dbo].[ClassificationLevels]
(
	[ClassificationID] ASC,
	[Sequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationPageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationPageLanguages] ON [dbo].[ClassificationPageLanguages]
(
	[ClassificationPageID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationPageLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationPageLanguages_Name] ON [dbo].[ClassificationPageLanguages]
(
	[ClassificationID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationPageSectionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationPageSectionLanguages] ON [dbo].[ClassificationPageSectionLanguages]
(
	[ClassificationPageSectionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ClassificationPageSectionLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationPageSectionLanguages_Name] ON [dbo].[ClassificationPageSectionLanguages]
(
	[ClassificationPageID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationRelationTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClassificationRelationTypeLanguages] ON [dbo].[ClassificationRelationTypeLanguages]
(
	[ClassificationRelationTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ClassificationValueLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassificationValueLanguages] ON [dbo].[ClassificationValueLanguages]
(
	[ClassificationValueID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentTypeClassifications]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypeClassifications] ON [dbo].[ContentTypeClassifications]
(
	[ClassificationID] ASC,
	[ContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentTypeGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ContentTypeGroupLanguages] ON [dbo].[ContentTypeGroupLanguages]
(
	[ContentTypeGroupID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentTypeLanguages] ON [dbo].[ContentTypeLanguages]
(
	[ContentTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentUserEdit]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentUserEdit] ON [dbo].[ContentUserEdit]
(
	[ContentUserEditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ContentVersions]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ContentVersions] ON [dbo].[ContentVersions]
(
	[ContentVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_MVCUIScreenLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MVCUIScreenLanguages] ON [dbo].[MVCUIScreenLanguages]
(
	[MVCUIScreenID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_OrganizationLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationLanguages] ON [dbo].[OrganizationLanguages]
(
	[OrganizationID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_OrganizationLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationLanguages_Name] ON [dbo].[OrganizationLanguages]
(
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_OrganizationTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationTypeLanguages] ON [dbo].[OrganizationTypeLanguages]
(
	[OrganizationTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_OrganizationTypeLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrganizationTypeLanguages_Name] ON [dbo].[OrganizationTypeLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_PageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageLanguages] ON [dbo].[PageLanguages]
(
	[PageID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_PageLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageLanguages_Name] ON [dbo].[PageLanguages]
(
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_PageSectionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageSectionLanguages] ON [dbo].[PageSectionLanguages]
(
	[PageID] ASC,
	[PageSectionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_PageSectionLanguages_1]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PageSectionLanguages_1] ON [dbo].[PageSectionLanguages]
(
	[PageID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTypeFieldLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeFieldLanguages] ON [dbo].[ProcessTypeFieldLanguages]
(
	[ProcessTypeFieldID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTypeFieldLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeFieldLanguages_Name] ON [dbo].[ProcessTypeFieldLanguages]
(
	[ProcessTypeID] ASC,
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTypeFlowConditionLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeFlowConditionLanguages] ON [dbo].[ProcessTypeFlowConditionLanguages]
(
	[ProcessTypeFlowConditionID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTypeFlowConditionLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeFlowConditionLanguages_Name] ON [dbo].[ProcessTypeFlowConditionLanguages]
(
	[ProcessTypeFlowID] ASC,
	[MenuName] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTypeFlowLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeFlowLanguages] ON [dbo].[ProcessTypeFlowLanguages]
(
	[ProcessTypeFlowID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTypeFlowLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeFlowLanguages_Name] ON [dbo].[ProcessTypeFlowLanguages]
(
	[ProcessTypeID] ASC,
	[Name] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTypeGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeGroupLanguages] ON [dbo].[ProcessTypeGroupLanguages]
(
	[LanguageID] ASC,
	[MenuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTypeLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProcessTypeLanguages] ON [dbo].[ProcessTypeLanguages]
(
	[ProcessTypeID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTypeLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeLanguages_Name] ON [dbo].[ProcessTypeLanguages]
(
	[LanguageID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTypeStageFields]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeStageFields] ON [dbo].[ProcessTypeStageFields]
(
	[ProcessTypeFieldID] ASC,
	[ProcessTypeStageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_ProcessTypeStageLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeStageLanguages] ON [dbo].[ProcessTypeStageLanguages]
(
	[ProcessTypeStageID] ASC,
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ProcessTypeStageLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ProcessTypeStageLanguages_Name] ON [dbo].[ProcessTypeStageLanguages]
(
	[ProcessTypeID] ASC,
	[LanguageID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

/****** Object:  Index [IX_RoleGroupLanguages]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RoleGroupLanguages] ON [dbo].[RoleGroupLanguages]
(
	[LanguageID] ASC,
	[RoleGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_RoleGroupLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RoleGroupLanguages_Name] ON [dbo].[RoleGroupLanguages]
(
	[LanguageID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_RoleLanguages_Name]    Script Date: 2/9/2021 4:40:37 PM ******/
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

ALTER TABLE [dbo].[AddressTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeLanguages_AddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])

ALTER TABLE [dbo].[AddressTypeLanguages] CHECK CONSTRAINT [FK_AddressTypeLanguages_AddressTypes]

ALTER TABLE [dbo].[AddressTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[AddressTypeLanguages] CHECK CONSTRAINT [FK_AddressTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[AddressTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[AddressTypeLanguages] CHECK CONSTRAINT [FK_AddressTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[AddressTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[AddressTypeLanguages] CHECK CONSTRAINT [FK_AddressTypeLanguages_Languages]

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

ALTER TABLE [dbo].[AttachmentTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms4] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AttachmentTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms4]

ALTER TABLE [dbo].[AttachmentTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms5] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AttachmentTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms5]

ALTER TABLE [dbo].[AttachmentTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms6] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AttachmentTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms6]

ALTER TABLE [dbo].[AttachmentTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms7] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[AttachmentTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms7]

ALTER TABLE [dbo].[ChangeLogAddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogAddressTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogAddressTypes] CHECK CONSTRAINT [FK_ChangeLogAddressTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogAddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogAddressTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogAddressTypes] CHECK CONSTRAINT [FK_ChangeLogAddressTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogAddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogAddressTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogAddressTypes] CHECK CONSTRAINT [FK_ChangeLogAddressTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogAspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogAspNetUsers_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogAspNetUsers] CHECK CONSTRAINT [FK_ChangeLogAspNetUsers_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogAspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogAspNetUsers_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogAspNetUsers] CHECK CONSTRAINT [FK_ChangeLogAspNetUsers_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogAspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogAspNetUsers_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogAspNetUsers] CHECK CONSTRAINT [FK_ChangeLogAspNetUsers_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevelLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationLevelLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationLevelLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevelLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationLevelLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationLevelLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationLevelLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevelLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationLevelLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationLevelLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevelProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationLevelProperties] CHECK CONSTRAINT [FK_ChangeLogClassificationLevelProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevelProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationLevelProperties] CHECK CONSTRAINT [FK_ChangeLogClassificationLevelProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevelProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationLevelProperties] CHECK CONSTRAINT [FK_ChangeLogClassificationLevelProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevels_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationLevels] CHECK CONSTRAINT [FK_ChangeLogClassificationLevels_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevels_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationLevels] CHECK CONSTRAINT [FK_ChangeLogClassificationLevels_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationLevels_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationLevels] CHECK CONSTRAINT [FK_ChangeLogClassificationLevels_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRelationTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationRelationTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRelationTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationRelationTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRelationTypeLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationRelationTypeLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRelationTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypes] CHECK CONSTRAINT [FK_ChangeLogClassificationRelationTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRelationTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypes] CHECK CONSTRAINT [FK_ChangeLogClassificationRelationTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRelationTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationRelationTypes] CHECK CONSTRAINT [FK_ChangeLogClassificationRelationTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRoles_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationRoles] CHECK CONSTRAINT [FK_ChangeLogClassificationRoles_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRoles_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationRoles] CHECK CONSTRAINT [FK_ChangeLogClassificationRoles_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationRoles_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationRoles] CHECK CONSTRAINT [FK_ChangeLogClassificationRoles_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassifications_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassifications] CHECK CONSTRAINT [FK_ChangeLogClassifications_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassifications_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassifications] CHECK CONSTRAINT [FK_ChangeLogClassifications_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassifications_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassifications] CHECK CONSTRAINT [FK_ChangeLogClassifications_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationUsers_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationUsers] CHECK CONSTRAINT [FK_ChangeLogClassificationUsers_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationUsers_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationUsers] CHECK CONSTRAINT [FK_ChangeLogClassificationUsers_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationUsers_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationUsers] CHECK CONSTRAINT [FK_ChangeLogClassificationUsers_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationValueLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationValueLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationValueLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationValueLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationValueLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationValueLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationValueProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationValueProperties] CHECK CONSTRAINT [FK_ChangeLogClassificationValueProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationValueProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationValueProperties] CHECK CONSTRAINT [FK_ChangeLogClassificationValueProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationValueProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationValueProperties] CHECK CONSTRAINT [FK_ChangeLogClassificationValueProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationValuePropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValuePropertyLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationValuePropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationValuePropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationValuePropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValuePropertyLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationValuePropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationValuePropertyLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationValuePropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValuePropertyLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationValuePropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogClassificationValuePropertyLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationValueRoles]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueRoles_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationValueRoles] CHECK CONSTRAINT [FK_ChangeLogClassificationValueRoles_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationValueRoles]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueRoles_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationValueRoles] CHECK CONSTRAINT [FK_ChangeLogClassificationValueRoles_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationValueRoles]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueRoles_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationValueRoles] CHECK CONSTRAINT [FK_ChangeLogClassificationValueRoles_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValues_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationValues] CHECK CONSTRAINT [FK_ChangeLogClassificationValues_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValues_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationValues] CHECK CONSTRAINT [FK_ChangeLogClassificationValues_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValues_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationValues] CHECK CONSTRAINT [FK_ChangeLogClassificationValues_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogClassificationValueUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueUsers_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogClassificationValueUsers] CHECK CONSTRAINT [FK_ChangeLogClassificationValueUsers_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogClassificationValueUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueUsers_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogClassificationValueUsers] CHECK CONSTRAINT [FK_ChangeLogClassificationValueUsers_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogClassificationValueUsers]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogClassificationValueUsers_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogClassificationValueUsers] CHECK CONSTRAINT [FK_ChangeLogClassificationValueUsers_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentClassificationValues_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentClassificationValues] CHECK CONSTRAINT [FK_ChangeLogContentClassificationValues_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentClassificationValues_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentClassificationValues] CHECK CONSTRAINT [FK_ChangeLogContentClassificationValues_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentClassificationValues_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentClassificationValues] CHECK CONSTRAINT [FK_ChangeLogContentClassificationValues_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentProperties] CHECK CONSTRAINT [FK_ChangeLogContentProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentProperties] CHECK CONSTRAINT [FK_ChangeLogContentProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentProperties] CHECK CONSTRAINT [FK_ChangeLogContentProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentPropertyLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogContentPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentPropertyLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogContentPropertyLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentPropertyLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogContentPropertyLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContents]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContents_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContents] CHECK CONSTRAINT [FK_ChangeLogContents_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContents]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContents_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContents] CHECK CONSTRAINT [FK_ChangeLogContents_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContents]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContents_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContents] CHECK CONSTRAINT [FK_ChangeLogContents_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeClassifications_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentTypeClassifications] CHECK CONSTRAINT [FK_ChangeLogContentTypeClassifications_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeClassifications_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentTypeClassifications] CHECK CONSTRAINT [FK_ChangeLogContentTypeClassifications_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeClassifications_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentTypeClassifications] CHECK CONSTRAINT [FK_ChangeLogContentTypeClassifications_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeGroupLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogContentTypeGroupLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeGroupLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogContentTypeGroupLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeGroupLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentTypeGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogContentTypeGroupLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeGroups_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentTypeGroups] CHECK CONSTRAINT [FK_ChangeLogContentTypeGroups_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeGroups_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentTypeGroups] CHECK CONSTRAINT [FK_ChangeLogContentTypeGroups_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeGroups_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentTypeGroups] CHECK CONSTRAINT [FK_ChangeLogContentTypeGroups_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogContentTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogContentTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogContentTypeLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentTypeProperties] CHECK CONSTRAINT [FK_ChangeLogContentTypeProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentTypeProperties] CHECK CONSTRAINT [FK_ChangeLogContentTypeProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypeProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentTypeProperties] CHECK CONSTRAINT [FK_ChangeLogContentTypeProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentTypes] CHECK CONSTRAINT [FK_ChangeLogContentTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentTypes] CHECK CONSTRAINT [FK_ChangeLogContentTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentTypes] CHECK CONSTRAINT [FK_ChangeLogContentTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentUserEdit]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentUserEdit_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentUserEdit] CHECK CONSTRAINT [FK_ChangeLogContentUserEdit_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentUserEdit]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentUserEdit_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentUserEdit] CHECK CONSTRAINT [FK_ChangeLogContentUserEdit_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentUserEdit]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentUserEdit_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentUserEdit] CHECK CONSTRAINT [FK_ChangeLogContentUserEdit_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogContentUserRead]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentUserRead_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogContentUserRead] CHECK CONSTRAINT [FK_ChangeLogContentUserRead_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogContentUserRead]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentUserRead_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogContentUserRead] CHECK CONSTRAINT [FK_ChangeLogContentUserRead_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogContentUserRead]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogContentUserRead_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogContentUserRead] CHECK CONSTRAINT [FK_ChangeLogContentUserRead_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogGenders]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogGenders_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogGenders] CHECK CONSTRAINT [FK_ChangeLogGenders_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogGenders]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogGenders_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogGenders] CHECK CONSTRAINT [FK_ChangeLogGenders_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogGenders]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogGenders_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogGenders] CHECK CONSTRAINT [FK_ChangeLogGenders_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogLanguages] CHECK CONSTRAINT [FK_ChangeLogLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogLanguages] CHECK CONSTRAINT [FK_ChangeLogLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogLanguages] CHECK CONSTRAINT [FK_ChangeLogLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMenu1]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu1_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMenu1] CHECK CONSTRAINT [FK_ChangeLogMenu1_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMenu1]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu1_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMenu1] CHECK CONSTRAINT [FK_ChangeLogMenu1_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMenu1]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu1_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMenu1] CHECK CONSTRAINT [FK_ChangeLogMenu1_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMenu1Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu1Languages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMenu1Languages] CHECK CONSTRAINT [FK_ChangeLogMenu1Languages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMenu1Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu1Languages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMenu1Languages] CHECK CONSTRAINT [FK_ChangeLogMenu1Languages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMenu1Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu1Languages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMenu1Languages] CHECK CONSTRAINT [FK_ChangeLogMenu1Languages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMenu2]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu2_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMenu2] CHECK CONSTRAINT [FK_ChangeLogMenu2_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMenu2]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu2_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMenu2] CHECK CONSTRAINT [FK_ChangeLogMenu2_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMenu2]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu2_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMenu2] CHECK CONSTRAINT [FK_ChangeLogMenu2_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMenu2Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu2Languages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMenu2Languages] CHECK CONSTRAINT [FK_ChangeLogMenu2Languages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMenu2Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu2Languages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMenu2Languages] CHECK CONSTRAINT [FK_ChangeLogMenu2Languages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMenu2Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu2Languages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMenu2Languages] CHECK CONSTRAINT [FK_ChangeLogMenu2Languages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMenu3]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu3_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMenu3] CHECK CONSTRAINT [FK_ChangeLogMenu3_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMenu3]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu3_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMenu3] CHECK CONSTRAINT [FK_ChangeLogMenu3_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMenu3]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu3_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMenu3] CHECK CONSTRAINT [FK_ChangeLogMenu3_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMenu3Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu3Languages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMenu3Languages] CHECK CONSTRAINT [FK_ChangeLogMenu3Languages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMenu3Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu3Languages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMenu3Languages] CHECK CONSTRAINT [FK_ChangeLogMenu3Languages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMenu3Languages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMenu3Languages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMenu3Languages] CHECK CONSTRAINT [FK_ChangeLogMenu3Languages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMetaContents]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMetaContents_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMetaContents] CHECK CONSTRAINT [FK_ChangeLogMetaContents_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMetaContents]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMetaContents_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMetaContents] CHECK CONSTRAINT [FK_ChangeLogMetaContents_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMVCFavoriteGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMVCFavoriteGroups_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMVCFavoriteGroups] CHECK CONSTRAINT [FK_ChangeLogMVCFavoriteGroups_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMVCFavoriteGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMVCFavoriteGroups_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMVCFavoriteGroups] CHECK CONSTRAINT [FK_ChangeLogMVCFavoriteGroups_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMVCFavoriteGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMVCFavoriteGroups_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMVCFavoriteGroups] CHECK CONSTRAINT [FK_ChangeLogMVCFavoriteGroups_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogMVCFavorites]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMVCFavorites_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogMVCFavorites] CHECK CONSTRAINT [FK_ChangeLogMVCFavorites_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogMVCFavorites]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMVCFavorites_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogMVCFavorites] CHECK CONSTRAINT [FK_ChangeLogMVCFavorites_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogMVCFavorites]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogMVCFavorites_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogMVCFavorites] CHECK CONSTRAINT [FK_ChangeLogMVCFavorites_DataDictionaryColumns]


ALTER TABLE [dbo].[ChangeLogPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageLanguages] CHECK CONSTRAINT [FK_ChangeLogPageLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageLanguages] CHECK CONSTRAINT [FK_ChangeLogPageLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageLanguages] CHECK CONSTRAINT [FK_ChangeLogPageLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPages] CHECK CONSTRAINT [FK_ChangeLogPages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPages] CHECK CONSTRAINT [FK_ChangeLogPages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPages] CHECK CONSTRAINT [FK_ChangeLogPages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionClassificationValueConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionClassificationValueConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionContentConditionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionContentConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionContentConditionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionContentConditionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionContentConditionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionContentConditionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionContentConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionContentConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionContentConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionContentConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionContentConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionContentConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionContentConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionOrganizationConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionOrganizationConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionPersonConditionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionPersonConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionPersonConditionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionPersonConditionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionPersonConditionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionPersonConditionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionPersonConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionPersonConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionPersonConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionPersonConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionPersonConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionPersonConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionPersonConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionProcessConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProcessConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionProcessConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionProcessConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionProcessConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProcessConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionProcessConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionProcessConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionProcessConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProcessConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionProcessConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionProcessConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProjectConditionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionProjectConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProjectConditionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionProjectConditionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProjectConditionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogPageSectionProjectConditionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProjectConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionProjectConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProjectConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionProjectConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSectionProjectConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSectionProjectConditions] CHECK CONSTRAINT [FK_ChangeLogPageSectionProjectConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSections_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPageSections] CHECK CONSTRAINT [FK_ChangeLogPageSections_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSections_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPageSections] CHECK CONSTRAINT [FK_ChangeLogPageSections_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPageSections]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPageSections_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPageSections] CHECK CONSTRAINT [FK_ChangeLogPageSections_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonAddresses_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonAddresses] CHECK CONSTRAINT [FK_ChangeLogPersonAddresses_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonAddresses_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonAddresses] CHECK CONSTRAINT [FK_ChangeLogPersonAddresses_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonAddresses_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonAddresses] CHECK CONSTRAINT [FK_ChangeLogPersonAddresses_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonProperties] CHECK CONSTRAINT [FK_ChangeLogPersonProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonProperties] CHECK CONSTRAINT [FK_ChangeLogPersonProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonProperties] CHECK CONSTRAINT [FK_ChangeLogPersonProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonPropertyLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonPropertyLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonPropertyLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonPropertyLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonPropertyLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonRelations]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelations_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonRelations] CHECK CONSTRAINT [FK_ChangeLogPersonRelations_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonRelations]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelations_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonRelations] CHECK CONSTRAINT [FK_ChangeLogPersonRelations_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonRelations]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelations_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonRelations] CHECK CONSTRAINT [FK_ChangeLogPersonRelations_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelationTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonRelationTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonRelationTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelationTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonRelationTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonRelationTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonRelationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelationTypeLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonRelationTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonRelationTypeLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelationTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonRelationTypes] CHECK CONSTRAINT [FK_ChangeLogPersonRelationTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelationTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonRelationTypes] CHECK CONSTRAINT [FK_ChangeLogPersonRelationTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonRelationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonRelationTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonRelationTypes] CHECK CONSTRAINT [FK_ChangeLogPersonRelationTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersons]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersons_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersons] CHECK CONSTRAINT [FK_ChangeLogPersons_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersons]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersons_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersons] CHECK CONSTRAINT [FK_ChangeLogPersons_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersons]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersons_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersons] CHECK CONSTRAINT [FK_ChangeLogPersons_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTelecoms_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonTelecoms] CHECK CONSTRAINT [FK_ChangeLogPersonTelecoms_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTelecoms_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonTelecoms] CHECK CONSTRAINT [FK_ChangeLogPersonTelecoms_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTelecoms_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonTelecoms] CHECK CONSTRAINT [FK_ChangeLogPersonTelecoms_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypeLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogPersonTypeLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypeProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonTypeProperties] CHECK CONSTRAINT [FK_ChangeLogPersonTypeProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypeProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonTypeProperties] CHECK CONSTRAINT [FK_ChangeLogPersonTypeProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypeProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonTypeProperties] CHECK CONSTRAINT [FK_ChangeLogPersonTypeProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPersonTypes] CHECK CONSTRAINT [FK_ChangeLogPersonTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPersonTypes] CHECK CONSTRAINT [FK_ChangeLogPersonTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPersonTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPersonTypes] CHECK CONSTRAINT [FK_ChangeLogPersonTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPositionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPositionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPositionLanguages] CHECK CONSTRAINT [FK_ChangeLogPositionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPositionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPositionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPositionLanguages] CHECK CONSTRAINT [FK_ChangeLogPositionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPositionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPositionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPositionLanguages] CHECK CONSTRAINT [FK_ChangeLogPositionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPositions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPositions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPositions] CHECK CONSTRAINT [FK_ChangeLogPositions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPositions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPositions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPositions] CHECK CONSTRAINT [FK_ChangeLogPositions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPositions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPositions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPositions] CHECK CONSTRAINT [FK_ChangeLogPositions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcesses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcesses_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcesses] CHECK CONSTRAINT [FK_ChangeLogProcesses_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcesses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcesses_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcesses] CHECK CONSTRAINT [FK_ChangeLogProcesses_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcesses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcesses_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcesses] CHECK CONSTRAINT [FK_ChangeLogProcesses_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessFields_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessFields] CHECK CONSTRAINT [FK_ChangeLogProcessFields_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessFields_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessFields] CHECK CONSTRAINT [FK_ChangeLogProcessFields_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessFields_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessFields] CHECK CONSTRAINT [FK_ChangeLogProcessFields_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessMultis_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessMultis] CHECK CONSTRAINT [FK_ChangeLogProcessMultis_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessMultis_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessMultis] CHECK CONSTRAINT [FK_ChangeLogProcessMultis_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessMultis]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessMultis_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessMultis] CHECK CONSTRAINT [FK_ChangeLogProcessMultis_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldConditionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldConditionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldConditionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldConditionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldConditionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditions] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditions] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldConditions] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFieldLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFieldLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFieldLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFields_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFields] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFields_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFields_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFields] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFields_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFields_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFields] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFields_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowConditionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowConditionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowConditionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowConditionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditionLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowConditionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowConditions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditions] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowConditions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowConditions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditions] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowConditions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowConditions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowConditions] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowConditions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowPasses_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPasses] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowPasses_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowPasses_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPasses] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowPasses_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowPasses_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPasses] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowPasses_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPassLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowPassLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPassLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowPassLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPassLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowPassLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPassLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowPassLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPassLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlowPassLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlowPassLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlowPassLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlows_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlows] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlows_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlows_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlows] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlows_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeFlows_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeFlows] CHECK CONSTRAINT [FK_ChangeLogProcessTypeFlows_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeGroupLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeGroupLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeGroupLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeGroupLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeGroupLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeGroupLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeGroups_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeGroups] CHECK CONSTRAINT [FK_ChangeLogProcessTypeGroups_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeGroups_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeGroups] CHECK CONSTRAINT [FK_ChangeLogProcessTypeGroups_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeGroups_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeGroups] CHECK CONSTRAINT [FK_ChangeLogProcessTypeGroups_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypes] CHECK CONSTRAINT [FK_ChangeLogProcessTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypes] CHECK CONSTRAINT [FK_ChangeLogProcessTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypes] CHECK CONSTRAINT [FK_ChangeLogProcessTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageFields_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageFields] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageFields_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageFields_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageFields] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageFields_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageFields_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageFields] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageFields_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeStages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeStages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeStages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeStages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeStages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeStages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageTypeLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageTypeLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypes] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypes] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProcessTypeStageTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProcessTypeStageTypes] CHECK CONSTRAINT [FK_ChangeLogProcessTypeStageTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProjectLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectMatrixes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectMatrixes] CHECK CONSTRAINT [FK_ChangeLogProjectMatrixes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectMatrixes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectMatrixes] CHECK CONSTRAINT [FK_ChangeLogProjectMatrixes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectMatrixTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectMatrixTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectMatrixTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectMatrixTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectMatrixTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypes] CHECK CONSTRAINT [FK_ChangeLogProjectMatrixTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectMatrixTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectMatrixTypes] CHECK CONSTRAINT [FK_ChangeLogProjectMatrixTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectProperties] CHECK CONSTRAINT [FK_ChangeLogProjectProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectProperties] CHECK CONSTRAINT [FK_ChangeLogProjectProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProjectProperties] CHECK CONSTRAINT [FK_ChangeLogProjectProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProjectPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectPropertyLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectPropertyLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectPropertyLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectPropertyLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProjectPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectPropertyLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProjects]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjects_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjects] CHECK CONSTRAINT [FK_ChangeLogProjects_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjects]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjects_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjects] CHECK CONSTRAINT [FK_ChangeLogProjects_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjects]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjects_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProjects] CHECK CONSTRAINT [FK_ChangeLogProjects_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypes] CHECK CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypeChildProjectTypes] CHECK CONSTRAINT [FK_ChangeLogProjectTypeChildProjectTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeClassifications_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypeClassifications] CHECK CONSTRAINT [FK_ChangeLogProjectTypeClassifications_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeClassifications_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypeClassifications] CHECK CONSTRAINT [FK_ChangeLogProjectTypeClassifications_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectTypeLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProjectTypeLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectTypeLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeMatrixes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixes] CHECK CONSTRAINT [FK_ChangeLogProjectTypeMatrixes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeMatrixes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixes] CHECK CONSTRAINT [FK_ChangeLogProjectTypeMatrixes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeMatrixLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectTypeMatrixLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeMatrixLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypeMatrixLanguages] CHECK CONSTRAINT [FK_ChangeLogProjectTypeMatrixLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypeProperties] CHECK CONSTRAINT [FK_ChangeLogProjectTypeProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypeProperties] CHECK CONSTRAINT [FK_ChangeLogProjectTypeProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypeProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProjectTypeProperties] CHECK CONSTRAINT [FK_ChangeLogProjectTypeProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProjectTypes] CHECK CONSTRAINT [FK_ChangeLogProjectTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProjectTypes] CHECK CONSTRAINT [FK_ChangeLogProjectTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProjectTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProjectTypes] CHECK CONSTRAINT [FK_ChangeLogProjectTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProperties_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogProperties] CHECK CONSTRAINT [FK_ChangeLogProperties_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProperties_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogProperties] CHECK CONSTRAINT [FK_ChangeLogProperties_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogProperties]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogProperties_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogProperties] CHECK CONSTRAINT [FK_ChangeLogProperties_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogPropertyLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPropertyLanguages] CHECK CONSTRAINT [FK_ChangeLogPropertyLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyValueLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPropertyValueLanguages] CHECK CONSTRAINT [FK_ChangeLogPropertyValueLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyValueLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPropertyValueLanguages] CHECK CONSTRAINT [FK_ChangeLogPropertyValueLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyValueLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPropertyValueLanguages] CHECK CONSTRAINT [FK_ChangeLogPropertyValueLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyValues_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogPropertyValues] CHECK CONSTRAINT [FK_ChangeLogPropertyValues_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyValues_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogPropertyValues] CHECK CONSTRAINT [FK_ChangeLogPropertyValues_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogPropertyValues_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogPropertyValues] CHECK CONSTRAINT [FK_ChangeLogPropertyValues_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogRoleGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleGroupLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogRoleGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogRoleGroupLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogRoleGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleGroupLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogRoleGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogRoleGroupLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogRoleGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleGroupLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogRoleGroupLanguages] CHECK CONSTRAINT [FK_ChangeLogRoleGroupLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleGroups_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogRoleGroups] CHECK CONSTRAINT [FK_ChangeLogRoleGroups_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleGroups_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogRoleGroups] CHECK CONSTRAINT [FK_ChangeLogRoleGroups_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleGroups_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogRoleGroups] CHECK CONSTRAINT [FK_ChangeLogRoleGroups_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogRoleLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogRoleLanguages] CHECK CONSTRAINT [FK_ChangeLogRoleLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogRoleLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogRoleLanguages] CHECK CONSTRAINT [FK_ChangeLogRoleLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogRoleLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogRoleLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogRoleLanguages] CHECK CONSTRAINT [FK_ChangeLogRoleLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogSettings]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogSettings_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogSettings] CHECK CONSTRAINT [FK_ChangeLogSettings_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogSettings]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogSettings_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogSettings] CHECK CONSTRAINT [FK_ChangeLogSettings_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogSettings]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogSettings_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogSettings] CHECK CONSTRAINT [FK_ChangeLogSettings_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogTelecomTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogTelecomTypes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogTelecomTypes] CHECK CONSTRAINT [FK_ChangeLogTelecomTypes_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogTelecomTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogTelecomTypes_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogTelecomTypes] CHECK CONSTRAINT [FK_ChangeLogTelecomTypes_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogTelecomTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogTelecomTypes_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogTelecomTypes] CHECK CONSTRAINT [FK_ChangeLogTelecomTypes_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogUserMenus]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenus_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogUserMenus] CHECK CONSTRAINT [FK_ChangeLogUserMenus_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogUserMenus]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenus_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogUserMenus] CHECK CONSTRAINT [FK_ChangeLogUserMenus_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogUserMenus]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenus_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogUserMenus] CHECK CONSTRAINT [FK_ChangeLogUserMenus_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateLanguages] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateLanguages] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateLanguages] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateOptionLanguages_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptionLanguages] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateOptionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateOptionLanguages_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptionLanguages] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateOptionLanguages_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateOptionLanguages_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptionLanguages] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateOptionLanguages_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateOptions_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptions] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateOptions_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateOptions_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptions] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateOptions_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptions]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplateOptions_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplateOptions] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplateOptions_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplates_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplates] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplates_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplates_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplates] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplates_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogUserMenuTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserMenuTemplates_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogUserMenuTemplates] CHECK CONSTRAINT [FK_ChangeLogUserMenuTemplates_DataDictionaryColumns]

ALTER TABLE [dbo].[ChangeLogUserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserPreferences_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ChangeLogUserPreferences] CHECK CONSTRAINT [FK_ChangeLogUserPreferences_AspNetUsers]

ALTER TABLE [dbo].[ChangeLogUserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserPreferences_ChangeTypes] FOREIGN KEY([ChangeTypeId])
REFERENCES [dbo].[ChangeTypes] ([ChangeTypeID])

ALTER TABLE [dbo].[ChangeLogUserPreferences] CHECK CONSTRAINT [FK_ChangeLogUserPreferences_ChangeTypes]

ALTER TABLE [dbo].[ChangeLogUserPreferences]  WITH CHECK ADD  CONSTRAINT [FK_ChangeLogUserPreferences_DataDictionaryColumns] FOREIGN KEY([ColumnId])
REFERENCES [dbo].[DataDictionaryColumns] ([ColumnId])

ALTER TABLE [dbo].[ChangeLogUserPreferences] CHECK CONSTRAINT [FK_ChangeLogUserPreferences_DataDictionaryColumns]



ALTER TABLE [dbo].[ChangeTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ChangeTypes] CHECK CONSTRAINT [FK_ChangeTypes_UITerms]

ALTER TABLE [dbo].[ChangeTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ChangeTypes] CHECK CONSTRAINT [FK_ChangeTypes_UITerms1]

ALTER TABLE [dbo].[ChangeTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ChangeTypes] CHECK CONSTRAINT [FK_ChangeTypes_UITerms2]

ALTER TABLE [dbo].[ChangeTypes]  WITH CHECK ADD  CONSTRAINT [FK_ChangeTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ChangeTypes] CHECK CONSTRAINT [FK_ChangeTypes_UITerms3]

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

ALTER TABLE [dbo].[ClassificationContents]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationContents_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationContents] CHECK CONSTRAINT [FK_ClassificationContents_AspNetUsers]

ALTER TABLE [dbo].[ClassificationContents]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationContents_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationContents] CHECK CONSTRAINT [FK_ClassificationContents_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationContents]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationContents_ExplanationTypes] FOREIGN KEY([ExplanationTypeId])
REFERENCES [dbo].[ExplanationTypes] ([ExplanationTypeID])

ALTER TABLE [dbo].[ClassificationContents] CHECK CONSTRAINT [FK_ClassificationContents_ExplanationTypes]

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

ALTER TABLE [dbo].[ClassificationLevelContents]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelContents_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelContents] CHECK CONSTRAINT [FK_ClassificationLevelContents_AspNetUsers]

ALTER TABLE [dbo].[ClassificationLevelContents]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelContents_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ClassificationLevelContents] CHECK CONSTRAINT [FK_ClassificationLevelContents_AspNetUsers1]

ALTER TABLE [dbo].[ClassificationLevelContents]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelContents_ExplanationTypes] FOREIGN KEY([ExplanationTypeId])
REFERENCES [dbo].[ExplanationTypes] ([ExplanationTypeID])

ALTER TABLE [dbo].[ClassificationLevelContents] CHECK CONSTRAINT [FK_ClassificationLevelContents_ExplanationTypes]

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

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_ClassificationLevels] FOREIGN KEY([ClassificationLevelID], [ClassificationID])
REFERENCES [dbo].[ClassificationLevels] ([ClassificationLevelID], [ClassificationID])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_ClassificationLevels]

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_Properties]

ALTER TABLE [dbo].[ClassificationLevelProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevelProperties_PropertyStatuses] FOREIGN KEY([PropertyStatusId])
REFERENCES [dbo].[ObjectTypePropertyStatuses] ([ObjectTypePropertyStatusID])

ALTER TABLE [dbo].[ClassificationLevelProperties] CHECK CONSTRAINT [FK_ClassificationLevelProperties_PropertyStatuses]

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

ALTER TABLE [dbo].[ClassificationLevels]  WITH CHECK ADD  CONSTRAINT [FK_ClassificationLevels_CodeTypes] FOREIGN KEY([CodeTypeId])
REFERENCES [dbo].[CodeTypes] ([CodeTypeID])

ALTER TABLE [dbo].[ClassificationLevels] CHECK CONSTRAINT [FK_ClassificationLevels_CodeTypes]

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

ALTER TABLE [dbo].[CodeTypes]  WITH CHECK ADD  CONSTRAINT [FK_CodeTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[CodeTypes] CHECK CONSTRAINT [FK_CodeTypesDescription_UITerms]

ALTER TABLE [dbo].[CodeTypes]  WITH CHECK ADD  CONSTRAINT [FK_CodeTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[CodeTypes] CHECK CONSTRAINT [FK_CodeTypesMenuName_UITerms]

ALTER TABLE [dbo].[CodeTypes]  WITH CHECK ADD  CONSTRAINT [FK_CodeTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[CodeTypes] CHECK CONSTRAINT [FK_CodeTypesMouseOver_UITerms]

ALTER TABLE [dbo].[CodeTypes]  WITH CHECK ADD  CONSTRAINT [FK_CodeTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[CodeTypes] CHECK CONSTRAINT [FK_CodeTypesName_UITerms]

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

ALTER TABLE [dbo].[ContentPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentPropertyLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentPropertyLanguages] CHECK CONSTRAINT [FK_ContentPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ContentPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentPropertyLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentPropertyLanguages] CHECK CONSTRAINT [FK_ContentPropertyLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ContentPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentPropertyLanguages_ContentProperties] FOREIGN KEY([ContentPropertyID], [ContentID], [PropertyID])
REFERENCES [dbo].[ContentPropertyValues] ([ContentPropertyValueID], [ContentID], [PropertyID])

ALTER TABLE [dbo].[ContentPropertyLanguages] CHECK CONSTRAINT [FK_ContentPropertyLanguages_ContentProperties]

ALTER TABLE [dbo].[ContentPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ContentPropertyLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ContentPropertyLanguages] CHECK CONSTRAINT [FK_ContentPropertyLanguages_Languages]

ALTER TABLE [dbo].[ContentPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_ContentProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentPropertyValues] CHECK CONSTRAINT [FK_ContentProperties_AspNetUsers]

ALTER TABLE [dbo].[ContentPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_ContentProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentPropertyValues] CHECK CONSTRAINT [FK_ContentProperties_AspNetUsers1]

ALTER TABLE [dbo].[ContentPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_ContentProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[ContentPropertyValues] CHECK CONSTRAINT [FK_ContentProperties_Properties]

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

ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Contents_Processes] FOREIGN KEY([ProcessID], [ProcessTypeId])
REFERENCES [dbo].[Processes] ([ProcessID], [ProcessTypeID])

ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Contents_Processes]

ALTER TABLE [dbo].[ContentTypeAttachedFileTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeAttachedFileTypes_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeAttachedFileTypes] CHECK CONSTRAINT [FK_ContentTypeAttachedFileTypes_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeAttachedFileTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeAttachedFileTypes_ContentTypes] FOREIGN KEY([ContentTypeId])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeAttachedFileTypes] CHECK CONSTRAINT [FK_ContentTypeAttachedFileTypes_ContentTypes]

ALTER TABLE [dbo].[ContentTypeAttachedFileTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeAttachedFileTypes_FileTypes] FOREIGN KEY([FileTypeId])
REFERENCES [dbo].[FileTypes] ([FileTypeId])

ALTER TABLE [dbo].[ContentTypeAttachedFileTypes] CHECK CONSTRAINT [FK_ContentTypeAttachedFileTypes_FileTypes]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_Classifications]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_ContentTypeClassificationStatuses] FOREIGN KEY([ObjectTypeClassificationStatusID])
REFERENCES [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_ContentTypeClassificationStatuses]

ALTER TABLE [dbo].[ContentTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeClassifications_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeClassifications] CHECK CONSTRAINT [FK_ContentTypeClassifications_ContentTypes]

ALTER TABLE [dbo].[ContentTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeContents_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeContents] CHECK CONSTRAINT [FK_ContentTypeContents_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeContents_AspNetUsers1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeContents] CHECK CONSTRAINT [FK_ContentTypeContents_AspNetUsers1]

ALTER TABLE [dbo].[ContentTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeContents_ExplanationTypes] FOREIGN KEY([ExplanationTypeId])
REFERENCES [dbo].[ExplanationTypes] ([ExplanationTypeID])

ALTER TABLE [dbo].[ContentTypeContents] CHECK CONSTRAINT [FK_ContentTypeContents_ExplanationTypes]

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

ALTER TABLE [dbo].[ContentTypeOrganizationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeOrganizationRoles_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])

ALTER TABLE [dbo].[ContentTypeOrganizationRoles] CHECK CONSTRAINT [FK_ContentTypeOrganizationRoles_AspNetRoles]

ALTER TABLE [dbo].[ContentTypeOrganizationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeOrganizationRoles_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeOrganizationRoles] CHECK CONSTRAINT [FK_ContentTypeOrganizationRoles_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeOrganizationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeOrganizationRoles_ContentTypes] FOREIGN KEY([ContentTypeId])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeOrganizationRoles] CHECK CONSTRAINT [FK_ContentTypeOrganizationRoles_ContentTypes]

ALTER TABLE [dbo].[ContentTypeOrganizationRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeOrganizationRoles_RightTypes] FOREIGN KEY([RightTypeId])
REFERENCES [dbo].[RightTypes] ([RightTypeID])

ALTER TABLE [dbo].[ContentTypeOrganizationRoles] CHECK CONSTRAINT [FK_ContentTypeOrganizationRoles_RightTypes]

ALTER TABLE [dbo].[ContentTypeProjectRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProjectRoles_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])

ALTER TABLE [dbo].[ContentTypeProjectRoles] CHECK CONSTRAINT [FK_ContentTypeProjectRoles_AspNetRoles]

ALTER TABLE [dbo].[ContentTypeProjectRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProjectRoles_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeProjectRoles] CHECK CONSTRAINT [FK_ContentTypeProjectRoles_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeProjectRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProjectRoles_ContentTypes] FOREIGN KEY([ContentTypeId])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeProjectRoles] CHECK CONSTRAINT [FK_ContentTypeProjectRoles_ContentTypes]

ALTER TABLE [dbo].[ContentTypeProjectRoles]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProjectRoles_RightTypes] FOREIGN KEY([RightTypeId])
REFERENCES [dbo].[RightTypes] ([RightTypeID])

ALTER TABLE [dbo].[ContentTypeProjectRoles] CHECK CONSTRAINT [FK_ContentTypeProjectRoles_RightTypes]

ALTER TABLE [dbo].[ContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeProperties] CHECK CONSTRAINT [FK_ContentTypeProperties_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeProperties] CHECK CONSTRAINT [FK_ContentTypeProperties_AspNetUsers1]

ALTER TABLE [dbo].[ContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProperties_ContentTypes] FOREIGN KEY([ContentTypeID])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeProperties] CHECK CONSTRAINT [FK_ContentTypeProperties_ContentTypes]

ALTER TABLE [dbo].[ContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[ContentTypeProperties] CHECK CONSTRAINT [FK_ContentTypeProperties_Properties]

ALTER TABLE [dbo].[ContentTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeProperties_PropertyStatuses] FOREIGN KEY([ObjectTypePropertyStatusId])
REFERENCES [dbo].[ObjectTypePropertyStatuses] ([ObjectTypePropertyStatusID])

ALTER TABLE [dbo].[ContentTypeProperties] CHECK CONSTRAINT [FK_ContentTypeProperties_PropertyStatuses]

ALTER TABLE [dbo].[ContentTypeRelations]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeRelations_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypeRelations] CHECK CONSTRAINT [FK_ContentTypeRelations_AspNetUsers]

ALTER TABLE [dbo].[ContentTypeRelations]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeRelations_ContentTypes] FOREIGN KEY([ContentTypeId])
REFERENCES [dbo].[ContentTypes] ([ContentTypeID])

ALTER TABLE [dbo].[ContentTypeRelations] CHECK CONSTRAINT [FK_ContentTypeRelations_ContentTypes]

ALTER TABLE [dbo].[ContentTypeRelations]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeRelations_PersonRelationTypes] FOREIGN KEY([PersonRelationTypeID])
REFERENCES [dbo].[PersonRelationTypes] ([PersonRelationTypeID])

ALTER TABLE [dbo].[ContentTypeRelations] CHECK CONSTRAINT [FK_ContentTypeRelations_PersonRelationTypes]

ALTER TABLE [dbo].[ContentTypeRelations]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypeRelations_RightTypes] FOREIGN KEY([RightTypeId])
REFERENCES [dbo].[RightTypes] ([RightTypeID])

ALTER TABLE [dbo].[ContentTypeRelations] CHECK CONSTRAINT [FK_ContentTypeRelations_RightTypes]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_AspNetUsers]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_AspNetUsers1]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_AttachmentTypes] FOREIGN KEY([AttachmentTypeId])
REFERENCES [dbo].[AttachmentTypes] ([AttachmentTypeId])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_AttachmentTypes]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_CodeTypes] FOREIGN KEY([CodeTypeId])
REFERENCES [dbo].[CodeTypes] ([CodeTypeID])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_CodeTypes]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_ContentTypeGroups] FOREIGN KEY([ContentTypeGroupID])
REFERENCES [dbo].[ContentTypeGroups] ([ContentTypeGroupID])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_ContentTypeGroups]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_Icons]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_ObjectTypeStatuses] FOREIGN KEY([ObjectTypeStatusId])
REFERENCES [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_ObjectTypeStatuses]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_ProcessTypes] FOREIGN KEY([ContentProcessTypeID])
REFERENCES [dbo].[ProcessTypes] ([ProcessTypeID])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_ProcessTypes]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_ProcessTypes1] FOREIGN KEY([ContentVersionProcessTypeId])
REFERENCES [dbo].[ProcessTypes] ([ProcessTypeID])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_ProcessTypes1]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_VersionTypes] FOREIGN KEY([VersionTypeId])
REFERENCES [dbo].[VersionTypes] ([VersionTypeId])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_VersionTypes]

ALTER TABLE [dbo].[ContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_ContentTypes_VersionTypes1] FOREIGN KEY([AttachmentVersionTypeId])
REFERENCES [dbo].[VersionTypes] ([VersionTypeId])

ALTER TABLE [dbo].[ContentTypes] CHECK CONSTRAINT [FK_ContentTypes_VersionTypes1]

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

ALTER TABLE [dbo].[ContentVersionAttachments]  WITH CHECK ADD  CONSTRAINT [FK_ContentAttachments_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentVersionAttachments] CHECK CONSTRAINT [FK_ContentAttachments_AspNetUsers]

ALTER TABLE [dbo].[ContentVersionAttachments]  WITH CHECK ADD  CONSTRAINT [FK_ContentAttachments_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentVersionAttachments] CHECK CONSTRAINT [FK_ContentAttachments_AspNetUsers1]

ALTER TABLE [dbo].[ContentVersionAttachments]  WITH CHECK ADD  CONSTRAINT [FK_ContentAttachments_AttachmentTypes] FOREIGN KEY([FileTypeId])
REFERENCES [dbo].[FileTypes] ([FileTypeId])

ALTER TABLE [dbo].[ContentVersionAttachments] CHECK CONSTRAINT [FK_ContentAttachments_AttachmentTypes]

ALTER TABLE [dbo].[ContentVersionAttachments]  WITH CHECK ADD  CONSTRAINT [FK_ContentVersionAttachments_ContentVersions] FOREIGN KEY([ContentVersionId], [ContentId])
REFERENCES [dbo].[ContentVersions] ([ContentVersionId], [ContentId])

ALTER TABLE [dbo].[ContentVersionAttachments] CHECK CONSTRAINT [FK_ContentVersionAttachments_ContentVersions]

ALTER TABLE [dbo].[ContentVersionAttachmentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentAttachmentVersions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentVersionAttachmentVersions] CHECK CONSTRAINT [FK_ContentAttachmentVersions_AspNetUsers]

ALTER TABLE [dbo].[ContentVersionAttachmentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentAttachmentVersions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentVersionAttachmentVersions] CHECK CONSTRAINT [FK_ContentAttachmentVersions_AspNetUsers1]

ALTER TABLE [dbo].[ContentVersionAttachmentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentAttachmentVersions_VersionStatuses] FOREIGN KEY([VersionStatusId])
REFERENCES [dbo].[VersionStatuses] ([VersionStatusId])

ALTER TABLE [dbo].[ContentVersionAttachmentVersions] CHECK CONSTRAINT [FK_ContentAttachmentVersions_VersionStatuses]

ALTER TABLE [dbo].[ContentVersionAttachmentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentVersionAttachmentVersions_ContentVersionAttachments] FOREIGN KEY([ContentVersionAttachmentId], [ContentVersionId], [ContentId])
REFERENCES [dbo].[ContentVersionAttachments] ([ContentVersionAttachmentId], [ContentVersionId], [ContentId])

ALTER TABLE [dbo].[ContentVersionAttachmentVersions] CHECK CONSTRAINT [FK_ContentVersionAttachmentVersions_ContentVersionAttachments]

ALTER TABLE [dbo].[ContentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentVersions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentVersions] CHECK CONSTRAINT [FK_ContentVersions_AspNetUsers]

ALTER TABLE [dbo].[ContentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentVersions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ContentVersions] CHECK CONSTRAINT [FK_ContentVersions_AspNetUsers1]

ALTER TABLE [dbo].[ContentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentVersions_Contents] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Contents] ([ContentID])

ALTER TABLE [dbo].[ContentVersions] CHECK CONSTRAINT [FK_ContentVersions_Contents]

ALTER TABLE [dbo].[ContentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentVersions_Processes] FOREIGN KEY([ProcessID], [ProcessTypeId])
REFERENCES [dbo].[Processes] ([ProcessID], [ProcessTypeID])

ALTER TABLE [dbo].[ContentVersions] CHECK CONSTRAINT [FK_ContentVersions_Processes]

ALTER TABLE [dbo].[ContentVersions]  WITH CHECK ADD  CONSTRAINT [FK_ContentVersions_VersionStatuses] FOREIGN KEY([VersionStatusId])
REFERENCES [dbo].[VersionStatuses] ([VersionStatusId])

ALTER TABLE [dbo].[ContentVersions] CHECK CONSTRAINT [FK_ContentVersions_VersionStatuses]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_IntermediateRegions] FOREIGN KEY([IntermediateRegionID])
REFERENCES [dbo].[IntermediateRegions] ([IntermediateRegionID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_IntermediateRegions]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_SubRegions] FOREIGN KEY([SubRegionID])
REFERENCES [dbo].[SubRegions] ([SubRegionID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_SubRegions]

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_CountriesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_CountriesName_UITerms]

ALTER TABLE [dbo].[DataDictionaryColumns]  WITH CHECK ADD  CONSTRAINT [FK_DataDictionaryColumns_DataDictionaryColumnTypes] FOREIGN KEY([ColumnTypeId])
REFERENCES [dbo].[DataDictionaryColumnTypes] ([ColumnTypeId])

ALTER TABLE [dbo].[DataDictionaryColumns] CHECK CONSTRAINT [FK_DataDictionaryColumns_DataDictionaryColumnTypes]

ALTER TABLE [dbo].[DataDictionaryColumns]  WITH CHECK ADD  CONSTRAINT [FK_DataDictionaryColumns_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[DataDictionaryColumns] CHECK CONSTRAINT [FK_DataDictionaryColumns_DataDictionaryTables]

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

ALTER TABLE [dbo].[ExplanationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ExplanationTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ExplanationTypes] CHECK CONSTRAINT [FK_ExplanationTypesDescription_UITerms]

ALTER TABLE [dbo].[ExplanationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ExplanationTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ExplanationTypes] CHECK CONSTRAINT [FK_ExplanationTypesMenuName_UITerms]

ALTER TABLE [dbo].[ExplanationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ExplanationTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ExplanationTypes] CHECK CONSTRAINT [FK_ExplanationTypesMouseOver_UITerms]

ALTER TABLE [dbo].[ExplanationTypes]  WITH CHECK ADD  CONSTRAINT [FK_ExplanationTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ExplanationTypes] CHECK CONSTRAINT [FK_ExplanationTypesName_UITerms]

ALTER TABLE [dbo].[FileTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[FileTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms]

ALTER TABLE [dbo].[FileTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[FileTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms1]

ALTER TABLE [dbo].[FileTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[FileTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms2]

ALTER TABLE [dbo].[FileTypes]  WITH CHECK ADD  CONSTRAINT [FK_AttachmentTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[FileTypes] CHECK CONSTRAINT [FK_AttachmentTypes_UITerms3]

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

ALTER TABLE [dbo].[MetaContents]  WITH CHECK ADD  CONSTRAINT [FK_MetaContents_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[MetaContents] CHECK CONSTRAINT [FK_MetaContents_AspNetUsers]

ALTER TABLE [dbo].[MetaContents]  WITH CHECK ADD  CONSTRAINT [FK_MetaContents_MetaContentTypes] FOREIGN KEY([MetaContentTypeId])
REFERENCES [dbo].[MetaContentTypes] ([MetaContentTypeID])

ALTER TABLE [dbo].[MetaContents] CHECK CONSTRAINT [FK_MetaContents_MetaContentTypes]

ALTER TABLE [dbo].[MetaContents]  WITH CHECK ADD  CONSTRAINT [FK_MetaContents_MetaTypes] FOREIGN KEY([MetaTypeId])
REFERENCES [dbo].[MetaTypes] ([MetaTypeID])

ALTER TABLE [dbo].[MetaContents] CHECK CONSTRAINT [FK_MetaContents_MetaTypes]

ALTER TABLE [dbo].[MetaContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaContentTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaContentTypes] CHECK CONSTRAINT [FK_MetaContentTypes_UITerms]

ALTER TABLE [dbo].[MetaContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaContentTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaContentTypes] CHECK CONSTRAINT [FK_MetaContentTypes_UITerms1]

ALTER TABLE [dbo].[MetaContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaContentTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaContentTypes] CHECK CONSTRAINT [FK_MetaContentTypes_UITerms2]

ALTER TABLE [dbo].[MetaContentTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaContentTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaContentTypes] CHECK CONSTRAINT [FK_MetaContentTypes_UITerms3]

ALTER TABLE [dbo].[MetaTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaTypes] CHECK CONSTRAINT [FK_MetaTypes_UITerms]

ALTER TABLE [dbo].[MetaTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaTypes] CHECK CONSTRAINT [FK_MetaTypes_UITerms1]

ALTER TABLE [dbo].[MetaTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaTypes] CHECK CONSTRAINT [FK_MetaTypes_UITerms2]

ALTER TABLE [dbo].[MetaTypes]  WITH CHECK ADD  CONSTRAINT [FK_MetaTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[MetaTypes] CHECK CONSTRAINT [FK_MetaTypes_UITerms3]

ALTER TABLE [dbo].[MVCFavoriteGroups]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteGroups_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[MVCFavoriteGroups] CHECK CONSTRAINT [FK_FavoriteGroups_AspNetUsers]

ALTER TABLE [dbo].[MVCFavoriteGroups]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteGroups_AspNetUsers1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[MVCFavoriteGroups] CHECK CONSTRAINT [FK_FavoriteGroups_AspNetUsers1]

ALTER TABLE [dbo].[MVCFavoriteGroups]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteGroups_AspNetUsers2] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[MVCFavoriteGroups] CHECK CONSTRAINT [FK_FavoriteGroups_AspNetUsers2]

ALTER TABLE [dbo].[MVCFavorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[MVCFavorites] CHECK CONSTRAINT [FK_Favorites_AspNetUsers]

ALTER TABLE [dbo].[MVCFavorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_AspNetUsers1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[MVCFavorites] CHECK CONSTRAINT [FK_Favorites_AspNetUsers1]

ALTER TABLE [dbo].[MVCFavorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_AspNetUsers2] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[MVCFavorites] CHECK CONSTRAINT [FK_Favorites_AspNetUsers2]

ALTER TABLE [dbo].[MVCFavorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_FavoriteGroups] FOREIGN KEY([MVCFavoriteGroupId])
REFERENCES [dbo].[MVCFavoriteGroups] ([MVCFavoriteGroupId])

ALTER TABLE [dbo].[MVCFavorites] CHECK CONSTRAINT [FK_Favorites_FavoriteGroups]

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

ALTER TABLE [dbo].[ObjectTypePropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStatuses_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypePropertyStatuses] CHECK CONSTRAINT [FK_PropertyStatuses_UITerms]

ALTER TABLE [dbo].[ObjectTypePropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStatuses_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypePropertyStatuses] CHECK CONSTRAINT [FK_PropertyStatuses_UITerms1]

ALTER TABLE [dbo].[ObjectTypePropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStatuses_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypePropertyStatuses] CHECK CONSTRAINT [FK_PropertyStatuses_UITerms2]

ALTER TABLE [dbo].[ObjectTypePropertyStatuses]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStatuses_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypePropertyStatuses] CHECK CONSTRAINT [FK_PropertyStatuses_UITerms3]

ALTER TABLE [dbo].[ObjectTypeStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ObjectTypeStatuses_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypeStatuses] CHECK CONSTRAINT [FK_ObjectTypeStatuses_UITerms]

ALTER TABLE [dbo].[ObjectTypeStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ObjectTypeStatuses_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypeStatuses] CHECK CONSTRAINT [FK_ObjectTypeStatuses_UITerms1]

ALTER TABLE [dbo].[ObjectTypeStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ObjectTypeStatuses_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypeStatuses] CHECK CONSTRAINT [FK_ObjectTypeStatuses_UITerms2]

ALTER TABLE [dbo].[ObjectTypeStatuses]  WITH CHECK ADD  CONSTRAINT [FK_ObjectTypeStatuses_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ObjectTypeStatuses] CHECK CONSTRAINT [FK_ObjectTypeStatuses_UITerms3]

ALTER TABLE [dbo].[OrganizationAddresses]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAddresses_AddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])

ALTER TABLE [dbo].[OrganizationAddresses] CHECK CONSTRAINT [FK_OrganizationAddresses_AddressTypes]

ALTER TABLE [dbo].[OrganizationAddresses]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationAddresses_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationAddresses] CHECK CONSTRAINT [FK_OrganizationAddresses_Organizations]

ALTER TABLE [dbo].[OrganizationClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationClassificationValues_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[OrganizationClassificationValues] CHECK CONSTRAINT [FK_OrganizationClassificationValues_ClassificationValues]

ALTER TABLE [dbo].[OrganizationClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationClassificationValues_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationClassificationValues] CHECK CONSTRAINT [FK_OrganizationClassificationValues_Organization]

ALTER TABLE [dbo].[OrganizationClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationClassificationValuesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationClassificationValues] CHECK CONSTRAINT [FK_OrganizationClassificationValuesCreator_AspNetUsers]

ALTER TABLE [dbo].[OrganizationClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationClassificationValuesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationClassificationValues] CHECK CONSTRAINT [FK_OrganizationClassificationValuesModifier_AspNetUsers]

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

ALTER TABLE [dbo].[OrganizationPersons]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPersons_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationPersons] CHECK CONSTRAINT [FK_OrganizationPersons_AspNetUsers]

ALTER TABLE [dbo].[OrganizationPersons]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPersons_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationPersons] CHECK CONSTRAINT [FK_OrganizationPersons_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationPersons]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPersons_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationPersons] CHECK CONSTRAINT [FK_OrganizationPersons_Organizations]

ALTER TABLE [dbo].[OrganizationPersons]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPersons_Persons] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([PersonID])

ALTER TABLE [dbo].[OrganizationPersons] CHECK CONSTRAINT [FK_OrganizationPersons_Persons]

ALTER TABLE [dbo].[OrganizationPersons]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPersons_Positions] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionID])

ALTER TABLE [dbo].[OrganizationPersons] CHECK CONSTRAINT [FK_OrganizationPersons_Positions]

ALTER TABLE [dbo].[OrganizationPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPropertyLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationPropertyLanguages] CHECK CONSTRAINT [FK_OrganizationPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[OrganizationPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPropertyLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationPropertyLanguages] CHECK CONSTRAINT [FK_OrganizationPropertyLanguages_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPropertyLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[OrganizationPropertyLanguages] CHECK CONSTRAINT [FK_OrganizationPropertyLanguages_Languages]

ALTER TABLE [dbo].[OrganizationPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPropertyLanguages_OrganizationProperties] FOREIGN KEY([OrganizationPropertyID], [OrganizationID], [PropertyID])
REFERENCES [dbo].[OrganizationPropertyValues] ([OrganizationPropertyValueID], [OrganizationID], [PropertyID])

ALTER TABLE [dbo].[OrganizationPropertyLanguages] CHECK CONSTRAINT [FK_OrganizationPropertyLanguages_OrganizationProperties]

ALTER TABLE [dbo].[OrganizationPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPropertyLanguages_OrganizationProperties1] FOREIGN KEY([OrganizationPropertyID], [OrganizationID], [PropertyID])
REFERENCES [dbo].[OrganizationPropertyValues] ([OrganizationPropertyValueID], [OrganizationID], [PropertyID])

ALTER TABLE [dbo].[OrganizationPropertyLanguages] CHECK CONSTRAINT [FK_OrganizationPropertyLanguages_OrganizationProperties1]

ALTER TABLE [dbo].[OrganizationPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationPropertyLanguages_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationPropertyLanguages] CHECK CONSTRAINT [FK_OrganizationPropertyLanguages_Organizations]

ALTER TABLE [dbo].[OrganizationPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationPropertyValues] CHECK CONSTRAINT [FK_OrganizationProperties_AspNetUsers]

ALTER TABLE [dbo].[OrganizationPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationPropertyValues] CHECK CONSTRAINT [FK_OrganizationProperties_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationProperties_Organizations] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organizations] ([OrganizationID])

ALTER TABLE [dbo].[OrganizationPropertyValues] CHECK CONSTRAINT [FK_OrganizationProperties_Organizations]

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

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_Languages]

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_OrganizationTypeChildOrganizationTypes] FOREIGN KEY([OrganizationTypeChildOrganizationTypeID])
REFERENCES [dbo].[OrganizationTypeChildOrganizationTypes] ([OrganizationTypeChildOrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeChildOrganizationTypeLanguages_OrganizationTypeChildOrganizationTypes]

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeChildOrganizationTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypeChildOrganizationTypes_AspNetUsers]

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeChildOrganizationTypes_OrganizationTypes] FOREIGN KEY([ParentOrganizationTypeId])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypeChildOrganizationTypes_OrganizationTypes]

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeChildOrganizationTypes_OrganizationTypes1] FOREIGN KEY([ChildOrganizationTypeId])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeChildOrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypeChildOrganizationTypes_OrganizationTypes1]

ALTER TABLE [dbo].[OrganizationTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeClassifications_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeClassifications] CHECK CONSTRAINT [FK_OrganizationTypeClassifications_AspNetUsers]

ALTER TABLE [dbo].[OrganizationTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeClassifications_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[OrganizationTypeClassifications] CHECK CONSTRAINT [FK_OrganizationTypeClassifications_Classifications]

ALTER TABLE [dbo].[OrganizationTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeClassifications_OrganizationTypeClassificationStatuses] FOREIGN KEY([ObjectTypeClassificationStatusID])
REFERENCES [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID])

ALTER TABLE [dbo].[OrganizationTypeClassifications] CHECK CONSTRAINT [FK_OrganizationTypeClassifications_OrganizationTypeClassificationStatuses]

ALTER TABLE [dbo].[OrganizationTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeClassifications_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeClassifications] CHECK CONSTRAINT [FK_OrganizationTypeClassifications_OrganizationTypes]

ALTER TABLE [dbo].[OrganizationTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeContents_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeContents] CHECK CONSTRAINT [FK_OrganizationTypeContents_AspNetUsers]

ALTER TABLE [dbo].[OrganizationTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeContents_AspNetUsers1] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeContents] CHECK CONSTRAINT [FK_OrganizationTypeContents_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeContents_ExplanationTypes] FOREIGN KEY([ExplanationTypeId])
REFERENCES [dbo].[ExplanationTypes] ([ExplanationTypeID])

ALTER TABLE [dbo].[OrganizationTypeContents] CHECK CONSTRAINT [FK_OrganizationTypeContents_ExplanationTypes]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_Languages]

ALTER TABLE [dbo].[OrganizationTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeLanguages] CHECK CONSTRAINT [FK_OrganizationTypeLanguages_OrganizationTypes]

ALTER TABLE [dbo].[OrganizationTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeProperties] CHECK CONSTRAINT [FK_OrganizationTypeProperties_AspNetUsers]

ALTER TABLE [dbo].[OrganizationTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypeProperties] CHECK CONSTRAINT [FK_OrganizationTypeProperties_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeProperties_OrganizationTypes] FOREIGN KEY([OrganizationTypeID])
REFERENCES [dbo].[OrganizationTypes] ([OrganizationTypeID])

ALTER TABLE [dbo].[OrganizationTypeProperties] CHECK CONSTRAINT [FK_OrganizationTypeProperties_OrganizationTypes]

ALTER TABLE [dbo].[OrganizationTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[OrganizationTypeProperties] CHECK CONSTRAINT [FK_OrganizationTypeProperties_Properties]

ALTER TABLE [dbo].[OrganizationTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypeProperties_PropertyStatuses] FOREIGN KEY([ObjectTypePropertyStatusId])
REFERENCES [dbo].[ObjectTypePropertyStatuses] ([ObjectTypePropertyStatusID])

ALTER TABLE [dbo].[OrganizationTypeProperties] CHECK CONSTRAINT [FK_OrganizationTypeProperties_PropertyStatuses]

ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_AspNetUsers]

ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_AspNetUsers1]

ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_CodeTypes] FOREIGN KEY([CodeTypeId])
REFERENCES [dbo].[CodeTypes] ([CodeTypeID])

ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_CodeTypes]

ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_Icons]

ALTER TABLE [dbo].[OrganizationTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrganizationTypes_ObjectTypeStatuses] FOREIGN KEY([ObjectTypeStatusId])
REFERENCES [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID])

ALTER TABLE [dbo].[OrganizationTypes] CHECK CONSTRAINT [FK_OrganizationTypes_ObjectTypeStatuses]

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

ALTER TABLE [dbo].[PersonClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_PersonClassificationValues_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[PersonClassificationValues] CHECK CONSTRAINT [FK_PersonClassificationValues_ClassificationValues]

ALTER TABLE [dbo].[PersonClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_PersonClassificationValues_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])

ALTER TABLE [dbo].[PersonClassificationValues] CHECK CONSTRAINT [FK_PersonClassificationValues_Person]

ALTER TABLE [dbo].[PersonClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_PersonClassificationValuesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonClassificationValues] CHECK CONSTRAINT [FK_PersonClassificationValuesCreator_AspNetUsers]

ALTER TABLE [dbo].[PersonClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_PersonClassificationValuesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonClassificationValues] CHECK CONSTRAINT [FK_PersonClassificationValuesModifier_AspNetUsers]

ALTER TABLE [dbo].[PersonPropertValues]  WITH CHECK ADD  CONSTRAINT [FK_PersonProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonPropertValues] CHECK CONSTRAINT [FK_PersonProperties_AspNetUsers]

ALTER TABLE [dbo].[PersonPropertValues]  WITH CHECK ADD  CONSTRAINT [FK_PersonProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonPropertValues] CHECK CONSTRAINT [FK_PersonProperties_AspNetUsers1]

ALTER TABLE [dbo].[PersonPropertValues]  WITH CHECK ADD  CONSTRAINT [FK_PersonProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[PersonPropertValues] CHECK CONSTRAINT [FK_PersonProperties_Properties]

ALTER TABLE [dbo].[PersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonPropertyLanguages] CHECK CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[PersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonPropertyLanguages] CHECK CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonPropertyLanguages] CHECK CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers2]

ALTER TABLE [dbo].[PersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonPropertyLanguages] CHECK CONSTRAINT [FK_PersonPropertyLanguages_AspNetUsers3]

ALTER TABLE [dbo].[PersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonPropertyLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PersonPropertyLanguages] CHECK CONSTRAINT [FK_PersonPropertyLanguages_Languages]

ALTER TABLE [dbo].[PersonPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonPropertyLanguages_PersonProperties] FOREIGN KEY([PersonPropertyID], [PersonID], [PropertyID])
REFERENCES [dbo].[PersonPropertValues] ([PersonPropertyValueID], [PersonID], [PropertyID])

ALTER TABLE [dbo].[PersonPropertyLanguages] CHECK CONSTRAINT [FK_PersonPropertyLanguages_PersonProperties]

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

ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_PersonTypes] FOREIGN KEY([PersonTypeId])
REFERENCES [dbo].[PersonTypes] ([PersonTypeID])

ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_PersonTypes]

ALTER TABLE [dbo].[PersonTelecomPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecomPhones_PersonTelecoms] FOREIGN KEY([PersonTelecomID])
REFERENCES [dbo].[PersonTelecoms] ([PersonTelecomID])

ALTER TABLE [dbo].[PersonTelecomPhones] CHECK CONSTRAINT [FK_PersonTelecomPhones_PersonTelecoms]

ALTER TABLE [dbo].[PersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecoms_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])

ALTER TABLE [dbo].[PersonTelecoms] CHECK CONSTRAINT [FK_PersonTelecoms_Persons]

ALTER TABLE [dbo].[PersonTelecoms]  WITH CHECK ADD  CONSTRAINT [FK_PersonTelecoms_TelecomTypes] FOREIGN KEY([TelecomTypeID])
REFERENCES [dbo].[TelecomTypes] ([TelecomTypeID])

ALTER TABLE [dbo].[PersonTelecoms] CHECK CONSTRAINT [FK_PersonTelecoms_TelecomTypes]

ALTER TABLE [dbo].[PersonTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeClassifications_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeClassifications] CHECK CONSTRAINT [FK_PersonTypeClassifications_AspNetUsers]

ALTER TABLE [dbo].[PersonTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeClassifications_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[PersonTypeClassifications] CHECK CONSTRAINT [FK_PersonTypeClassifications_Classifications]

ALTER TABLE [dbo].[PersonTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeClassifications_PersonTypeClassificationStatuses] FOREIGN KEY([ObjectTypeClassificationStatusID])
REFERENCES [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID])

ALTER TABLE [dbo].[PersonTypeClassifications] CHECK CONSTRAINT [FK_PersonTypeClassifications_PersonTypeClassificationStatuses]

ALTER TABLE [dbo].[PersonTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeClassifications_PersonTypes] FOREIGN KEY([PersonTypeID])
REFERENCES [dbo].[PersonTypes] ([PersonTypeID])

ALTER TABLE [dbo].[PersonTypeClassifications] CHECK CONSTRAINT [FK_PersonTypeClassifications_PersonTypes]

ALTER TABLE [dbo].[PersonTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeContents_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeContents] CHECK CONSTRAINT [FK_PersonTypeContents_AspNetUsers]

ALTER TABLE [dbo].[PersonTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeContents_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeContents] CHECK CONSTRAINT [FK_PersonTypeContents_AspNetUsers1]

ALTER TABLE [dbo].[PersonTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeContents_ExplanationTypes] FOREIGN KEY([ExplanationTypeId])
REFERENCES [dbo].[ExplanationTypes] ([ExplanationTypeID])

ALTER TABLE [dbo].[PersonTypeContents] CHECK CONSTRAINT [FK_PersonTypeContents_ExplanationTypes]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers2]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_AspNetUsers3]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_Languages]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_Languages1] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_Languages1]

ALTER TABLE [dbo].[PersonTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeLanguages_PersonTypes] FOREIGN KEY([PersonTypeID])
REFERENCES [dbo].[PersonTypes] ([PersonTypeID])

ALTER TABLE [dbo].[PersonTypeLanguages] CHECK CONSTRAINT [FK_PersonTypeLanguages_PersonTypes]

ALTER TABLE [dbo].[PersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeProperties] CHECK CONSTRAINT [FK_PersonTypeProperties_AspNetUsers]

ALTER TABLE [dbo].[PersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeProperties] CHECK CONSTRAINT [FK_PersonTypeProperties_AspNetUsers1]

ALTER TABLE [dbo].[PersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeProperties_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeProperties] CHECK CONSTRAINT [FK_PersonTypeProperties_AspNetUsers2]

ALTER TABLE [dbo].[PersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeProperties_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypeProperties] CHECK CONSTRAINT [FK_PersonTypeProperties_AspNetUsers3]

ALTER TABLE [dbo].[PersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[PersonTypeProperties] CHECK CONSTRAINT [FK_PersonTypeProperties_Properties]

ALTER TABLE [dbo].[PersonTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypeProperties_PropertyStatuses] FOREIGN KEY([ObjectTypePropertyStatusId])
REFERENCES [dbo].[ObjectTypePropertyStatuses] ([ObjectTypePropertyStatusID])

ALTER TABLE [dbo].[PersonTypeProperties] CHECK CONSTRAINT [FK_PersonTypeProperties_PropertyStatuses]

ALTER TABLE [dbo].[PersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypes] CHECK CONSTRAINT [FK_PersonTypes_AspNetUsers]

ALTER TABLE [dbo].[PersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypes] CHECK CONSTRAINT [FK_PersonTypes_AspNetUsers1]

ALTER TABLE [dbo].[PersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypes_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypes] CHECK CONSTRAINT [FK_PersonTypes_AspNetUsers2]

ALTER TABLE [dbo].[PersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypes_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PersonTypes] CHECK CONSTRAINT [FK_PersonTypes_AspNetUsers3]

ALTER TABLE [dbo].[PersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypes_CodeTypes] FOREIGN KEY([CodeTypeId])
REFERENCES [dbo].[CodeTypes] ([CodeTypeID])

ALTER TABLE [dbo].[PersonTypes] CHECK CONSTRAINT [FK_PersonTypes_CodeTypes]

ALTER TABLE [dbo].[PersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[PersonTypes] CHECK CONSTRAINT [FK_PersonTypes_Icons]

ALTER TABLE [dbo].[PersonTypes]  WITH CHECK ADD  CONSTRAINT [FK_PersonTypes_ObjectTypeStatuses] FOREIGN KEY([ObjectTypeStatusId])
REFERENCES [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID])

ALTER TABLE [dbo].[PersonTypes] CHECK CONSTRAINT [FK_PersonTypes_ObjectTypeStatuses]

ALTER TABLE [dbo].[PositionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PositionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PositionLanguages] CHECK CONSTRAINT [FK_PositionLanguages_AspNetUsers]

ALTER TABLE [dbo].[PositionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PositionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[PositionLanguages] CHECK CONSTRAINT [FK_PositionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[PositionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PositionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PositionLanguages] CHECK CONSTRAINT [FK_PositionLanguages_Languages]

ALTER TABLE [dbo].[PositionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PositionLanguages_Positions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([PositionID])

ALTER TABLE [dbo].[PositionLanguages] CHECK CONSTRAINT [FK_PositionLanguages_Positions]

ALTER TABLE [dbo].[Positions]  WITH CHECK ADD  CONSTRAINT [FK_Positions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Positions] CHECK CONSTRAINT [FK_Positions_AspNetUsers]

ALTER TABLE [dbo].[Positions]  WITH CHECK ADD  CONSTRAINT [FK_Positions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[Positions] CHECK CONSTRAINT [FK_Positions_AspNetUsers1]

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

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_ProcessTypes] FOREIGN KEY([ProcessTypeID])
REFERENCES [dbo].[ProcessTypes] ([ProcessTypeID])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_ProcessTypes]

ALTER TABLE [dbo].[Processes]  WITH CHECK ADD  CONSTRAINT [FK_Processes_ProcessTypeStages] FOREIGN KEY([ProcessTypeStageID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeStages] ([ProcessTypeStageID], [ProcessTypeID])

ALTER TABLE [dbo].[Processes] CHECK CONSTRAINT [FK_Processes_ProcessTypeStages]

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

ALTER TABLE [dbo].[ProcessTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypecontents_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeContents] CHECK CONSTRAINT [FK_ProcessTypecontents_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypecontents_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeContents] CHECK CONSTRAINT [FK_ProcessTypecontents_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypecontents_ExplanationTypes] FOREIGN KEY([ExplanationTypeId])
REFERENCES [dbo].[ExplanationTypes] ([ExplanationTypeID])

ALTER TABLE [dbo].[ProcessTypeContents] CHECK CONSTRAINT [FK_ProcessTypecontents_ExplanationTypes]

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms]

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms1]

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms2]

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionComparisonOperators_UITerms3]

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_ProcessTypeFieldConditions] FOREIGN KEY([ProcessTypeFieldConditionID], [ProcessTypeID], [ProcessTypeFieldID])
REFERENCES [dbo].[ProcessTypeFieldConditions] ([ProcessTypeFieldConditionID], [ProcessTypeID], [ProcessTypeFieldID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionLanguages_ProcessTypeFieldConditions]

ALTER TABLE [dbo].[ProcessTypeFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFieldConditions] CHECK CONSTRAINT [FK_ProcessTypeFieldConditions_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFieldConditions] CHECK CONSTRAINT [FK_ProcessTypeFieldConditions_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditions_ProcessTypeFieldConditionComparisonOperators] FOREIGN KEY([ComparisonOperatorID])
REFERENCES [dbo].[ProcessTypeFieldConditionComparisonOperators] ([ProcessTypeFieldConditionComparisonOperatorID])

ALTER TABLE [dbo].[ProcessTypeFieldConditions] CHECK CONSTRAINT [FK_ProcessTypeFieldConditions_ProcessTypeFieldConditionComparisonOperators]

ALTER TABLE [dbo].[ProcessTypeFieldConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditions_ProcessTypeFieldConditionTypes] FOREIGN KEY([ProcessTypeFieldConditionTypeID])
REFERENCES [dbo].[ProcessTypeFieldConditionTypes] ([ProcessTypeFieldConditionTypeID])

ALTER TABLE [dbo].[ProcessTypeFieldConditions] CHECK CONSTRAINT [FK_ProcessTypeFieldConditions_ProcessTypeFieldConditionTypes]

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionTypes_ProcessTypeFieldTypes] FOREIGN KEY([ProcessTypeFieldTypeID])
REFERENCES [dbo].[ProcessTypeFieldTypes] ([ProcessTypeFieldTypeID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionTypes_ProcessTypeFieldTypes]

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms]

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms1]

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms2]

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldConditionTypes_UITerms3]

ALTER TABLE [dbo].[ProcessTypeFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFieldLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFieldLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeFieldLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeFieldLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldLanguages_ProcessTypeFields] FOREIGN KEY([ProcessTypeFieldID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeFields] ([ProcessTypeFieldID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFieldLanguages] CHECK CONSTRAINT [FK_ProcessTypeFieldLanguages_ProcessTypeFields]

ALTER TABLE [dbo].[ProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFields_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFields] CHECK CONSTRAINT [FK_ProcessTypeFields_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFields_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFields] CHECK CONSTRAINT [FK_ProcessTypeFields_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFields_AspNetUsers2] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFields] CHECK CONSTRAINT [FK_ProcessTypeFields_AspNetUsers2]

ALTER TABLE [dbo].[ProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFields_AspNetUsers3] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFields] CHECK CONSTRAINT [FK_ProcessTypeFields_AspNetUsers3]

ALTER TABLE [dbo].[ProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFields_ProcessTypeFieldTypes] FOREIGN KEY([ProcessTypeFieldTypeID])
REFERENCES [dbo].[ProcessTypeFieldTypes] ([ProcessTypeFieldTypeID])

ALTER TABLE [dbo].[ProcessTypeFields] CHECK CONSTRAINT [FK_ProcessTypeFields_ProcessTypeFieldTypes]

ALTER TABLE [dbo].[ProcessTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFields_ProcessTypes] FOREIGN KEY([ProcessTypeID])
REFERENCES [dbo].[ProcessTypes] ([ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFields] CHECK CONSTRAINT [FK_ProcessTypeFields_ProcessTypes]

ALTER TABLE [dbo].[ProcessTypeFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms]

ALTER TABLE [dbo].[ProcessTypeFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms1]

ALTER TABLE [dbo].[ProcessTypeFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms2]

ALTER TABLE [dbo].[ProcessTypeFieldTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFieldTypes] CHECK CONSTRAINT [FK_ProcessTypeFieldTypes_UITerms3]

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsDescription_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsMenuName_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsMouseOver_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionComparisonOperatorsName_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_ProcessTypeFlowConditions] FOREIGN KEY([ProcessTypeFlowConditionID], [ProcessTypeID], [ProcessTypeFlowID])
REFERENCES [dbo].[ProcessTypeFlowConditions] ([ProcessTypeFlowConditionID], [ProcessTypeID], [ProcessTypeFlowID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionLanguages_ProcessTypeFlowConditions]

ALTER TABLE [dbo].[ProcessTypeFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditions_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowConditions] CHECK CONSTRAINT [FK_ProcessTypeFlowConditions_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditions_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowConditions] CHECK CONSTRAINT [FK_ProcessTypeFlowConditions_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditions_ProcessTypeFlowConditionComparisonOperators] FOREIGN KEY([ComparisonOperatorID])
REFERENCES [dbo].[ProcessTypeFlowConditionComparisonOperators] ([ProcessTypeFlowConditionComparisonOperatorID])

ALTER TABLE [dbo].[ProcessTypeFlowConditions] CHECK CONSTRAINT [FK_ProcessTypeFlowConditions_ProcessTypeFlowConditionComparisonOperators]

ALTER TABLE [dbo].[ProcessTypeFlowConditions]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditions_ProcessTypeFlows] FOREIGN KEY([ProcessTypeFlowID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeFlows] ([ProcessTypeFlowID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFlowConditions] CHECK CONSTRAINT [FK_ProcessTypeFlowConditions_ProcessTypeFlows]

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionTypesDescription_UITerms] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionTypesDescription_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionTypesMenuName_UITerms] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionTypesMenuName_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionTypesMouseOver_UITerms] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionTypesMouseOver_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowConditionTypesName_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowConditionTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowConditionTypesName_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeFlowLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeFlowLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowLanguages_ProcessTypeFlows] FOREIGN KEY([ProcessTypeFlowID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeFlows] ([ProcessTypeFlowID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFlowLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowLanguages_ProcessTypeFlows]

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms1]

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms2]

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassComparisonOperators] CHECK CONSTRAINT [FK_ProcessTypeFlowPassComparisonOperators_UITerms3]

ALTER TABLE [dbo].[ProcessTypeFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPasses_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowPasses] CHECK CONSTRAINT [FK_ProcessTypeFlowPasses_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPasses_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowPasses] CHECK CONSTRAINT [FK_ProcessTypeFlowPasses_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFlowPasses]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPasses_ProcessTypeFlows] FOREIGN KEY([ProcessTypeFlowID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeFlows] ([ProcessTypeFlowID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFlowPasses] CHECK CONSTRAINT [FK_ProcessTypeFlowPasses_ProcessTypeFlows]

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowPassLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowPassLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowPassLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassLanguages_ProcessTypeFlowPasses] FOREIGN KEY([ProcessTypeFlowPassID], [ProcessTypeID], [ProcessTypeFlowID])
REFERENCES [dbo].[ProcessTypeFlowPasses] ([ProcessTypeFlowPassID], [ProcessTypeID], [ProcessTypeFlowID])

ALTER TABLE [dbo].[ProcessTypeFlowPassLanguages] CHECK CONSTRAINT [FK_ProcessTypeFlowPassLanguages_ProcessTypeFlowPasses]

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms]

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms1]

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms2]

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[ProcessTypeFlowPassTypes] CHECK CONSTRAINT [FK_ProcessTypeFlowPassTypes_UITerms3]

ALTER TABLE [dbo].[ProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlows_AspNetUsers] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlows] CHECK CONSTRAINT [FK_ProcessTypeFlows_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlows_AspNetUsers1] FOREIGN KEY([ModifierId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeFlows] CHECK CONSTRAINT [FK_ProcessTypeFlows_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlows_ProcessTypes] FOREIGN KEY([ProcessTypeID])
REFERENCES [dbo].[ProcessTypes] ([ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFlows] CHECK CONSTRAINT [FK_ProcessTypeFlows_ProcessTypes]

ALTER TABLE [dbo].[ProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlows_ProcessTypeStages] FOREIGN KEY([ProcessTypeFromStageID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeStages] ([ProcessTypeStageID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFlows] CHECK CONSTRAINT [FK_ProcessTypeFlows_ProcessTypeStages]

ALTER TABLE [dbo].[ProcessTypeFlows]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeFlows_ProcessTypeStages1] FOREIGN KEY([ProcessTypeToStageID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeStages] ([ProcessTypeStageID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeFlows] CHECK CONSTRAINT [FK_ProcessTypeFlows_ProcessTypeStages1]

ALTER TABLE [dbo].[ProcessTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeGroupLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeGroupLanguages] CHECK CONSTRAINT [FK_ProcessTypeGroupLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeGroupLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeGroupLanguages] CHECK CONSTRAINT [FK_ProcessTypeGroupLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeGroupLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeGroupLanguages] CHECK CONSTRAINT [FK_ProcessTypeGroupLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeGroupLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeGroupLanguages_ProcessTypeGroups] FOREIGN KEY([ProcessTypeGroupID])
REFERENCES [dbo].[ProcessTypeGroups] ([ProcessTypeGroupID])

ALTER TABLE [dbo].[ProcessTypeGroupLanguages] CHECK CONSTRAINT [FK_ProcessTypeGroupLanguages_ProcessTypeGroups]

ALTER TABLE [dbo].[ProcessTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeGroups_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeGroups] CHECK CONSTRAINT [FK_ProcessTypeGroups_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeGroups_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeGroups] CHECK CONSTRAINT [FK_ProcessTypeGroups_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeLanguages_ProcessTypes] FOREIGN KEY([ProcessTypeID])
REFERENCES [dbo].[ProcessTypes] ([ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeLanguages_ProcessTypes]

ALTER TABLE [dbo].[ProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypes] CHECK CONSTRAINT [FK_ProcessTypes_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypes] CHECK CONSTRAINT [FK_ProcessTypes_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypes_CodeTypes] FOREIGN KEY([CodeTypeId])
REFERENCES [dbo].[CodeTypes] ([CodeTypeID])

ALTER TABLE [dbo].[ProcessTypes] CHECK CONSTRAINT [FK_ProcessTypes_CodeTypes]

ALTER TABLE [dbo].[ProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ProcessTypes] CHECK CONSTRAINT [FK_ProcessTypes_Icons]

ALTER TABLE [dbo].[ProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypes_ObjectTypeStatuses] FOREIGN KEY([ObjectTypeStatusId])
REFERENCES [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID])

ALTER TABLE [dbo].[ProcessTypes] CHECK CONSTRAINT [FK_ProcessTypes_ObjectTypeStatuses]

ALTER TABLE [dbo].[ProcessTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypes_ProcessTypeGroups] FOREIGN KEY([ProcessTypeGroupID])
REFERENCES [dbo].[ProcessTypeGroups] ([ProcessTypeGroupID])

ALTER TABLE [dbo].[ProcessTypes] CHECK CONSTRAINT [FK_ProcessTypes_ProcessTypeGroups]

ALTER TABLE [dbo].[ProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageFields_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStageFields] CHECK CONSTRAINT [FK_ProcessTypeStageFields_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageFields_ProcessTypeFields] FOREIGN KEY([ProcessTypeFieldID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeFields] ([ProcessTypeFieldID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeStageFields] CHECK CONSTRAINT [FK_ProcessTypeStageFields_ProcessTypeFields]

ALTER TABLE [dbo].[ProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageFields_ProcessTypeStageFieldStatuses] FOREIGN KEY([ProcessTypeStageFieldStatusID])
REFERENCES [dbo].[ProcessTypeStageFieldStatuses] ([ProcessTypeStageFieldStatusID])

ALTER TABLE [dbo].[ProcessTypeStageFields] CHECK CONSTRAINT [FK_ProcessTypeStageFields_ProcessTypeStageFieldStatuses]

ALTER TABLE [dbo].[ProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageFields_ProcessTypeStages] FOREIGN KEY([ProcessTypeStageID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeStages] ([ProcessTypeStageID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeStageFields] CHECK CONSTRAINT [FK_ProcessTypeStageFields_ProcessTypeStages]

ALTER TABLE [dbo].[ProcessTypeStageFields]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageFields_ValueUpdateTypes] FOREIGN KEY([ValueUpdateTypeID])
REFERENCES [dbo].[ValueUpdateTypes] ([ValueUpdateTypeID])

ALTER TABLE [dbo].[ProcessTypeStageFields] CHECK CONSTRAINT [FK_ProcessTypeStageFields_ValueUpdateTypes]

ALTER TABLE [dbo].[ProcessTypeStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStageLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStageLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProcessTypeStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeStageLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeStageLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageLanguages_ProcessTypeStages] FOREIGN KEY([ProcessTypeStageID], [ProcessTypeID])
REFERENCES [dbo].[ProcessTypeStages] ([ProcessTypeStageID], [ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeStageLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageLanguages_ProcessTypeStages]

ALTER TABLE [dbo].[ProcessTypeStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStages_ProcessTypes] FOREIGN KEY([ProcessTypeID])
REFERENCES [dbo].[ProcessTypes] ([ProcessTypeID])

ALTER TABLE [dbo].[ProcessTypeStages] CHECK CONSTRAINT [FK_ProcessTypeStages_ProcessTypes]

ALTER TABLE [dbo].[ProcessTypeStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStages_ProcessTypeStageTypes] FOREIGN KEY([ProcessTypeStageTypeID])
REFERENCES [dbo].[ProcessTypeStageTypes] ([ProcessTypeStageTypeID])

ALTER TABLE [dbo].[ProcessTypeStages] CHECK CONSTRAINT [FK_ProcessTypeStages_ProcessTypeStageTypes]

ALTER TABLE [dbo].[ProcessTypeStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStagesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStages] CHECK CONSTRAINT [FK_ProcessTypeStagesCreator_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeStages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStagesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStages] CHECK CONSTRAINT [FK_ProcessTypeStagesModifier_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageTypeLanguages_Languages]

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageTypeLanguages_ProcessTypeStageTypes] FOREIGN KEY([ProcessTypeStageTypeID])
REFERENCES [dbo].[ProcessTypeStageTypes] ([ProcessTypeStageTypeID])

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageTypeLanguages_ProcessTypeStageTypes]

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageTypeLanguagesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageTypeLanguagesCreator_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageTypeLanguagesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStageTypeLanguages] CHECK CONSTRAINT [FK_ProcessTypeStageTypeLanguagesModifier_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ProcessTypeStageTypes] CHECK CONSTRAINT [FK_ProcessTypeStageTypes_Icons]

ALTER TABLE [dbo].[ProcessTypeStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageTypesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStageTypes] CHECK CONSTRAINT [FK_ProcessTypeStageTypesCreator_AspNetUsers]

ALTER TABLE [dbo].[ProcessTypeStageTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProcessTypeStageTypesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProcessTypeStageTypes] CHECK CONSTRAINT [FK_ProcessTypeStageTypesModifier_AspNetUsers]

ALTER TABLE [dbo].[ProjectClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ProjectClassificationValues_ClassificationValues] FOREIGN KEY([ClassificationValueID], [ClassificationID])
REFERENCES [dbo].[ClassificationValues] ([ClassificationValueID], [ClassificationID])

ALTER TABLE [dbo].[ProjectClassificationValues] CHECK CONSTRAINT [FK_ProjectClassificationValues_ClassificationValues]

ALTER TABLE [dbo].[ProjectClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ProjectClassificationValues_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[ProjectClassificationValues] CHECK CONSTRAINT [FK_ProjectClassificationValues_Project]

ALTER TABLE [dbo].[ProjectClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ProjectClassificationValuesCreator_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectClassificationValues] CHECK CONSTRAINT [FK_ProjectClassificationValuesCreator_AspNetUsers]

ALTER TABLE [dbo].[ProjectClassificationValues]  WITH CHECK ADD  CONSTRAINT [FK_ProjectClassificationValuesModifier_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectClassificationValues] CHECK CONSTRAINT [FK_ProjectClassificationValuesModifier_AspNetUsers]

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

ALTER TABLE [dbo].[ProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectMatrixes] CHECK CONSTRAINT [FK_ProjectMatrixes_AspNetUsers]

ALTER TABLE [dbo].[ProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixes_ProjectMatrixTypes] FOREIGN KEY([ProjectMatrixTypeId])
REFERENCES [dbo].[ProjectMatrixTypes] ([ProjectMatrixTypeId])

ALTER TABLE [dbo].[ProjectMatrixes] CHECK CONSTRAINT [FK_ProjectMatrixes_ProjectMatrixTypes]

ALTER TABLE [dbo].[ProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixes_ProjectMatrixTypes1] FOREIGN KEY([ProjectMatrixTypeId])
REFERENCES [dbo].[ProjectMatrixTypes] ([ProjectMatrixTypeId])

ALTER TABLE [dbo].[ProjectMatrixes] CHECK CONSTRAINT [FK_ProjectMatrixes_ProjectMatrixTypes1]

ALTER TABLE [dbo].[ProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixes_Projects] FOREIGN KEY([FromProjectId])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[ProjectMatrixes] CHECK CONSTRAINT [FK_ProjectMatrixes_Projects]

ALTER TABLE [dbo].[ProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixes_Projects1] FOREIGN KEY([ToProjectId])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[ProjectMatrixes] CHECK CONSTRAINT [FK_ProjectMatrixes_Projects1]

ALTER TABLE [dbo].[ProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixes_Projects2] FOREIGN KEY([FromProjectId])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[ProjectMatrixes] CHECK CONSTRAINT [FK_ProjectMatrixes_Projects2]

ALTER TABLE [dbo].[ProjectMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixes_Projects3] FOREIGN KEY([ToProjectId])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[ProjectMatrixes] CHECK CONSTRAINT [FK_ProjectMatrixes_Projects3]

ALTER TABLE [dbo].[ProjectMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectMatrixLanguages] CHECK CONSTRAINT [FK_ProjectMatrixLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProjectMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectMatrixLanguages] CHECK CONSTRAINT [FK_ProjectMatrixLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProjectMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProjectMatrixLanguages] CHECK CONSTRAINT [FK_ProjectMatrixLanguages_Languages]

ALTER TABLE [dbo].[ProjectMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixLanguages_ProjectMatrixes] FOREIGN KEY([ProjectMatrixId])
REFERENCES [dbo].[ProjectMatrixes] ([ProjectMatrixID])

ALTER TABLE [dbo].[ProjectMatrixLanguages] CHECK CONSTRAINT [FK_ProjectMatrixLanguages_ProjectMatrixes]

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages] CHECK CONSTRAINT [FK_ProjectMatrixTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages] CHECK CONSTRAINT [FK_ProjectMatrixTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages] CHECK CONSTRAINT [FK_ProjectMatrixTypeLanguages_Languages]

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixTypeLanguages_ProjectMatrixTypes] FOREIGN KEY([ProjectMatrixTypeId])
REFERENCES [dbo].[ProjectMatrixTypes] ([ProjectMatrixTypeId])

ALTER TABLE [dbo].[ProjectMatrixTypeLanguages] CHECK CONSTRAINT [FK_ProjectMatrixTypeLanguages_ProjectMatrixTypes]

ALTER TABLE [dbo].[ProjectMatrixTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMatrixTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectMatrixTypes] CHECK CONSTRAINT [FK_ProjectMatrixTypes_AspNetUsers]

ALTER TABLE [dbo].[ProjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectProperties] CHECK CONSTRAINT [FK_ProjectProperties_AspNetUsers]

ALTER TABLE [dbo].[ProjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectProperties] CHECK CONSTRAINT [FK_ProjectProperties_AspNetUsers1]

ALTER TABLE [dbo].[ProjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectProperties_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])

ALTER TABLE [dbo].[ProjectProperties] CHECK CONSTRAINT [FK_ProjectProperties_Projects]

ALTER TABLE [dbo].[ProjectProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[ProjectProperties] CHECK CONSTRAINT [FK_ProjectProperties_Properties]

ALTER TABLE [dbo].[ProjectPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectPropertyLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectPropertyLanguages] CHECK CONSTRAINT [FK_ProjectPropertyLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProjectPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectPropertyLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectPropertyLanguages] CHECK CONSTRAINT [FK_ProjectPropertyLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProjectPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectPropertyLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProjectPropertyLanguages] CHECK CONSTRAINT [FK_ProjectPropertyLanguages_Languages]

ALTER TABLE [dbo].[ProjectPropertyLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectPropertyLanguages_ProjectProperties] FOREIGN KEY([ProjectPropertyID], [ProjectID], [PropertyID])
REFERENCES [dbo].[ProjectProperties] ([ProjectPropertyID], [ProjectID], [PropertyID])

ALTER TABLE [dbo].[ProjectPropertyLanguages] CHECK CONSTRAINT [FK_ProjectPropertyLanguages_ProjectProperties]

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

ALTER TABLE [dbo].[ProjectTypeChildProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeChildProjectTypeLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeChildProjectTypeLanguages] CHECK CONSTRAINT [FK_ProjectTypeChildProjectTypeLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeChildProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeChildProjectTypeLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeChildProjectTypeLanguages] CHECK CONSTRAINT [FK_ProjectTypeChildProjectTypeLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProjectTypeChildProjectTypeLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeChildProjectTypeLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProjectTypeChildProjectTypeLanguages] CHECK CONSTRAINT [FK_ProjectTypeChildProjectTypeLanguages_Languages]

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeChildProjectTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes] CHECK CONSTRAINT [FK_ProjectTypeChildProjectTypes_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeChildProjectTypes_ProjectTypeChildProjectTypeLanguages] FOREIGN KEY([ProjectTypeChildProjectTypeID])
REFERENCES [dbo].[ProjectTypeChildProjectTypeLanguages] ([ProjectTypeChildProjectTypeLanguageID])

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes] CHECK CONSTRAINT [FK_ProjectTypeChildProjectTypes_ProjectTypeChildProjectTypeLanguages]

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeChildProjectTypes_ProjectTypes] FOREIGN KEY([ParentProjectTypeId])
REFERENCES [dbo].[ProjectTypes] ([ProjectTypeID])

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes] CHECK CONSTRAINT [FK_ProjectTypeChildProjectTypes_ProjectTypes]

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeChildProjectTypes_ProjectTypes1] FOREIGN KEY([ChildProjectTypeId])
REFERENCES [dbo].[ProjectTypes] ([ProjectTypeID])

ALTER TABLE [dbo].[ProjectTypeChildProjectTypes] CHECK CONSTRAINT [FK_ProjectTypeChildProjectTypes_ProjectTypes1]

ALTER TABLE [dbo].[ProjectTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeClassifications_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeClassifications] CHECK CONSTRAINT [FK_ProjectTypeClassifications_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeClassifications_Classifications] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ProjectTypeClassifications] CHECK CONSTRAINT [FK_ProjectTypeClassifications_Classifications]

ALTER TABLE [dbo].[ProjectTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeClassifications_Classifications1] FOREIGN KEY([ClassificationID])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ProjectTypeClassifications] CHECK CONSTRAINT [FK_ProjectTypeClassifications_Classifications1]

ALTER TABLE [dbo].[ProjectTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeClassifications_ProjectTypeClassificationStatuses] FOREIGN KEY([ObjectTypeClassificationStatusID])
REFERENCES [dbo].[ObjectTypeClassificationStatuses] ([ObjectTypeClassificationStatusID])

ALTER TABLE [dbo].[ProjectTypeClassifications] CHECK CONSTRAINT [FK_ProjectTypeClassifications_ProjectTypeClassificationStatuses]

ALTER TABLE [dbo].[ProjectTypeClassifications]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeClassifications_ProjectTypes] FOREIGN KEY([ProjectTypeID])
REFERENCES [dbo].[ProjectTypes] ([ProjectTypeID])

ALTER TABLE [dbo].[ProjectTypeClassifications] CHECK CONSTRAINT [FK_ProjectTypeClassifications_ProjectTypes]

ALTER TABLE [dbo].[ProjectTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeContents_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeContents] CHECK CONSTRAINT [FK_ProjectTypeContents_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeContents_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeContents] CHECK CONSTRAINT [FK_ProjectTypeContents_AspNetUsers1]

ALTER TABLE [dbo].[ProjectTypeContents]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeContents_ExplanationTypes] FOREIGN KEY([ExplanationTypeId])
REFERENCES [dbo].[ExplanationTypes] ([ExplanationTypeID])

ALTER TABLE [dbo].[ProjectTypeContents] CHECK CONSTRAINT [FK_ProjectTypeContents_ExplanationTypes]

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

ALTER TABLE [dbo].[ProjectTypeMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeMatrixes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeMatrixes] CHECK CONSTRAINT [FK_ProjectTypeMatrixes_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeMatrixes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeMatrixes_ProjectMatrixTypes] FOREIGN KEY([ProjectMatrixTypeId])
REFERENCES [dbo].[ProjectMatrixTypes] ([ProjectMatrixTypeId])

ALTER TABLE [dbo].[ProjectTypeMatrixes] CHECK CONSTRAINT [FK_ProjectTypeMatrixes_ProjectMatrixTypes]

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeMatrixLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages] CHECK CONSTRAINT [FK_ProjectTypeMatrixLanguages_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeMatrixLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages] CHECK CONSTRAINT [FK_ProjectTypeMatrixLanguages_AspNetUsers1]

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeMatrixLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages] CHECK CONSTRAINT [FK_ProjectTypeMatrixLanguages_Languages]

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeMatrixLanguages_ProjectTypeMatrixes] FOREIGN KEY([ProjectTypeMatrixId])
REFERENCES [dbo].[ProjectTypeMatrixes] ([ProjectTypeMatrixID])

ALTER TABLE [dbo].[ProjectTypeMatrixLanguages] CHECK CONSTRAINT [FK_ProjectTypeMatrixLanguages_ProjectTypeMatrixes]

ALTER TABLE [dbo].[ProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeProperties_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeProperties] CHECK CONSTRAINT [FK_ProjectTypeProperties_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeProperties_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypeProperties] CHECK CONSTRAINT [FK_ProjectTypeProperties_AspNetUsers1]

ALTER TABLE [dbo].[ProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeProperties_ProjectTypes] FOREIGN KEY([ProjectTypeID])
REFERENCES [dbo].[ProjectTypes] ([ProjectTypeID])

ALTER TABLE [dbo].[ProjectTypeProperties] CHECK CONSTRAINT [FK_ProjectTypeProperties_ProjectTypes]

ALTER TABLE [dbo].[ProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeProperties_Properties] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])

ALTER TABLE [dbo].[ProjectTypeProperties] CHECK CONSTRAINT [FK_ProjectTypeProperties_Properties]

ALTER TABLE [dbo].[ProjectTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypeProperties_PropertyStatuses] FOREIGN KEY([ObjectTypePropertyStatusId])
REFERENCES [dbo].[ObjectTypePropertyStatuses] ([ObjectTypePropertyStatusID])

ALTER TABLE [dbo].[ProjectTypeProperties] CHECK CONSTRAINT [FK_ProjectTypeProperties_PropertyStatuses]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_AspNetUsers]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_AspNetUsers1]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_CodeTypes] FOREIGN KEY([CodeTypeId])
REFERENCES [dbo].[CodeTypes] ([CodeTypeID])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_CodeTypes]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_Icons] FOREIGN KEY([IconID])
REFERENCES [dbo].[Icons] ([IconId])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_Icons]

ALTER TABLE [dbo].[ProjectTypes]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTypes_ObjectTypeStatuses] FOREIGN KEY([ObjectTypeStatusId])
REFERENCES [dbo].[ObjectTypeStatuses] ([ObjectTypeStatusID])

ALTER TABLE [dbo].[ProjectTypes] CHECK CONSTRAINT [FK_ProjectTypes_ObjectTypeStatuses]

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

ALTER TABLE [dbo].[PropertyValueLanguages]  WITH CHECK ADD  CONSTRAINT [FK_PropertyValueLanguages_Languages2] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[PropertyValueLanguages] CHECK CONSTRAINT [FK_PropertyValueLanguages_Languages2]

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

ALTER TABLE [dbo].[ReadLogAddressTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeCRD_AddressTypes] FOREIGN KEY([RecordId])
REFERENCES [dbo].[AddressTypes] ([AddressTypeID])

ALTER TABLE [dbo].[ReadLogAddressTypeCUD] CHECK CONSTRAINT [FK_ReadLogAddressTypeCRD_AddressTypes]

ALTER TABLE [dbo].[ReadLogAddressTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogAddressTypeCUD] CHECK CONSTRAINT [FK_ReadLogAddressTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogAddressTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogAddressTypeCUD] CHECK CONSTRAINT [FK_ReadLogAddressTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogAddressTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogAddressTypeCUD] CHECK CONSTRAINT [FK_ReadLogAddressTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogAddressTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogAddressTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogAddressTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogAddressTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogAddressTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogAddressTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogAddressTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogAddressTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogAddressTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogAddressTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogAddressTypeList] CHECK CONSTRAINT [FK_ReadLogAddressTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogAddressTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAddressTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogAddressTypeList] CHECK CONSTRAINT [FK_ReadLogAddressTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogAdminList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAdminList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogAdminList] CHECK CONSTRAINT [FK_ReadLogAdminList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogAdminList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAdminList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogAdminList] CHECK CONSTRAINT [FK_ReadLogAdminList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogAspNetUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAspNetUserCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogAspNetUserCUD] CHECK CONSTRAINT [FK_ReadLogAspNetUserCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogAspNetUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAspNetUserCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogAspNetUserCUD] CHECK CONSTRAINT [FK_ReadLogAspNetUserCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogAspNetUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogAspNetUserCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogAspNetUserCUD] CHECK CONSTRAINT [FK_ReadLogAspNetUserCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationCUD] CHECK CONSTRAINT [FK_ReadLogClassificationCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationCRD_Classifications] FOREIGN KEY([RecordId])
REFERENCES [dbo].[Classifications] ([ClassificationID])

ALTER TABLE [dbo].[ReadLogClassificationCUD] CHECK CONSTRAINT [FK_ReadLogClassificationCRD_Classifications]

ALTER TABLE [dbo].[ReadLogClassificationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationCUD] CHECK CONSTRAINT [FK_ReadLogClassificationCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationCUD] CHECK CONSTRAINT [FK_ReadLogClassificationCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationLevelCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationLevelCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationLevelCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationLevelCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationLevelCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationLevelCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelLanguageCRD_ClassificationLevelLanguages] FOREIGN KEY([RecordId])
REFERENCES [dbo].[ClassificationLevelLanguages] ([ClassificationLevelLanguageID])

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelLanguageCRD_ClassificationLevelLanguages]

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationLevelLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationLevelList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationLevelList] CHECK CONSTRAINT [FK_ReadLogClassificationLevelList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationLevelList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationLevelList] CHECK CONSTRAINT [FK_ReadLogClassificationLevelList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelPropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelPropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelPropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelPropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelPropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyCUD] CHECK CONSTRAINT [FK_ReadLogClassificationLevelPropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelPropertyList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyList] CHECK CONSTRAINT [FK_ReadLogClassificationLevelPropertyList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationLevelPropertyList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationLevelPropertyList] CHECK CONSTRAINT [FK_ReadLogClassificationLevelPropertyList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationList] CHECK CONSTRAINT [FK_ReadLogClassificationList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationList] CHECK CONSTRAINT [FK_ReadLogClassificationList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeList] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRelationTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationRelationTypeList] CHECK CONSTRAINT [FK_ReadLogClassificationRelationTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationRoleCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRoleCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationRoleCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRoleCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationRoleCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRoleCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationRoleCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRoleCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationRoleCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRoleCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationRoleCUD] CHECK CONSTRAINT [FK_ReadLogClassificationRoleCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationRoleList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRoleList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationRoleList] CHECK CONSTRAINT [FK_ReadLogClassificationRoleList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationRoleList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationRoleList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationRoleList] CHECK CONSTRAINT [FK_ReadLogClassificationRoleList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationUserCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationUserCUD] CHECK CONSTRAINT [FK_ReadLogClassificationUserCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationUserCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationUserCUD] CHECK CONSTRAINT [FK_ReadLogClassificationUserCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationUserCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationUserCUD] CHECK CONSTRAINT [FK_ReadLogClassificationUserCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationUserList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationUserList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationUserList] CHECK CONSTRAINT [FK_ReadLogClassificationUserList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationUserList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationUserList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationUserList] CHECK CONSTRAINT [FK_ReadLogClassificationUserList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValueCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationValueCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValueCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValueLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValueLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValueLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationValueLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationValueLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValueLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValueList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValueList] CHECK CONSTRAINT [FK_ReadLogClassificationValueList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValueList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValueList] CHECK CONSTRAINT [FK_ReadLogClassificationValueList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyList] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValuePropertyList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValuePropertyList] CHECK CONSTRAINT [FK_ReadLogClassificationValuePropertyList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValueRoleCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueRoleCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValueRoleCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueRoleCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValueRoleCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueRoleCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationValueRoleCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueRoleCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationValueRoleCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueRoleCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValueRoleCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueRoleCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValueRoleList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueRoleList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValueRoleList] CHECK CONSTRAINT [FK_ReadLogClassificationValueRoleList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValueRoleList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueRoleList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValueRoleList] CHECK CONSTRAINT [FK_ReadLogClassificationValueRoleList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValueUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueUserCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValueUserCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueUserCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValueUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueUserCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogClassificationValueUserCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueUserCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogClassificationValueUserCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueUserCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValueUserCUD] CHECK CONSTRAINT [FK_ReadLogClassificationValueUserCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogClassificationValueUserList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueUserList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogClassificationValueUserList] CHECK CONSTRAINT [FK_ReadLogClassificationValueUserList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogClassificationValueUserList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogClassificationValueUserList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogClassificationValueUserList] CHECK CONSTRAINT [FK_ReadLogClassificationValueUserList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentClassificationValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentClassificationValueCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentClassificationValueCUD] CHECK CONSTRAINT [FK_ReadLogContentClassificationValueCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentClassificationValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentClassificationValueCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentClassificationValueCUD] CHECK CONSTRAINT [FK_ReadLogContentClassificationValueCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentClassificationValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentClassificationValueCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentClassificationValueCUD] CHECK CONSTRAINT [FK_ReadLogContentClassificationValueCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentCUD] CHECK CONSTRAINT [FK_ReadLogContentCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentCUD] CHECK CONSTRAINT [FK_ReadLogContentCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentCUD] CHECK CONSTRAINT [FK_ReadLogContentCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentPropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentPropertyCUD] CHECK CONSTRAINT [FK_ReadLogContentPropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentPropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentPropertyCUD] CHECK CONSTRAINT [FK_ReadLogContentPropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentPropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentPropertyCUD] CHECK CONSTRAINT [FK_ReadLogContentPropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentPropertyLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentPropertyLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentPropertyLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentPropertyLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentPropertyLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentPropertyLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypeClassificationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeClassificationCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypeClassificationCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeClassificationCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypeClassificationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeClassificationCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentTypeClassificationCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeClassificationCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentTypeClassificationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeClassificationCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypeClassificationCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeClassificationCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypeCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentTypeCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypeCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypeGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypeGroupCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypeGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentTypeGroupCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentTypeGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypeGroupCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypeGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypeGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypeGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentTypeGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentTypeGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypeGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypeGroupList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypeGroupList] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypeGroupList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeGroupList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypeGroupList] CHECK CONSTRAINT [FK_ReadLogContentTypeGroupList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogContentTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypeList] CHECK CONSTRAINT [FK_ReadLogContentTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypeList] CHECK CONSTRAINT [FK_ReadLogContentTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypePropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogContentTypePropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypePropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogContentTypePropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypePropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogContentTypePropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentTypePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypePropertyList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentTypePropertyList] CHECK CONSTRAINT [FK_ReadLogContentTypePropertyList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentTypePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentTypePropertyList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentTypePropertyList] CHECK CONSTRAINT [FK_ReadLogContentTypePropertyList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentUserEditCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentUserEditCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentUserEditCUD] CHECK CONSTRAINT [FK_ReadLogContentUserEditCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentUserEditCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentUserEditCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentUserEditCUD] CHECK CONSTRAINT [FK_ReadLogContentUserEditCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentUserEditCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentUserEditCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentUserEditCUD] CHECK CONSTRAINT [FK_ReadLogContentUserEditCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogContentUserReadCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentUserReadCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogContentUserReadCUD] CHECK CONSTRAINT [FK_ReadLogContentUserReadCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogContentUserReadCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentUserReadCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogContentUserReadCUD] CHECK CONSTRAINT [FK_ReadLogContentUserReadCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogContentUserReadCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogContentUserReadCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogContentUserReadCUD] CHECK CONSTRAINT [FK_ReadLogContentUserReadCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontList] CHECK CONSTRAINT [FK_ReadLogFrontList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontList] CHECK CONSTRAINT [FK_ReadLogFrontList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontOrganizationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontOrganizationList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontOrganizationList] CHECK CONSTRAINT [FK_ReadLogFrontOrganizationList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontOrganizationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontOrganizationList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontOrganizationList] CHECK CONSTRAINT [FK_ReadLogFrontOrganizationList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontProjectList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontProjectList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontProjectList] CHECK CONSTRAINT [FK_ReadLogFrontProjectList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontProjectList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontProjectList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontProjectList] CHECK CONSTRAINT [FK_ReadLogFrontProjectList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontUserFavoriteList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserFavoriteList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontUserFavoriteList] CHECK CONSTRAINT [FK_ReadLogFrontUserFavoriteList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontUserFavoriteList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserFavoriteList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontUserFavoriteList] CHECK CONSTRAINT [FK_ReadLogFrontUserFavoriteList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontUserMenuList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserMenuList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontUserMenuList] CHECK CONSTRAINT [FK_ReadLogFrontUserMenuList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontUserMenuList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserMenuList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontUserMenuList] CHECK CONSTRAINT [FK_ReadLogFrontUserMenuList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontUserPageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserPageList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontUserPageList] CHECK CONSTRAINT [FK_ReadLogFrontUserPageList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontUserPageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserPageList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontUserPageList] CHECK CONSTRAINT [FK_ReadLogFrontUserPageList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontUserPageSectionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserPageSectionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontUserPageSectionList] CHECK CONSTRAINT [FK_ReadLogFrontUserPageSectionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontUserPageSectionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserPageSectionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontUserPageSectionList] CHECK CONSTRAINT [FK_ReadLogFrontUserPageSectionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogFrontUserPreferenceList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserPreferenceList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogFrontUserPreferenceList] CHECK CONSTRAINT [FK_ReadLogFrontUserPreferenceList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogFrontUserPreferenceList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogFrontUserPreferenceList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogFrontUserPreferenceList] CHECK CONSTRAINT [FK_ReadLogFrontUserPreferenceList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogGenderCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogGenderCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogGenderCUD] CHECK CONSTRAINT [FK_ReadLogGenderCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogGenderCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogGenderCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogGenderCUD] CHECK CONSTRAINT [FK_ReadLogGenderCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogGenderCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogGenderCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogGenderCUD] CHECK CONSTRAINT [FK_ReadLogGenderCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogLanguageCUD] CHECK CONSTRAINT [FK_ReadLogLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogLanguageCUD] CHECK CONSTRAINT [FK_ReadLogLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogLanguageCUD] CHECK CONSTRAINT [FK_ReadLogLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogLanguageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogLanguageList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogLanguageList] CHECK CONSTRAINT [FK_ReadLogLanguageList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogLanguageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogLanguageList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogLanguageList] CHECK CONSTRAINT [FK_ReadLogLanguageList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMenu1CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu1CRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMenu1CUD] CHECK CONSTRAINT [FK_ReadLogMenu1CRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMenu1CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu1CUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMenu1CUD] CHECK CONSTRAINT [FK_ReadLogMenu1CUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMenu1CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu1CUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMenu1CUD] CHECK CONSTRAINT [FK_ReadLogMenu1CUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMenu1LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu1LanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMenu1LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu1LanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMenu1LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu1LanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMenu1LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu1LanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMenu1LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu1LanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMenu1LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu1LanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMenu2CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu2CRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMenu2CUD] CHECK CONSTRAINT [FK_ReadLogMenu2CRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMenu2CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu2CUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMenu2CUD] CHECK CONSTRAINT [FK_ReadLogMenu2CUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMenu2CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu2CUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMenu2CUD] CHECK CONSTRAINT [FK_ReadLogMenu2CUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMenu2LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu2LanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMenu2LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu2LanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMenu2LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu2LanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMenu2LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu2LanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMenu2LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu2LanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMenu2LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu2LanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMenu3CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu3CRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMenu3CUD] CHECK CONSTRAINT [FK_ReadLogMenu3CRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMenu3CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu3CUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMenu3CUD] CHECK CONSTRAINT [FK_ReadLogMenu3CUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMenu3CUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu3CUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMenu3CUD] CHECK CONSTRAINT [FK_ReadLogMenu3CUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMenu3LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu3LanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMenu3LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu3LanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMenu3LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu3LanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMenu3LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu3LanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMenu3LanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMenu3LanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMenu3LanguageCUD] CHECK CONSTRAINT [FK_ReadLogMenu3LanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMetaContentCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMetaContentCUD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMetaContentCUD] CHECK CONSTRAINT [FK_ReadLogMetaContentCUD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMetaContentCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMetaContentCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMetaContentCUD] CHECK CONSTRAINT [FK_ReadLogMetaContentCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMetaContentList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMetaContentList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMetaContentList] CHECK CONSTRAINT [FK_ReadLogMetaContentList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMetaContentList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMetaContentList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMetaContentList] CHECK CONSTRAINT [FK_ReadLogMetaContentList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMVCFavoriteCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCFavoriteCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMVCFavoriteCUD] CHECK CONSTRAINT [FK_ReadLogMVCFavoriteCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMVCFavoriteCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCFavoriteCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMVCFavoriteCUD] CHECK CONSTRAINT [FK_ReadLogMVCFavoriteCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMVCFavoriteCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCFavoriteCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMVCFavoriteCUD] CHECK CONSTRAINT [FK_ReadLogMVCFavoriteCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMVCFavoriteGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCFavoriteGroupCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMVCFavoriteGroupCUD] CHECK CONSTRAINT [FK_ReadLogMVCFavoriteGroupCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMVCFavoriteGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCFavoriteGroupCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogMVCFavoriteGroupCUD] CHECK CONSTRAINT [FK_ReadLogMVCFavoriteGroupCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogMVCFavoriteGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCFavoriteGroupCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMVCFavoriteGroupCUD] CHECK CONSTRAINT [FK_ReadLogMVCFavoriteGroupCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogMVCUIScreenList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCUIScreenList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogMVCUIScreenList] CHECK CONSTRAINT [FK_ReadLogMVCUIScreenList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogMVCUIScreenList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogMVCUIScreenList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogMVCUIScreenList] CHECK CONSTRAINT [FK_ReadLogMVCUIScreenList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageCUD] CHECK CONSTRAINT [FK_ReadLogPageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageCUD] CHECK CONSTRAINT [FK_ReadLogPageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageCUD] CHECK CONSTRAINT [FK_ReadLogPageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageList] CHECK CONSTRAINT [FK_ReadLogPageList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageList] CHECK CONSTRAINT [FK_ReadLogPageList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionClassificationValueConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionClassificationValueConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionList] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionContentConditionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionContentConditionList] CHECK CONSTRAINT [FK_ReadLogPageSectionContentConditionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionList] CHECK CONSTRAINT [FK_ReadLogPageSectionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionList] CHECK CONSTRAINT [FK_ReadLogPageSectionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionOrganizationConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionOrganizationConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionPersonConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionPersonConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionPersonConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionPersonConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionPersonConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionPersonConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionPersonConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionPersonConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionPersonConditionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionPersonConditionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionPersonConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionPersonConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionPersonConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionList] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProcessConditionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionProcessConditionList] CHECK CONSTRAINT [FK_ReadLogPageSectionProcessConditionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProjectConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProjectConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProjectConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProjectConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProjectConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProjectConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProjectConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProjectConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProjectConditionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProjectConditionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPageSectionProjectConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPageSectionProjectConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPageSectionProjectConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonAddressCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonAddressCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonAddressCUD] CHECK CONSTRAINT [FK_ReadLogPersonAddressCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonAddressCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonAddressCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonAddressCUD] CHECK CONSTRAINT [FK_ReadLogPersonAddressCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonAddressCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonAddressCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonAddressCUD] CHECK CONSTRAINT [FK_ReadLogPersonAddressCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonAddressList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonAddressList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonAddressList] CHECK CONSTRAINT [FK_ReadLogPersonAddressList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonAddressList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonAddressList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonAddressList] CHECK CONSTRAINT [FK_ReadLogPersonAddressList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonCUD] CHECK CONSTRAINT [FK_ReadLogPersonCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonCUD] CHECK CONSTRAINT [FK_ReadLogPersonCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonCUD] CHECK CONSTRAINT [FK_ReadLogPersonCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonList] CHECK CONSTRAINT [FK_ReadLogPersonList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonList] CHECK CONSTRAINT [FK_ReadLogPersonList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonPositionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPositionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonPositionList] CHECK CONSTRAINT [FK_ReadLogPersonPositionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonPositionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPositionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonPositionList] CHECK CONSTRAINT [FK_ReadLogPersonPositionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonPropertyCUD] CHECK CONSTRAINT [FK_ReadLogPersonPropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonPropertyCUD] CHECK CONSTRAINT [FK_ReadLogPersonPropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonPropertyCUD] CHECK CONSTRAINT [FK_ReadLogPersonPropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPropertyLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonPropertyLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPropertyLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonPropertyLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonPropertyLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonPropertyLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonRelationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonRelationCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonRelationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonRelationCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonRelationCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonRelationCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonRelationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonRelationList] CHECK CONSTRAINT [FK_ReadLogPersonRelationList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonRelationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonRelationList] CHECK CONSTRAINT [FK_ReadLogPersonRelationList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeList] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonRelationTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonRelationTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonRelationTypeList] CHECK CONSTRAINT [FK_ReadLogPersonRelationTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonTelecomCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTelecomCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonTelecomCUD] CHECK CONSTRAINT [FK_ReadLogPersonTelecomCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonTelecomCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTelecomCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonTelecomCUD] CHECK CONSTRAINT [FK_ReadLogPersonTelecomCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonTelecomCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTelecomCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonTelecomCUD] CHECK CONSTRAINT [FK_ReadLogPersonTelecomCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonTelecomList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTelecomList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonTelecomList] CHECK CONSTRAINT [FK_ReadLogPersonTelecomList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonTelecomList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTelecomList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonTelecomList] CHECK CONSTRAINT [FK_ReadLogPersonTelecomList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonTypeCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonTypeCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonTypeCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypePropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypePropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypePropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPersonTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypePropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPersonTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypePropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogPersonTypePropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPersonTypePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypePropertyList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPersonTypePropertyList] CHECK CONSTRAINT [FK_ReadLogPersonTypePropertyList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPersonTypePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPersonTypePropertyList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPersonTypePropertyList] CHECK CONSTRAINT [FK_ReadLogPersonTypePropertyList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPositionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPositionCUD] CHECK CONSTRAINT [FK_ReadLogPositionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPositionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPositionCUD] CHECK CONSTRAINT [FK_ReadLogPositionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPositionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPositionCUD] CHECK CONSTRAINT [FK_ReadLogPositionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPositionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPositionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPositionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPositionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPositionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPositionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPositionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPositionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPositionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPositionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPositionList] CHECK CONSTRAINT [FK_ReadLogPositionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPositionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPositionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPositionList] CHECK CONSTRAINT [FK_ReadLogPositionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessCUD] CHECK CONSTRAINT [FK_ReadLogProcessCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessCUD] CHECK CONSTRAINT [FK_ReadLogProcessCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessCUD] CHECK CONSTRAINT [FK_ReadLogProcessCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessFieldCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessFieldCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessFieldCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessFieldCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessFieldCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessFieldCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessMultiCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessMultiCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessMultiCUD] CHECK CONSTRAINT [FK_ReadLogProcessMultiCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessMultiCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessMultiCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessMultiCUD] CHECK CONSTRAINT [FK_ReadLogProcessMultiCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessMultiCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessMultiCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessMultiCUD] CHECK CONSTRAINT [FK_ReadLogProcessMultiCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldConditionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldConditionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldStageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldStageList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldStageList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldStageList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFieldStageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFieldStageList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFieldStageList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFieldStageList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowConditionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowConditionList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowConditionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeFlowPassList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeFlowPassList] CHECK CONSTRAINT [FK_ReadLogProcessTypeFlowPassList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupList] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeGroupList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeGroupList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeGroupList] CHECK CONSTRAINT [FK_ReadLogProcessTypeGroupList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeList] CHECK CONSTRAINT [FK_ReadLogProcessTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeList] CHECK CONSTRAINT [FK_ReadLogProcessTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeStageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeStageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageFieldCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageFieldCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageFieldSUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageFieldSUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageFieldU_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageFieldU_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageFieldList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldList] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageFieldList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageFieldList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageFieldList] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageFieldList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeStageLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeStageLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageList] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageList] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeList] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProcessTypeStageTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProcessTypeStageTypeList] CHECK CONSTRAINT [FK_ReadLogProcessTypeStageTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectCUD] CHECK CONSTRAINT [FK_ReadLogProjectCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProjectCUD] CHECK CONSTRAINT [FK_ReadLogProjectCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProjectCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectCUD] CHECK CONSTRAINT [FK_ReadLogProjectCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProjectLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProjectLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectList] CHECK CONSTRAINT [FK_ReadLogProjectList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectList] CHECK CONSTRAINT [FK_ReadLogProjectList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectMatrixTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectMatrixTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectMatrixTypeList] CHECK CONSTRAINT [FK_ReadLogProjectMatrixTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectMatrixTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectMatrixTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectMatrixTypeList] CHECK CONSTRAINT [FK_ReadLogProjectMatrixTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectPropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectPropertyCUD] CHECK CONSTRAINT [FK_ReadLogProjectPropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectPropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProjectPropertyCUD] CHECK CONSTRAINT [FK_ReadLogProjectPropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProjectPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectPropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectPropertyCUD] CHECK CONSTRAINT [FK_ReadLogProjectPropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectPropertyLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectPropertyLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectPropertyLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProjectPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectPropertyLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProjectPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectPropertyLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectPropertyLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectTypeClassificationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeClassificationList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectTypeClassificationList] CHECK CONSTRAINT [FK_ReadLogProjectTypeClassificationList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectTypeClassificationList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeClassificationList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectTypeClassificationList] CHECK CONSTRAINT [FK_ReadLogProjectTypeClassificationList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectTypeCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypeCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProjectTypeCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProjectTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectTypeCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypeCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypeLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProjectTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypeLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProjectTypeLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectTypeLanguageCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypeLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectTypeList] CHECK CONSTRAINT [FK_ReadLogProjectTypeList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectTypeList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypeList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectTypeList] CHECK CONSTRAINT [FK_ReadLogProjectTypeList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypePropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypePropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypePropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogProjectTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypePropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogProjectTypePropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypePropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectTypePropertyCUD] CHECK CONSTRAINT [FK_ReadLogProjectTypePropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogProjectTypePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypePropertyList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogProjectTypePropertyList] CHECK CONSTRAINT [FK_ReadLogProjectTypePropertyList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogProjectTypePropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogProjectTypePropertyList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogProjectTypePropertyList] CHECK CONSTRAINT [FK_ReadLogProjectTypePropertyList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPropertyCUD] CHECK CONSTRAINT [FK_ReadLogPropertyCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPropertyCUD] CHECK CONSTRAINT [FK_ReadLogPropertyCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPropertyCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPropertyCUD] CHECK CONSTRAINT [FK_ReadLogPropertyCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPropertyLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPropertyLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPropertyLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPropertyLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPropertyLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPropertyList] CHECK CONSTRAINT [FK_ReadLogPropertyList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPropertyList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPropertyList] CHECK CONSTRAINT [FK_ReadLogPropertyList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPropertyValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPropertyValueCUD] CHECK CONSTRAINT [FK_ReadLogPropertyValueCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPropertyValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPropertyValueCUD] CHECK CONSTRAINT [FK_ReadLogPropertyValueCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPropertyValueCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPropertyValueCUD] CHECK CONSTRAINT [FK_ReadLogPropertyValueCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPropertyValueLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPropertyValueLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPropertyValueLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPropertyValueLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogPropertyValueLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPropertyValueLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogPropertyValueLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPropertyValueLanguageCUD] CHECK CONSTRAINT [FK_ReadLogPropertyValueLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogPropertyValueList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogPropertyValueList] CHECK CONSTRAINT [FK_ReadLogPropertyValueList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogPropertyValueList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogPropertyValueList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogPropertyValueList] CHECK CONSTRAINT [FK_ReadLogPropertyValueList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogRoleClaimList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleClaimList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogRoleClaimList] CHECK CONSTRAINT [FK_ReadLogRoleClaimList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogRoleClaimList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleClaimList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogRoleClaimList] CHECK CONSTRAINT [FK_ReadLogRoleClaimList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogRoleGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogRoleGroupCUD] CHECK CONSTRAINT [FK_ReadLogRoleGroupCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogRoleGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogRoleGroupCUD] CHECK CONSTRAINT [FK_ReadLogRoleGroupCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogRoleGroupCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogRoleGroupCUD] CHECK CONSTRAINT [FK_ReadLogRoleGroupCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogRoleGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogRoleGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogRoleGroupLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogRoleGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogRoleGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogRoleGroupLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogRoleGroupLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogRoleGroupLanguageCUD] CHECK CONSTRAINT [FK_ReadLogRoleGroupLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogRoleGroupList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogRoleGroupList] CHECK CONSTRAINT [FK_ReadLogRoleGroupList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogRoleGroupList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleGroupList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogRoleGroupList] CHECK CONSTRAINT [FK_ReadLogRoleGroupList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogRoleLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleLanguageCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogRoleLanguageCUD] CHECK CONSTRAINT [FK_ReadLogRoleLanguageCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogRoleLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogRoleLanguageCUD] CHECK CONSTRAINT [FK_ReadLogRoleLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogRoleLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogRoleLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogRoleLanguageCUD] CHECK CONSTRAINT [FK_ReadLogRoleLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogSettingCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogSettingCRD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogSettingCUD] CHECK CONSTRAINT [FK_ReadLogSettingCRD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogSettingCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogSettingCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogSettingCUD] CHECK CONSTRAINT [FK_ReadLogSettingCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogSettingCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogSettingCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogSettingCUD] CHECK CONSTRAINT [FK_ReadLogSettingCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogSettingList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogSettingList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogSettingList] CHECK CONSTRAINT [FK_ReadLogSettingList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogSettingList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogSettingList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogSettingList] CHECK CONSTRAINT [FK_ReadLogSettingList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogTelecomTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogTelecomTypeCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogTelecomTypeCUD] CHECK CONSTRAINT [FK_ReadLogTelecomTypeCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogTelecomTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogTelecomTypeU_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogTelecomTypeCUD] CHECK CONSTRAINT [FK_ReadLogTelecomTypeU_AspNetUsers]

ALTER TABLE [dbo].[ReadLogTelecomTypeCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogTelecomTypeU_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogTelecomTypeCUD] CHECK CONSTRAINT [FK_ReadLogTelecomTypeU_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogTodoList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogTodoList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogTodoList] CHECK CONSTRAINT [FK_ReadLogTodoList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogTodoList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogTodoList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogTodoList] CHECK CONSTRAINT [FK_ReadLogTodoList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUITermList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUITermList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUITermList] CHECK CONSTRAINT [FK_ReadLogUITermList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUITermList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUITermList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUITermList] CHECK CONSTRAINT [FK_ReadLogUITermList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserList] CHECK CONSTRAINT [FK_ReadLogUserList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserList] CHECK CONSTRAINT [FK_ReadLogUserList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserMenuCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuCUD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserMenuCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuCUD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserMenuCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogUserMenuCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogUserMenuCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserMenuCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateCUD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateCUD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateLanguageCUD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateLanguageCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateLanguageCUD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateLanguageCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateLanguageCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateList] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateList] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionCUD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionCUD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionLanguageCUD_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionLanguageCUD_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionLanguageCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionLanguageCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionLanguageCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionLanguageCUD] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionLanguageCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionList_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionList] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionList_AspNetUsers]

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionList]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserMenuTemplateOptionList_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserMenuTemplateOptionList] CHECK CONSTRAINT [FK_ReadLogUserMenuTemplateOptionList_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserPreferenceCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserPreferenceCUD_DataDictionaryTables] FOREIGN KEY([TableId])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ReadLogUserPreferenceCUD] CHECK CONSTRAINT [FK_ReadLogUserPreferenceCUD_DataDictionaryTables]

ALTER TABLE [dbo].[ReadLogUserPreferenceCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserPreferenceCUD_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ReadLogUserPreferenceCUD] CHECK CONSTRAINT [FK_ReadLogUserPreferenceCUD_MVCUIScreens]

ALTER TABLE [dbo].[ReadLogUserPreferenceCUD]  WITH CHECK ADD  CONSTRAINT [FK_ReadLogUserPreferenceU_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[ReadLogUserPreferenceCUD] CHECK CONSTRAINT [FK_ReadLogUserPreferenceU_AspNetUsers]


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

ALTER TABLE [dbo].[RightTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[RightTypes] CHECK CONSTRAINT [FK_RightTypes_UITerms]

ALTER TABLE [dbo].[RightTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[RightTypes] CHECK CONSTRAINT [FK_RightTypes_UITerms1]

ALTER TABLE [dbo].[RightTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[RightTypes] CHECK CONSTRAINT [FK_RightTypes_UITerms2]

ALTER TABLE [dbo].[RightTypes]  WITH CHECK ADD  CONSTRAINT [FK_RightTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[RightTypes] CHECK CONSTRAINT [FK_RightTypes_UITerms3]

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

ALTER TABLE [dbo].[ScreenTables]  WITH CHECK ADD  CONSTRAINT [FK_ScreenTables_DataDictionaryTables] FOREIGN KEY([TableID])
REFERENCES [dbo].[DataDictionaryTables] ([TableId])

ALTER TABLE [dbo].[ScreenTables] CHECK CONSTRAINT [FK_ScreenTables_DataDictionaryTables]

ALTER TABLE [dbo].[ScreenTables]  WITH CHECK ADD  CONSTRAINT [FK_ScreenTables_MVCUIScreens] FOREIGN KEY([MVCUIScreenID])
REFERENCES [dbo].[MVCUIScreens] ([MVCUIScreenID])

ALTER TABLE [dbo].[ScreenTables] CHECK CONSTRAINT [FK_ScreenTables_MVCUIScreens]

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

ALTER TABLE [dbo].[UITermLanguageCustomizations]  WITH CHECK ADD  CONSTRAINT [FK_UITermLanguageCustomizations_AspNetUsers] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[UITermLanguageCustomizations] CHECK CONSTRAINT [FK_UITermLanguageCustomizations_AspNetUsers]

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

ALTER TABLE [dbo].[VersionStatuses]  WITH CHECK ADD  CONSTRAINT [FK_VersionStatuses_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[VersionStatuses] CHECK CONSTRAINT [FK_VersionStatuses_AspNetUsers]

ALTER TABLE [dbo].[VersionStatuses]  WITH CHECK ADD  CONSTRAINT [FK_VersionStatuses_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[VersionStatuses] CHECK CONSTRAINT [FK_VersionStatuses_AspNetUsers1]

ALTER TABLE [dbo].[VersionStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_VersionStatusLanguages_AspNetUsers] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[VersionStatusLanguages] CHECK CONSTRAINT [FK_VersionStatusLanguages_AspNetUsers]

ALTER TABLE [dbo].[VersionStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_VersionStatusLanguages_AspNetUsers1] FOREIGN KEY([ModifierID])
REFERENCES [dbo].[AspNetUsers] ([Id])

ALTER TABLE [dbo].[VersionStatusLanguages] CHECK CONSTRAINT [FK_VersionStatusLanguages_AspNetUsers1]

ALTER TABLE [dbo].[VersionStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_VersionStatusLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([LanguageID])

ALTER TABLE [dbo].[VersionStatusLanguages] CHECK CONSTRAINT [FK_VersionStatusLanguages_Languages]

ALTER TABLE [dbo].[VersionStatusLanguages]  WITH CHECK ADD  CONSTRAINT [FK_VersionStatusLanguages_VersionStatuses] FOREIGN KEY([VersionStatusId])
REFERENCES [dbo].[VersionStatuses] ([VersionStatusId])

ALTER TABLE [dbo].[VersionStatusLanguages] CHECK CONSTRAINT [FK_VersionStatusLanguages_VersionStatuses]

ALTER TABLE [dbo].[VersionTypes]  WITH CHECK ADD  CONSTRAINT [FK_VersionTypes_UITerms] FOREIGN KEY([NameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[VersionTypes] CHECK CONSTRAINT [FK_VersionTypes_UITerms]

ALTER TABLE [dbo].[VersionTypes]  WITH CHECK ADD  CONSTRAINT [FK_VersionTypes_UITerms1] FOREIGN KEY([DescriptionTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[VersionTypes] CHECK CONSTRAINT [FK_VersionTypes_UITerms1]

ALTER TABLE [dbo].[VersionTypes]  WITH CHECK ADD  CONSTRAINT [FK_VersionTypes_UITerms2] FOREIGN KEY([MenuNameTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[VersionTypes] CHECK CONSTRAINT [FK_VersionTypes_UITerms2]

ALTER TABLE [dbo].[VersionTypes]  WITH CHECK ADD  CONSTRAINT [FK_VersionTypes_UITerms3] FOREIGN KEY([MouseOverTermID])
REFERENCES [dbo].[UITerms] ([UITermID])

ALTER TABLE [dbo].[VersionTypes] CHECK CONSTRAINT [FK_VersionTypes_UITerms3]

