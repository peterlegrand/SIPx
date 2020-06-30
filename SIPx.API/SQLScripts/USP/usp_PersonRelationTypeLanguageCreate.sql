CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguageCreate] (
	@PersonRelationTypeId int
	, @LanguageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
INSERT INTO PersonRelationTypeLanguages (PersonRelationTypeId, LanguageId, Name, Description, MenuName, MouseOver, FromIsAnXOfTo, ToIsAnXOfFrom, CreatorId, CreatedDate, ModifierId, ModifiedDate)
VALUES (@PersonRelationTypeId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom, @UserId, getdate(), @UserId, getdate())


