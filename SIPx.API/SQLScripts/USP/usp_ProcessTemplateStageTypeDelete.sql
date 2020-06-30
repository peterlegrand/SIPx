CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeDelete] (
	@ProcessTemplateStageTypeId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateStageTypeLanguages WHERE @ProcessTemplateStageTypeId = ProcessTemplateStageTypeID
DELETE FROM ProcessTemplateStageTypes WHERE @ProcessTemplateStageTypeId = ProcessTemplateStageTypeID
COMMIT TRANSACTION


