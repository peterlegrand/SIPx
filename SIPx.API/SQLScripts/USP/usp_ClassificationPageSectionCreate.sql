CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionCreate] (
	@ClassificationPageId int
	, @ClassificationId int
	, @Sequence int
	, @PageSectionTypeId int
	, @PageSectionDataTypeId int
	, @ShowSectionTitleName bit
	, @ShowSectionTitleDescription bit
	, @ShowContentTypeTitleName bit
	, @ShowContentTypeTitleDescription bit
	, @OneTwoColumns int
	, @ContentTypeId int
	, @SortById int
	, @MaxContent int
	, @HasPaging bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ClassificationPageSections SET Sequence = Sequence + 1 
WHERE ClassificationId = @ClassificationId 
	AND ClassificationPageId = @ClassificationPageId 
	AND Sequence >= @Sequence

INSERT INTO ClassificationPageSections (
	ClassificationPageID
	, ClassificationID
	, Sequence
	, PageSectionTypeID
	, PageSectionDataTypeID
	, ShowSectionTitleName
	, ShowSectionTitleDescription
	, ShowContentTypeTitleName
	, ShowContentTypeTitleDescription
	, OneTwoColumns
	, ContentTypeID
	, SortByID
	, MaxContent
	, HasPaging
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ClassificationPageID
	, @ClassificationID
	, @Sequence
	, @PageSectionTypeID
	, @PageSectionDataTypeID
	, @ShowSectionTitleName
	, @ShowSectionTitleDescription
	, @ShowContentTypeTitleName
	, @ShowContentTypeTitleDescription
	, @OneTwoColumns
	, @ContentTypeID
	, @SortByID
	, @MaxContent
	, @HasPaging
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewClassificationPageSectionId int	= scope_identity();

INSERT INTO ClassificationPageSectionLanguages (
	ClassificationPageSectionID
	, ClassificationPageID
	, ClassificationID
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
	@NewClassificationPageSectionId 
	, @ClassificationPageID
	, @ClassificationID
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