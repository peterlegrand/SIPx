CREATE PROCEDURE usp_ProjectForPanelCondition (@PageSectionId int)
AS
SELECT PageSectionProjectConditionId
	, PageSectionProjectConditionTypeId 
	,PageSectionProjectConditionInt
	,PageSectionProjectConditionString
	,PageSectionProjectConditionDate
FROM PageSectionProjectConditions 
WHERE pagesectionid = @PageSectionId