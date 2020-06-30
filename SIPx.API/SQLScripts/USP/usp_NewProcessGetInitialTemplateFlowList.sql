CREATE PROCEDURE usp_NewProcessGetInitialTemplateFlowList 
AS
SELECT DISTINCT ProcessTemplateFlows.ProcessTemplateFlowId 
FROM ProcessTemplateFlows 
WHERE ProcessTemplateFlows.ProcessTemplateFromStageId NOT IN (SELECT DISTINCT ProcessTemplateFlows.ProcessTemplateToStageId FROM ProcessTemplateFlows)
