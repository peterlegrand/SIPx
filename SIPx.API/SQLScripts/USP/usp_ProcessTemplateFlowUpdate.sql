CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowUpdate] (
	@ProcessTemplateFlowLanguageId int
	, @ProcessTemplateFlowId int
	, @ProcessTemplateFromStageId int
	, @ProcessTemplateToStageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

UPDATE ProcessTemplateFlows SET 
	ProcessTemplateFromStageId = @ProcessTemplateFromStageID
	, ProcessTemplateToStageId = @ProcessTemplateToStageID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFlowId = @ProcessTemplateFlowID

UPDATE  ProcessTemplateFlowLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowLanguageID= @ProcessTemplateFlowLanguageID

COMMIT TRANSACTION


