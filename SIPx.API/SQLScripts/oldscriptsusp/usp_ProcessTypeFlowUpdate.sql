CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowUpdate] (
	@ProcessTypeFlowLanguageId int
	, @ProcessTypeFlowId int
	, @ProcessTypeFromStageId int
	, @ProcessTypeToStageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

UPDATE ProcessTypeFlows SET 
	ProcessTypeFromStageId = @ProcessTypeFromStageID
	, ProcessTypeToStageId = @ProcessTypeToStageID
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ProcessTypeFlowId = @ProcessTypeFlowID

UPDATE  ProcessTypeFlowLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ProcessTypeFlowLanguageID= @ProcessTypeFlowLanguageID

COMMIT TRANSACTION


