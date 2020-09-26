CREATE PROCEDURE usp_FrontProcessNewReturnFlows (
	@ProcessTemplateId int
	)
AS
SELECT ProcessTemplateFlowID 
FROM ProcessTemplateFlows 
WHERE ProcessTemplateFlows.ProcessTemplateID = @ProcessTemplateId 
	AND ProcessTemplateFlows.ProcessTemplateFromStageID NOT IN (
		SELECT ProcessTemplateToStageID 
		FROM ProcessTemplateFlows 
		WHERE ProcessTemplateFlows.ProcessTemplateID = @ProcessTemplateId
	);

