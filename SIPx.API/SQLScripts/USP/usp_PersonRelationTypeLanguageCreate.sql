CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguageCreate] (
	@PersonRelationTypeID int
	, @LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
INSERT INTO PersonRelationTypeLanguages (PersonRelationTypeID, LanguageID, Name, Description, MenuName, MouseOver, FromIsAnXOfTo, ToIsAnXOfFrom, CreatorID, CreatedDate, ModifierID, ModifiedDate)
VALUES (@PersonRelationTypeID, @LanguageID, @Name, @Description, @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom, @UserID, getdate(), @UserID, getdate())


