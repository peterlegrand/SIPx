CREATE PROCEDURE [dbo].[usp_ProcessTemplateStageTypeDeletePost] (
	@ProcessTemplateStageTypeId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateStageTypeLanguages WHERE @ProcessTemplateStageTypeId = ProcessTemplateStageTypeId
DELETE FROM ProcessTemplateStageTypes WHERE @ProcessTemplateStageTypeId = ProcessTemplateStageTypeId
COMMIT TRANSACTION