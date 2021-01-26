CREATE PROCEDURE usp_FrontContentRightsUpdateGet (@ContentId int)
AS
SELECT 
	Contents.ContentId
	, Contenttypes.IsRelationBasedEdit DefaultIsRelationBasedEdit
	, Contenttypes.IsProjectBasedEdit DefaultIsProjectBasedEdit
	, Contenttypes.IsProjectBasedEditSub DefaultIsProjectBasedEditSub
	, Contenttypes.IsProjectBasedEditParent DefaultIsProjectBasedEditParent
	, Contenttypes.IsOrganizationBasedEdit DefaultIsOrganizationBasedEdit
	, Contenttypes.IsOrganizationBasedEditSub DefaultIsOrganizationBasedEditSub
	, Contenttypes.IsOrganizationBasedEditParent DefaultIsOrganizationBasedEditParent
	, Contenttypes.IsFreeEdit DefaultIsFreeEdit 

	, Contenttypes.IsRelationBasedRead DefaultIsRelationBasedRead
	, Contenttypes.IsProjectBasedRead DefaultIsProjectBasedRead
	, Contenttypes.IsProjectBasedReadSub DefaultIsProjectBasedReadSub
	, Contenttypes.IsProjectBasedReadParent DefaultIsProjectBasedReadParent
	, Contenttypes.IsOrganizationBasedRead DefaultIsOrganizationBasedRead
	, Contenttypes.IsOrganizationBasedReadSub DefaultIsOrganizationBasedReadSub
	, Contenttypes.IsOrganizationBasedReadParent DefaultIsOrganizationBasedReadParent
	, Contenttypes.IsFreeRead DefaultIsFreeRead

	, Contenttypes.IsRelationBasedOwnership
	, Contenttypes.IsProjectBasedOwnership
	, Contenttypes.IsOrganizationBasedOwnership
	, Contenttypes.IsFreeOwnership
	, Contenttypes.IsRelationBasedEditSelectable
	, Contenttypes.IsProjectBasedEditSelectable
	, Contenttypes.IsOrganizationBasedEditSelectable
	, Contenttypes.IsFreeEditSelectable
	, Contenttypes.IsRelationBasedReadSelectable
	, Contenttypes.IsProjectBasedReadSelectable
	, Contenttypes.IsOrganizationBasedReadSelectable
	, Contenttypes.IsFreeReadSelectable

	, Contents.IsFreeEdit
	, Contents.IsFreeRead
	, Contents.IsRelationBasedEdit
	, Contents.IsRelationBasedRead
	, Contents.IsProjectBasedEdit
	, Contents.IsProjectBasedEditSub
	, Contents.IsProjectBasedEditParent
	, Contents.IsOrganizationBasedEdit
	, Contents.IsOrganizationBasedEditSub
	, Contents.IsOrganizationBasedEditParent
	, Contents.IsProjectBasedRead
	, Contents.IsProjectBasedReadSub
	, Contents.IsProjectBasedReadParent
	, Contents.IsOrganizationBasedRead
	, Contents.IsOrganizationBasedReadSub
	, Contents.IsOrganizationBasedReadParent
	, Contents.OwnerId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Contents.ModifiedDate
FROM contents 
JOIN contenttypes 
	ON contents.ContentTypeID = contenttypes.ContentTypeID
JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID
WHERE ContentId = @ContentId
