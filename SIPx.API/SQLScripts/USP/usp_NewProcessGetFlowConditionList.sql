CREATE PROCEDURE usp_NewProcessGetFlowConditionList (@ProcessTemplateFlowId int) 
AS
SELECT ProcessTemplateFlowConditions.ProcessTemplateFlowId
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionId
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionTypeID
	, ProcessTemplateFlowConditions.ProcessTemplateFieldID
	, ProcessTemplateFlowConditions.ProcessTemplateFieldIDRole
	, ProcessTemplateFlowConditions.ComparisonOperatorID
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionString
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionInt
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionDate
	, ISNULL(stagefields.IntValue, 0) StageFieldIntValue
	, ISNULL(stagefields.StringValue, '') StageFieldStringValue
	, ISNULL(stagefields.DateTimeValue, getdate()) StageFieldDateTimeValue
FROM ProcessTemplateFlowConditions 
JOIN ProcessTemplateFlows 
	ON ProcessTemplateFlowConditions.ProcessTemplateFlowID = ProcessTemplateFlows.ProcessTemplateFlowID 
LEFT JOIN (SELECT ProcessTemplateStageFields.ProcessTemplateFieldID, ProcessTemplateStageFields.ProcessTemplateStageID, IntValue, StringValue, DateTimeValue FROM ProcessTemplateStageFields) StageFields
	ON StageFields.ProcessTemplateFieldID = ProcessTemplateFlowConditions.ProcessTemplateFieldID 
		AND StageFields.ProcessTemplateStageID = ProcessTemplateFlows.ProcessTemplateFromStageID 
WHERE ProcessTemplateFlowConditions.ProcessTemplateFlowId = @ProcessTemplateFlowId
ORDER BY Sequence

