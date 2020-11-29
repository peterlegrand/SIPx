CREATE PROCEDURE [dbo].[usp_classificationPageCreatePost] (
	@ClassificationId int
	, @Status int
	, @ShowTitleName bit
	, @ShowTitleDescription bit
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ClassificationPages (
	ClassificationId 
	, StatusID 
	, ShowTitleName
	, ShowTitleDescription
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate) 
VALUES (
	@ClassificationId 
	, @Status
	, @ShowTitleName
	, @ShowTitleName
	, @UserId  
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewClassificationPageId int	= scope_identity();

INSERT INTO ClassificationPageLanguages (
	ClassificationPageID
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
	@NewClassificationPageId 
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


