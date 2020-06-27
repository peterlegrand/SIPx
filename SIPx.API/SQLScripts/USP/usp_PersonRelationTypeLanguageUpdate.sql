CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguageUpdate] (
	@PersonRelationTypeLanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
UPDATE  PersonRelationTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, FromIsAnXOfTo = @FromIsAnXOfTo
	, ToIsAnXOfFrom = @ToIsAnXOfFrom
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE PersonRelationTypeLanguageID= @PersonRelationTypeLanguageID



