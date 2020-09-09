CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeUpdatePost] (
	@ProcessTemplateStageTypeId int
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
WHERE USerId = @ModifierId
	AND UserPreferences.PreferenceTypeId = 1 ;

BEGIN TRANSACTION

UPDATE ProcessTemplateStageTypes SET 
	 Color = @Color
	, IconId = @IconId
	, ModifierId = @ModifierId
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateStageTypeId = @ProcessTemplateStageTypeID

UPDATE  ProcessTemplateStageTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageTypeId = @ProcessTemplateStageTypeID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


