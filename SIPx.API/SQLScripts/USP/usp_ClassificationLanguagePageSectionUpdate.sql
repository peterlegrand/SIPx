CREATE PROCEDURE [dbo].[usp_ClassificationLanguagePageSectionUpdate] (
	@ClassificationPageSectionLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @TitleName nvarchar(50)
	, @TitleDescription nvarchar(max)
	, @User nvarchar(450)) 
AS 
UPDATE  ClassificationPageSectionLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, TitleName = @TitleName
	, TitleDescription = @TitleDescription
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ClassificationPageSectionLanguageID= @ClassificationPageSectionLanguageID
