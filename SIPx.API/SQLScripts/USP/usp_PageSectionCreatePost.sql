CREATE PROCEDURE [dbo].[usp_PageSectionCreatePost] (
	@PageId int
	, @PageSectionTypeId int
	, @PageSectionDataTypeId int
	, @ShowSectionTitleName bit
	, @ShowSectionTitleDescription bit
	, @ShowContentTypeTitleName bit
	, @ShowContentTypeTitleDescription bit
	, @SizeX int
	, @SizeY int
	, @DashboardRow int
	, @DashboardColumn int
	, @ContentTypeId int
	, @SortById int
	, @MaxContent int
	, @HasPaging bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION

INSERT INTO PageSections (
	PageID
	, PageSectionTypeID
	, PageSectionDataTypeID
	, ShowSectionTitleName
	, ShowSectionTitleDescription
	, ShowContentTypeTitleName
	, ShowContentTypeTitleDescription
	, SizeX
	, SizeY 
	, DashboardRow 
	, DashboardColumn 
	, ContentTypeID
	, SortByID
	, MaxContent
	, HasPaging
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@PageID
	, @PageSectionTypeID
	, @PageSectionDataTypeID
	, @ShowSectionTitleName
	, @ShowSectionTitleDescription
	, @ShowContentTypeTitleName
	, @ShowContentTypeTitleDescription
	, @SizeX
	, @SizeY 
	, @DashboardRow 
	, @DashboardColumn 
	, @ContentTypeID
	, @SortByID
	, @MaxContent
	, @HasPaging
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPageSectionId int	= scope_identity();

INSERT INTO PageSectionLanguages (
	PageSectionID
	, PageID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, TitleName
	, TitleDescription
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewPageSectionId 
	, @PageID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @TitleName
	, @TitleDescription
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION