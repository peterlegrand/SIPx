CREATE PROCEDURE usp_ContentForPanelCondition (@PageSectionId int)
AS
SELECT PageSectionContentConditionId
	, PageSectionContentConditionTypeId 
	,PageSectionContentConditionInt
	,PageSectionContentConditionString
	,PageSectionContentConditionDate
FROM PageSectionContentConditions 
WHERE pagesectionid = @PageSectionId