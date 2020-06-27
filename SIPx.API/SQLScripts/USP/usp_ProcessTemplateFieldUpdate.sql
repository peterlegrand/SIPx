CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldUpdate] (
	@ProcessTemplateFieldLanguageID int
	, @ProcessTemplateFieldID int
	, @ProcessTemplateFieldTypeID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 

UPDATE ProcessTemplateFields SET 
	ProcessTemplateFieldTypeID = @ProcessTemplateFieldTypeID
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFieldID = @ProcessTemplateFieldID

UPDATE  ProcessTemplateFieldLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFieldLanguageID= @ProcessTemplateFieldLanguageID

COMMIT TRANSACTION


