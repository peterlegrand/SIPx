CREATE PROCEDURE [dbo].[usp_classificationPageSectionCreatePost] (
	@ClassificationPageId int
	, @ClassificationId int
	, @Sequence int
	, @PageSectionTypeId int
	, @PageSectionDataTypeId int
	, @ShowSectionTitleName bit
	, @ShowSectionTitleDescription bit
	, @ShowContentTypeTitleName bit
	, @ShowContentTypeTitleDescription bit
	, @OneTwoColumns bit
	, @ContentTypeId int
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

INSERT INTO ClassificationPageSections (
	ClassificationPageId
	, ClassificationId 
	, Sequence
	, PageSectionTypeID
	, PageSectionDataTypeID
	, ShowSectionTitleName
	, ShowSectionTitleDescription
	, ShowContentTypeTitleName
	, ShowContentTypeTitleDescription
	, OneTwoColumns 
	, ContentTypeId 
	, MaxContent 
	, HasPaging 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate) 
VALUES (
	@ClassificationPageId
	, @ClassificationId 
	, @Sequence
	, @PageSectionTypeID
	, @PageSectionDataTypeID
	, @ShowSectionTitleName
	, @ShowSectionTitleDescription
	, @ShowContentTypeTitleName
	, @ShowContentTypeTitleDescription
	, @OneTwoColumns 
	, @ContentTypeId 
	, @MaxContent 
	, @HasPaging 
	, @UserId  
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewClassificationPageSectionId int	= scope_identity();

INSERT INTO ClassificationPageSectionLanguages (
	ClassificationPageSectionID
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
	, @ClassificationId
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


