CREATE PROCEDURE [dbo].[usp_ClassificationPageCreate] (
	@ClassificationId int
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
BEGIN TRANSACTION

INSERT INTO ClassificationPages (
	ClassificationID
	, ShowTitleName
	, ShowTitleDescription
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@ClassificationID
	, @ShowTitleName
	, @ShowTitleDescription
	, @UserID
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
