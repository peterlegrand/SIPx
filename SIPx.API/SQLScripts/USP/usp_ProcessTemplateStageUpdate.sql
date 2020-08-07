CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageUpdate] (
	@ProcessTemplateStageId int
	, @ProcessTemplateStageLanguageId int
	, @ProcessTemplateStageTypeId int
	, @InToDo bit
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION

UPDATE ProcessTemplateStages SET
	ProcessTemplateStageTypeId = @ProcessTemplateStageTypeId 
	, InToDo = @InToDo
	, ModifierId = @UserID
	, ModifiedDate = Getdate()
WHERE ProcessTemplateStageId = @ProcessTemplateStageId 

UPDATE  ProcessTemplateStageLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateStageLanguageID= @ProcessTemplateStageLanguageID
	COMMIT TRANSACTION
