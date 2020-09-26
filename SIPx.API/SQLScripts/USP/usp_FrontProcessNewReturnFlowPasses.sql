CREATE PROCEDURE usp_FrontProcessNewReturnFlowPasses (
	@ProcessTemplateFlowId int
	)
AS
SELECT 
	ProcessTemplateFlowConditions.ProcessTemplateFlowConditionTypeId 
	, ProcessTemplateFlowConditions.ProcessTemplateFieldId 
	, ProcessTemplateFlowConditions.ProcessTemplateFieldIDRole 
	, ProcessTemplateFlowConditions.ComparisonOperatorID 
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionString 
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionInt 
	, ProcessTemplateFlowConditions.ProcessTemplateFlowConditionDate 
	, ISNULL(TemplateFields.ProcessTemplateFieldTypeID ,0) ProcessTemplateFieldTypeID 
FROM ProcessTemplateFlowConditions 
LEFT JOIN(
	SELECT 
		ProcessTemplateFields.ProcessTemplateFieldId
		, ProcessTemplateFields.ProcessTemplateFieldTypeID FROM ProcessTemplateFields) TemplateFields
	ON TemplateFields.ProcessTemplateFieldID = ProcessTemplateFlowConditions.ProcessTemplateFieldID 
WHERE ProcessTemplateFlowConditions.ProcessTemplateFlowID = @ProcessTemplateFlowId 
ORDER BY ProcessTemplateFlowConditions.Sequence;

