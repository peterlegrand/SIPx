CREATE PROCEDURE usp_NewProcessGetFlowConditionList (@ProcessTypeFlowId int) 
AS
SELECT ProcessTypeFlowConditions.ProcessTypeFlowId
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionId
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionTypeID
	, ProcessTypeFlowConditions.ProcessTypeFieldID
	, ProcessTypeFlowConditions.ProcessTypeFieldIDRole
	, ProcessTypeFlowConditions.ComparisonOperatorID
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionString
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionInt
	, ProcessTypeFlowConditions.ProcessTypeFlowConditionDate
	, ISNULL(stagefields.IntValue, 0) StageFieldIntValue
	, ISNULL(stagefields.StringValue, '') StageFieldStringValue
	, ISNULL(stagefields.DateTimeValue, getdate()) StageFieldDateTimeValue
FROM ProcessTypeFlowConditions 
JOIN ProcessTypeFlows 
	ON ProcessTypeFlowConditions.ProcessTypeFlowID = ProcessTypeFlows.ProcessTypeFlowID 
LEFT JOIN (SELECT ProcessTypeStageFields.ProcessTypeFieldID, ProcessTypeStageFields.ProcessTypeStageID, IntValue, StringValue, DateTimeValue FROM ProcessTypeStageFields) StageFields
	ON StageFields.ProcessTypeFieldID = ProcessTypeFlowConditions.ProcessTypeFieldID 
		AND StageFields.ProcessTypeStageID = ProcessTypeFlows.ProcessTypeFromStageID 
WHERE ProcessTypeFlowConditions.ProcessTypeFlowId = @ProcessTypeFlowId
ORDER BY Sequence

