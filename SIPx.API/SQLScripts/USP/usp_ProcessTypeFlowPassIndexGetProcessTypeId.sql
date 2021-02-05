CREATE PROCEDURE usp_processTypeFlowPassIndexGetProcessTypeId (@ProcessTypeFlowId int)
AS
SELECT ProcessTypeId FROM ProcessTypeFlows WHERE ProcessTypeFlowId = @ProcessTypeFlowId