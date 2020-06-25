CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldUpdate] (
	@ProcessTemplateFieldLanguageID int
	, @ProcessTemplateFieldID int
	, @ProcessTemplateFieldTypeID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 

UPDATE ProcessTemplateFields SET 
	ProcessTemplateFieldTypeID = @ProcessTemplateFieldTypeID
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFieldID = @ProcessTemplateFieldID

UPDATE  ProcessTemplateFieldLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ProcessTemplateFieldLanguageID= @ProcessTemplateFieldLanguageID

COMMIT TRANSACTION


