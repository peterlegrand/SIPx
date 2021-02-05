CREATE PROCEDURE usp_FrontProcessNewReturnFlowPasses (
	@ProcessTypeFlowId int
	)
AS
SELECT 
	ProcessTypeFlowPasses.ProcessTypeFlowPassTypeId 
	, ProcessTypeFlowPasses.ProcessTypeFieldId 
	, ProcessTypeFlowPasses.ProcessTypeFieldIDRole 
	, ProcessTypeFlowPasses.ComparisonOperatorID 
	, ProcessTypeFlowPasses.ProcessTypeFlowPassString 
	, ProcessTypeFlowPasses.ProcessTypeFlowPassInt 
	, ProcessTypeFlowPasses.ProcessTypeFlowPassDate 
	, ISNULL(TemplateFields.ProcessTypeFieldTypeID ,0) ProcessTypeFieldTypeID 
	, ISNULL(stagefields.IntValue, 0) StageFieldIntValue
	, ISNULL(stagefields.StringValue, '') StageFieldStringValue
	, ISNULL(stagefields.DateTimeValue, getdate()) StageFieldDateTimeValue
FROM ProcessTypeFlowPasses 
LEFT JOIN(
	SELECT 
		ProcessTypeFields.ProcessTypeFieldId
		, ProcessTypeFields.ProcessTypeFieldTypeID FROM ProcessTypeFields) TemplateFields
	ON TemplateFields.ProcessTypeFieldID = ProcessTypeFlowPasses.ProcessTypeFieldID 
JOIN ProcessTypeFlows 
	ON ProcessTypeFlowPasses.ProcessTypeFlowID = ProcessTypeFlows.ProcessTypeFlowID 
LEFT JOIN (SELECT ProcessTypeStageFields.ProcessTypeFieldID, ProcessTypeStageFields.ProcessTypeStageID, IntValue, StringValue, DateTimeValue FROM ProcessTypeStageFields) StageFields
	ON StageFields.ProcessTypeFieldID = ProcessTypeFlowPasses.ProcessTypeFieldID 
		AND StageFields.ProcessTypeStageID = ProcessTypeFlows.ProcessTypeFromStageID 
WHERE ProcessTypeFlowPasses.ProcessTypeFlowID = @ProcessTypeFlowId 
ORDER BY ProcessTypeFlowPasses.Sequence;

