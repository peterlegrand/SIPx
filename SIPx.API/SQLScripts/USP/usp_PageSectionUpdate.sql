CREATE PROCEDURE [dbo].[usp_PageSectionUpdate] (
	@PageSectionLanguageId int
	, @PageSectionId int
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
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM PageSections WHERE PageSectionId = @PageSectionID;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE PageSections SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence
END
ELSE
BEGIN
UPDATE PageSections SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence
END

UPDATE PageSections SET 
	Sequence = @Sequence
	, PageSectionTypeId = @PageSectionTypeID
	, PageSectionDataTypeId = @PageSectionDataTypeID
	, ShowSectionTitleName = @ShowSectionTitleName
	, ShowSectionTitleDescription = @ShowSectionTitleDescription
	, ShowContentTypeTitleName = @ShowContentTypeTitleName
	, ShowContentTypeTitleDescription = @ShowContentTypeTitleDescription
	, OneTwoColumns = @OneTwoColumns 
	, ContentTypeId = @ContentTypeId 
	, SortById = @SortByID
	, MaxContent = @MaxContent
	, HasPaging = @HasPaging 
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE PageSectionId = @PageSectionID

UPDATE  PageSectionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, TitleName = @TitleName
	, TitleDescription = @TitleDescription
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE PageSectionLanguageID= @PageSectionLanguageID

COMMIT TRANSACTION