CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldUpdate] (
	@ProcessTypeFieldLanguageId int
	, @ProcessTypeFieldId int
	, @ProcessTypeFieldTypeId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

UPDATE ProcessTypeFields SET 
	ProcessTypeFieldTypeId = @ProcessTypeFieldTypeID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTypeFieldId = @ProcessTypeFieldID

UPDATE  ProcessTypeFieldLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeFieldLanguageID= @ProcessTypeFieldLanguageID

COMMIT TRANSACTION


