CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionDelete] (
	@ProcessTemplateFlowConditionId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionID
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowConditionId = @ProcessTemplateFlowConditionID
COMMIT TRANSACTION

