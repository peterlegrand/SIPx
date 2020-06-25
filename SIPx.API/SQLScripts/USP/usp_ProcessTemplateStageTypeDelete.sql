CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeDelete] (
	@ProcessTemplateStageTypeID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateStageTypeLanguages WHERE @ProcessTemplateStageTypeID = ProcessTemplateStageTypeID
DELETE FROM ProcessTemplateStageTypes WHERE @ProcessTemplateStageTypeID = ProcessTemplateStageTypeID
COMMIT TRANSACTION
GO


