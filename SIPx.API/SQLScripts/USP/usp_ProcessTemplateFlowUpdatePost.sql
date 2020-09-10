CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowUpdatePost] (
	@ProcessTemplateFlowId int
	, @ProcessTemplateFromStageId int
	, @ProcessTemplateToStageId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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
WHERE ProcessTemplateFlowID= @ProcessTemplateFlowID
	AND LanguageID = @LanguageId

COMMIT TRANSACTION


