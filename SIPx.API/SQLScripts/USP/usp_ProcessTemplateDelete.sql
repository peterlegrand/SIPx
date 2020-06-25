CREATE PROCEDURE [dbo].[usp_ProcessTemplateDelete] (
	@ProcessTemplateID int) 
AS 
BEGIN TRANSACTION
DECLARE @Sequence int; 
DECLARE @ProcessTemplateGroupID int ;
SELECT @Sequence= Sequence, @ProcessTemplateGroupID = ProcessTemplateGroupID FROM ProcessTemplates WHERE ProcessTemplateID = @ProcessTemplateID ;
UPDATE ProcessTemplates SET Sequence = Sequence - 1 
WHERE ProcessTemplateGroupID = @ProcessTemplateGroupID
	AND Sequence > @Sequence

DELETE FROM ProcessTemplateLanguages WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateFlowConditionLanguages WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateFlowConditions WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateFlowLanguages WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateFlows WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateStageLanguages WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateStageFields WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateStages WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateFieldLanguages WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplateFields WHERE ProcessTemplateID = @ProcessTemplateID
DELETE FROM ProcessTemplates WHERE ProcessTemplateID = @ProcessTemplateID
COMMIT TRANSACTION



