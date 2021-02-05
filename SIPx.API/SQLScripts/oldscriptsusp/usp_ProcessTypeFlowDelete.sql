CREATE PROCEDURE [dbo].[usp_ProcessTypeFlowDelete] (
	@ProcessTypeFlowId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ProcessTypeFlowConditionLanguages WHERE ProcessTypeFlowId = @ProcessTypeFlowID
DELETE FROM ProcessTypeFlowConditions WHERE ProcessTypeFlowId = @ProcessTypeFlowID
DELETE FROM ProcessTypeFlowLanguages WHERE ProcessTypeFlowId = @ProcessTypeFlowID
DELETE FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowID
COMMIT TRANSACTION

