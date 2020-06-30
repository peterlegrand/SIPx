CREATE PROCEDURE [dbo].[usp_ProcessTemplateFlowDelete] (
	@ProcessTemplateFlowId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateFlowId = @ProcessTemplateFlowID
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateFlowId = @ProcessTemplateFlowID
DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateFlowId = @ProcessTemplateFlowID
DELETE FROM ProcessTemplateFlows WHERE ProcessTemplateFlowId = @ProcessTemplateFlowID
COMMIT TRANSACTION

