CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowUpdatePost] (
	@ProcessTypeFlowId int
	, @ProcessTypeFromStageId int
	, @ProcessTypeToStageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
WHERE ProcessTypeFlowID= @ProcessTypeFlowID
	AND LanguageID = @LanguageId

COMMIT TRANSACTION


