CREATE PROCEDURE usp_PersonForPanelCondition (@PageSectionId int)
AS
SELECT PageSectionPersonConditionId
	, PageSectionPersonConditionTypeId 
	,PageSectionPersonConditionInt
	,PageSectionPersonConditionString
	,PageSectionPersonConditionDate
FROM PageSectionPersonConditions 
WHERE pagesectionid = @PageSectionId