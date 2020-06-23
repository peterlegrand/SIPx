CREATE PROCEDURE [dbo].[usp_ClassificationPageCreate] (
	@ClassificationID int
	, @ShowTitleName bit
	, @ShowTitleDescription bit
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
	, @User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION
