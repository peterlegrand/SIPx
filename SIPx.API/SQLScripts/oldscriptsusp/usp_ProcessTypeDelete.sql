CREATE PROCEDURE [dbo].[usp_ProcessTypeDelete] (
	@ProcessTypeId int) 
AS 
BEGIN TRANSACTION
DECLARE @Sequence int; 
DECLARE @ProcessTypeGroupId int ;
SELECT @Sequence= Sequence, @ProcessTypeGroupId = ProcessTypeGroupId FROM ProcessTypes WHERE ProcessTypeId = @ProcessTypeId ;
UPDATE ProcessTypes SET Sequence = Sequence - 1 
WHERE ProcessTypeGroupId = @ProcessTypeGroupID
	AND Sequence > @Sequence

DELETE FROM ProcessTypeLanguages WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeFlowConditionLanguages WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeFlowConditions WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeFlowLanguages WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeFlows WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeStageLanguages WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeStageFields WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeStages WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeFieldLanguages WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypeFields WHERE ProcessTypeId = @ProcessTypeID
DELETE FROM ProcessTypes WHERE ProcessTypeId = @ProcessTypeID
COMMIT TRANSACTION



