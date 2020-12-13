CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldUpdatePost] (
	 @ProcessTemplateFieldId int
	, @ProcessTemplateFieldTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @MissingValueText nvarchar(max)
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SET XACT_ABORT ON;
BEGIN TRANSACTION
UPDATE ProcessTemplateFields SET 
	ProcessTemplateFieldTypeId = @ProcessTemplateFieldTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFieldId = @ProcessTemplateFieldID

UPDATE  ProcessTemplateFieldLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, MissingValueText = @MissingValueText
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFieldID= @ProcessTemplateFieldID
	AND LanguageID = @LanguageId
COMMIT TRANSACTION


