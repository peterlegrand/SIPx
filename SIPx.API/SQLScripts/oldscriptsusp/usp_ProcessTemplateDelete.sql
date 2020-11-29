CREATE PROCEDURE [dbo].[usp_ProcessTemplateDelete] (
	@ProcessTemplateId int) 
AS 
BEGIN TRANSACTION
DECLARE @Sequence int; 
DECLARE @ProcessTemplateGroupId int ;
SELECT @Sequence= Sequence, @ProcessTemplateGroupId = ProcessTemplateGroupId FROM ProcessTemplates WHERE ProcessTemplateId = @ProcessTemplateId ;
UPDATE ProcessTemplates SET Sequence = Sequence - 1 
WHERE ProcessTemplateGroupId = @ProcessTemplateGroupID
	AND Sequence > @Sequence

DELETE FROM ProcessTemplateLanguages WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateFlows WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateStageFields WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateStages WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplateFields WHERE ProcessTemplateId = @ProcessTemplateID
DELETE FROM ProcessTemplates WHERE ProcessTemplateId = @ProcessTemplateID
COMMIT TRANSACTION



