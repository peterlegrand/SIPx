CREATE PROCEDURE usp_FrontContentShowContentRightsGet (@ContentId int)
AS
SELECT
ContentId
, Contenttypes.IsFreeEdit
, Contenttypes.IsFreeRead
, contents.IsRelationBasedEdit	 
, contents.IsRelationBasedRead	 
, contents.IsOrganizationBasedEdit	 
, contents.IsOrganizationBasedEditSub	 
, contents.IsOrganizationBasedEditParent	 
, contents.IsOrganizationBasedRead	 
, contents.IsOrganizationBasedReadSub	 
, contents.IsOrganizationBasedReadParent	 
, contents.IsProjectBasedEdit	 
, contents.IsProjectBasedEditSub	 
, contents.IsProjectBasedEditParent	 
, contents.IsProjectBasedRead	 
, contents.IsProjectBasedReadSub	 
, contents.IsProjectBasedReadParent	 
, OwnerId	
, Contenttypes.IsFreeEditSelectable
, Contenttypes.IsFreeReadSelectable
, Contenttypes.IsRelationBasedEditSelectable
, Contenttypes.IsRelationBasedReadSelectable
, Contenttypes.IsOrganizationBasedEditSelectable
, Contenttypes.IsOrganizationBasedReadSelectable
, Contenttypes.IsProjectBasedEditSelectable
, Contenttypes.IsProjectBasedReadSelectable
FROM contents
JOIN ContentTypes
	ON Contents.ContentTypeID = Contenttypes.ContentTypeID
WHERE ContentId = @ContentId