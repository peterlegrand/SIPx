CREATE PROCEDURE usp_FrontProcessNewReturnFlowPasses (
	@ProcessTemplateFlowId int
	)
AS
SELECT 
	ProcessTemplateFlowPasses.ProcessTemplateFlowPassTypeId 
	, ProcessTemplateFlowPasses.ProcessTemplateFieldId 
	, ProcessTemplateFlowPasses.ProcessTemplateFieldIDRole 
	, ProcessTemplateFlowPasses.ComparisonOperatorID 
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassString 
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassInt 
	, ProcessTemplateFlowPasses.ProcessTemplateFlowPassDate 
	, ISNULL(TemplateFields.ProcessTemplateFieldTypeID ,0) ProcessTemplateFieldTypeID 
	, ISNULL(stagefields.IntValue, 0) StageFieldIntValue
	, ISNULL(stagefields.StringValue, '') StageFieldStringValue
	, ISNULL(stagefields.DateTimeValue, getdate()) StageFieldDateTimeValue
FROM ProcessTemplateFlowPasses 
LEFT JOIN(
	SELECT 
		ProcessTemplateFields.ProcessTemplateFieldId
		, ProcessTemplateFields.ProcessTemplateFieldTypeID FROM ProcessTemplateFields) TemplateFields
	ON TemplateFields.ProcessTemplateFieldID = ProcessTemplateFlowPasses.ProcessTemplateFieldID 
JOIN ProcessTemplateFlows 
	ON ProcessTemplateFlowPasses.ProcessTemplateFlowID = ProcessTemplateFlows.ProcessTemplateFlowID 
LEFT JOIN (SELECT ProcessTemplateStageFields.ProcessTemplateFieldID, ProcessTemplateStageFields.ProcessTemplateStageID, IntValue, StringValue, DateTimeValue FROM ProcessTemplateStageFields) StageFields
	ON StageFields.ProcessTemplateFieldID = ProcessTemplateFlowPasses.ProcessTemplateFieldID 
		AND StageFields.ProcessTemplateStageID = ProcessTemplateFlows.ProcessTemplateFromStageID 
WHERE ProcessTemplateFlowPasses.ProcessTemplateFlowID = @ProcessTemplateFlowId 
ORDER BY ProcessTemplateFlowPasses.Sequence;

