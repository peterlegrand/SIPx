CREATE PROCEDURE [dbo].[usp_PageSectionUpdatePost] (
	 @PageSectionId int
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
	, @ModifierId nvarchar(450)) 
AS 

SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierId
	AND UserPreferences.PreferenceTypeId = 1 ;
UPDATE PageSections SET 
	PageSectionTypeId = @PageSectionTypeID
	, PageSectionDataTypeId = @PageSectionDataTypeID
	, ShowSectionTitleName = @ShowSectionTitleName
	, ShowSectionTitleDescription = @ShowSectionTitleDescription
	, ShowContentTypeTitleName = @ShowContentTypeTitleName
	, ShowContentTypeTitleDescription = @ShowContentTypeTitleDescription
	, SizeX = @SizeX
	, SizeY = @SizeY 
	, DashboardRow = @DashboardRow 
	, DashboardColumn = @DashboardColumn 
	, ContentTypeId = @ContentTypeId 
	, SortById = @SortByID
	, MaxContent = @MaxContent
	, HasPaging = @HasPaging 
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()
WHERE PageSectionId = @PageSectionID

UPDATE  PageSectionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, TitleName = @TitleName
	, TitleDescription = @TitleDescription
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE PageSectionID= @PageSectionId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION