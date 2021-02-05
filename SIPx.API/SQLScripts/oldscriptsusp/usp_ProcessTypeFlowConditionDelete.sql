CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowConditionDelete] (
	@ProcessTypeFlowConditionId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTypeFlowConditionLanguages WHERE ProcessTypeFlowConditionId = @ProcessTypeFlowConditionID
DELETE FROM ProcessTypeFlowConditions WHERE ProcessTypeFlowConditionId = @ProcessTypeFlowConditionID
COMMIT TRANSACTION

