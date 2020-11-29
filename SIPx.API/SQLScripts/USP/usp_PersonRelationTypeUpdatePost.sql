CREATE PROCEDURE [dbo].[usp_PersonRelationTypeUpdatePost] (
	 @PersonRelationTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @SeePersonal bit
	, @Color char(9)
	, @IconId int
	, @ModifierId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierId
	AND UserPreferences.PreferenceTypeId = 1 ;

UPDATE PersonRelationTypes
SET Color = @Color
	, SeePersonal = @SeePersonal
	, IconID = @IconId
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()



UPDATE PersonRelationTypeLanguages
SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, FromIsAnXOfTo = @FromIsAnXOfTo 
	, ToIsAnXOfFrom = @ToIsAnXOfFrom 
	, ModifierId  = @ModifierId  
WHERE PersonRelationTypeId = @PersonRelationTypeId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION