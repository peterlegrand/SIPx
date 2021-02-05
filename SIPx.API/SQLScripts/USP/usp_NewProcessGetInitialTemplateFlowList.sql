CREATE PROCEDURE usp_NewProcessGetInitialTemplateFlowList 
AS
SELECT DISTINCT  ProcessTypeId , ProcessTypeFlows.ProcessTypeFlowId
FROM ProcessTypeFlows 
WHERE ProcessTypeFlows.ProcessTypeFromStageId NOT IN (SELECT DISTINCT ProcessTypeFlows.ProcessTypeToStageId FROM ProcessTypeFlows)
