CREATE PROCEDURE [dbo].[usp_FrontProcessToDoFlowConditionList] (@ProcessTemplateFlowId int)
AS

SELECT ProcessTemplateFlowConditionID
	, ProcessTemplateFlowConditionTypeID
	, ProcessTemplateFieldID
	, ProcessTemplateFieldIDRole
	, ComparisonOperatorID
	, ProcessTemplateFlowConditionString
	, ProcessTemplateFlowConditionInt
	, ProcessTemplateFlowConditionDate

FROM ProcessTemplateFlowConditions 
WHERE ProcessTemplateFlowId = @ProcessTemplateFlowId
ORDER BY Sequence
