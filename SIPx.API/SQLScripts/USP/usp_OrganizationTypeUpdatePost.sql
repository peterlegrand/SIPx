CREATE PROCEDURE [dbo].[usp_OrganizationTypeUpdatePost] (
	@OrganizationTypeId int
	, @Internal bit
	, @LegalEntity bit
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

UPDATE OrganizationTypes SET 
	Internal= @Internal
	, LegalEntity = @LegalEntity
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()
WHERE OrganizationTypeId = @OrganizationTypeID

UPDATE  OrganizationTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE OrganizationTypeID= @OrganizationTypeId
	AND LanguageID = @LanguageID
COMMIT TRANSACTION



