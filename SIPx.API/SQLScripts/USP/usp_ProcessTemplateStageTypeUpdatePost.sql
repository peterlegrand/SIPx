CREATE PROCEDURE usp_ProcessTemplateStageTypeUpdatePost (
	@ProcessTemplateStageTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9) 
	, @IconId int 
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE ProcessTemplateStageTypes SET 
	 Color = @Color
	, IconId = @IconId
	, ModifierId = @UserId
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateStageTypeId = @ProcessTemplateStageTypeID

UPDATE  ProcessTemplateStageTypeLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserId
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageTypeId = @ProcessTemplateStageTypeID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


