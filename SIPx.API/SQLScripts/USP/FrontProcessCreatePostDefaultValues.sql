CREATE PROCEDURE FrontProcessCreatePostDefaultValues (@ProcessTemplateFlowId int)
AS
SELECT ProcessTemplateStageFields.ProcessTemplateFieldID
	, ProcessTemplateStageFields.ValueUpdateTypeID
	, StringValue
	, IntValue
	, DateTimeValue
FROM ProcessTemplateStageFields
JOIN ProcessTemplateFlows
	ON ProcessTemplateStageFields.ProcessTemplateStageID = ProcessTemplateFlows.ProcessTemplateFromStageID
WHERE ProcessTemplateFlows.ProcessTemplateFlowID = @ProcessTemplateFlowId 