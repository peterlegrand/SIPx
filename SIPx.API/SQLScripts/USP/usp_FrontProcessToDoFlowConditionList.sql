CREATE PROCEDURE [dbo].[usp_FrontProcessToDoFlowConditionList] (@ProcessTypeFlowId int)
AS

SELECT ProcessTypeFlowConditionID
	, ProcessTypeFlowConditionTypeID
	, ProcessTypeFieldID
	, ProcessTypeFieldIDRole
	, ComparisonOperatorID
	, ProcessTypeFlowConditionString
	, ProcessTypeFlowConditionInt
	, ProcessTypeFlowConditionDate

FROM ProcessTypeFlowConditions 
WHERE ProcessTypeFlowId = @ProcessTypeFlowId
ORDER BY Sequence
