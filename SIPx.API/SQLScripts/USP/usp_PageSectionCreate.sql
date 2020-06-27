CREATE PROCEDURE [dbo].[usp_PageSectionCreate] (
	@PageID int
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
	, @UserID nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE PageSections SET Sequence = Sequence + 1 
WHERE PageID = @PageID 
	AND Sequence >= @Sequence

INSERT INTO PageSections (
	PageID
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
	@PageID
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