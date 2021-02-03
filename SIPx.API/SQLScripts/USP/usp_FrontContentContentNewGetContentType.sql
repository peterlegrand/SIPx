CREATE PROCEDURE usp_FrontContentContentNewGetContentType ( @ContentTypeId int) 
AS 
SELECT 
	SecurityLevelID
	, CodePrefix
	, CodeSuffix
	, CodeTypeId
	, IsRelationBasedEdit
	, IsRelationBasedEditSelectable
	, IsRelationBasedRead
	, IsRelationBasedReadSelectable
	, IsFreeEdit
	, IsFreeEditSelectable 
	, IsFreeRead
	, IsFreeReadSelectable
	, IsOrganizationBasedEdit
	, IsOrganizationBasedEditParent
	, IsOrganizationBasedEditSub
	, IsOrganizationBasedEditSelectable
	, IsOrganizationBasedRead
	, IsOrganizationBasedReadParent
	, IsOrganizationBasedReadSub
	, IsOrganizationBasedReadSelectable
	
	, IsProjectBasedEdit
	, IsProjectBasedEditParent
	, IsProjectBasedEditSub
	, IsProjectBasedEditSelectable
	, IsProjectBasedRead
	, IsProjectBasedReadParent
	, IsProjectBasedReadSub
	, IsProjectBasedReadSelectable
	
FROM contenttypes
WHERE ContentTypeID = @ContentTypeId