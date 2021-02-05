CREATE PROCEDURE usp_FrontProcessNewReturnFlows (
	@ProcessTypeId int
	)
AS
SELECT ProcessTypeFlowID 
FROM ProcessTypeFlows 
WHERE ProcessTypeFlows.ProcessTypeID = @ProcessTypeId 
	AND ProcessTypeFlows.ProcessTypeFromStageID NOT IN (
		SELECT ProcessTypeToStageID 
		FROM ProcessTypeFlows 
		WHERE ProcessTypeFlows.ProcessTypeID = @ProcessTypeId
	);

