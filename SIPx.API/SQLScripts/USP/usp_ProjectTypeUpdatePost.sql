CREATE PROCEDURE [dbo].[usp_ProjectTypeUpdatePost] (
	@ProjectTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9) 
	, @IconId int 
	, @ModifierId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @ModifierID
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ProjectTypes SET 
	 Color = @Color
	, IconId = @IconId
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()
WHERE ProjectTypeId = @ProjectTypeID

UPDATE  ProjectTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE ProjectTypeId = @ProjectTypeID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


