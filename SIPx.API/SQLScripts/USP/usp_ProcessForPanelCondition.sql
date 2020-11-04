CREATE PROCEDURE usp_ProcessForPanelCondition (@PageSectionId int)
AS
SELECT PageSectionProcessConditionId
	, PageSectionProcessConditionTypeId 
	,PageSectionProcessConditionInt
	,PageSectionProcessConditionString
	,PageSectionProcessConditionDate
FROM PageSectionProcessConditions 
WHERE pagesectionid = @PageSectionId