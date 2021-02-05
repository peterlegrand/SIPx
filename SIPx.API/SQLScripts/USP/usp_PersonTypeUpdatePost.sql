CREATE PROCEDURE usp_PersonTypeUpdatePost (
	@PersonTypeId int
	, @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @ModifierId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierId
	AND UserPreferences.PreferenceTypeId = 1 ;

UPDATE PersonTypes SET 
	 CodePrefix =@CodePrefix 
	, CodeSuffix =@CodeSuffix 
	, CodeTypeId =@CodeTypeId 
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()
WHERE PersonTypeId = @PersonTypeID

UPDATE  PersonTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE PersonTypeID= @PersonTypeId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION



