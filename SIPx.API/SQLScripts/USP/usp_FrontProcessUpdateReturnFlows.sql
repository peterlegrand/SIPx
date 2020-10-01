CREATE PROCEDURE usp_FrontProcessUpdateReturnFlows (
	@ProcessTemplateStageId int
	)
AS
SELECT ProcessTemplateFlowID 
FROM ProcessTemplateFlows 
WHERE ProcessTemplateFlows.ProcessTemplateFromStageID = @ProcessTemplateStageId 
;

