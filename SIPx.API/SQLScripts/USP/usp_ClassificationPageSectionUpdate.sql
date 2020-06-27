CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionUpdate] (
	@ClassificationPageSectionLanguageID int
	, @ClassificationPageSectionID int
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
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserID nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM ClassificationPageSections WHERE ClassificationPageSectionID = @ClassificationPageSectionID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE ClassificationPageSections SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE ClassificationPageSections SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE ClassificationPageSections SET 
	Sequence = @Sequence
	, PageSectionTypeID = @PageSectionTypeID
	, PageSectionDataTypeID = @PageSectionDataTypeID
	, ShowSectionTitleName = @ShowSectionTitleName
	, ShowSectionTitleDescription = @ShowSectionTitleDescription
	, ShowContentTypeTitleName = @ShowContentTypeTitleName
	, ShowContentTypeTitleDescription = @ShowContentTypeTitleDescription
	, OneTwoColumns = @OneTwoColumns 
	, ContentTypeID = @ContentTypeID 
	, SortByID = @SortByID
	, MaxContent = @MaxContent
	, HasPaging = @HasPaging 
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationPageSectionID = @ClassificationPageSectionID

UPDATE  ClassificationPageSectionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, TitleName = @TitleName
	, TitleDescription = @TitleDescription
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationPageSectionLanguageID= @ClassificationPageSectionLanguageID

COMMIT TRANSACTION