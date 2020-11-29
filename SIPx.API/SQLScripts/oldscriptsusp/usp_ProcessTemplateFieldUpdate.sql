CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldUpdate] (
	@ProcessTemplateFieldLanguageId int
	, @ProcessTemplateFieldId int
	, @ProcessTemplateFieldTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

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
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFieldLanguageID= @ProcessTemplateFieldLanguageID

COMMIT TRANSACTION


