CREATE PROCEDURE FrontProcessCreatePostDefaultValues (@ProcessTypeFlowId int)
AS
SELECT ProcessTypeStageFields.ProcessTypeFieldID
	, ProcessTypeStageFields.ValueUpdateTypeID
	, StringValue
	, IntValue
	, DateTimeValue
FROM ProcessTypeStageFields
JOIN ProcessTypeFlows
	ON ProcessTypeStageFields.ProcessTypeStageID = ProcessTypeFlows.ProcessTypeFromStageID
WHERE ProcessTypeFlows.ProcessTypeFlowID = @ProcessTypeFlowId 