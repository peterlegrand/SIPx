CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguageUpdate] (
	@PersonRelationTypeLanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
UPDATE  PersonRelationTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, FromIsAnXOfTo = @FromIsAnXOfTo
	, ToIsAnXOfFrom = @ToIsAnXOfFrom
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE PersonRelationTypeLanguageID= @PersonRelationTypeLanguageID



