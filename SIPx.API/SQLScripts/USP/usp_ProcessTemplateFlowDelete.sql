CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowDelete] (
	@ProcessTemplateFlowID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowID = @ProcessTemplateFlowID
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowID = @ProcessTemplateFlowID
DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateFlowID = @ProcessTemplateFlowID
DELETE FROM ProcessTemplateFlows WHERE ProcessTemplateFlowID = @ProcessTemplateFlowID
COMMIT TRANSACTION

