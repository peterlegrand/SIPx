CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionCreate] (
	@ClassificationPageID int
	, @ClassificationID int
	, @Sequence int
	, @PageSectionTypeID int
	, @PageSectionDataTypeID int
	, @ShowSectionTitleName bit
	, @ShowSectionTitleDescription bit
	, @ShowContentTypeTitleName bit
	, @ShowContentTypeTitleDescription bit
	, @OneTwoColumns int
	, @ContentTypeID int
	, @SortByID int
	, @MaxContent int
	, @HasPaging bit
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ClassificationPageSections SET Sequence = Sequence + 1 
WHERE ClassificationID = @ClassificationID 
	AND ClassificationPageID = @ClassificationPageID 
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
	, @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION