CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowConditionDelete] (
	@ProcessTemplateFlowConditionID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowConditionID = @ProcessTemplateFlowConditionID
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowConditionID = @ProcessTemplateFlowConditionID
COMMIT TRANSACTION

