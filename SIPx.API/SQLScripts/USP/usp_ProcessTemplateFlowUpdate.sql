CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowUpdate] (
	@ProcessTemplateFlowLanguageID int
	, @ProcessTemplateFlowID int
	, @ProcessTemplateFromStageID int
	, @ProcessTemplateToStageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @User nvarchar(450)) 
AS 

UPDATE ProcessTemplateFlows SET 
	ProcessTemplateFromStageID = @ProcessTemplateFromStageID
	, ProcessTemplateToStageID = @ProcessTemplateToStageID
	, ModifierID = @User
	, ModifiedDate = GETDATE()
WHERE ProcessTemplateFlowID = @ProcessTemplateFlowID

UPDATE  ProcessTemplateFlowLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE ProcessTemplateFlowLanguageID= @ProcessTemplateFlowLanguageID

COMMIT TRANSACTION

