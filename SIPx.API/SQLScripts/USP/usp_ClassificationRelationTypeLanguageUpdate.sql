CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeLanguageUpdate] (
	@ClassificationRelationTypeLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 
UPDATE  ClassificationRelationTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ClassificationRelationTypeLanguageID= @ClassificationRelationTypeLanguageID
