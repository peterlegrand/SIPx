CREATE PROCEDURE usp_PropertyUpdatePost (
	@PropertyId int
	, @PropertyTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

UPDATE Properties SET 
	PropertyTypeId = @PropertyTypeId
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE PropertyId = @PropertyID

UPDATE  PropertyLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE PropertyId = @PropertyID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


