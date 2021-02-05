CREATE PROCEDURE usp_FrontProcessUpdateReturnFlows (
	@ProcessTypeStageId int
	)
AS
SELECT ProcessTypeFlowID 
FROM ProcessTypeFlows 
WHERE ProcessTypeFlows.ProcessTypeFromStageID = @ProcessTypeStageId 
;

