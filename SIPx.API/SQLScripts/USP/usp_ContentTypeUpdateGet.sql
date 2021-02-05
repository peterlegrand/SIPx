CREATE PROCEDURE [dbo].[usp_ContentTypeUpdateGet] (@UserId nvarchar(450), @ContentTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypes.ContentTypeID
	, ContentTypes.CodePrefix
	, ContentTypes.CodeSuffix
	, ContentTypes.CodeTypeId
	, @LanguageId LanguageId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this content type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this content type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this content type')) MouseOver
	, Contenttypes.ContentTypeGroupID
	, contenttypes.SecurityLevelID
	, ISNULL(ContentTypes.ProcessTypeId,0) ProcessTypeId
	, ObjectTypeStatusId
	, IsRelationBasedOwnership
    , IsProjectBasedOwnership 
	, IsOrganizationBasedOwnership 
	, IsFreeOwnership 
	, IsRelationBasedEdit 
	, IsRelationBasedEditSelectable 
	, IsOrganizationBasedEdit 
	, IsOrganizationBasedEditSelectable 
	, IsOrganizationBasedEditSub 
	, IsOrganizationBasedEditParent 
	, IsProjectBasedEdit 
	, IsProjectBasedEditSelectable 
	, IsProjectBasedEditSub 
	, IsProjectBasedEditParent 
	, IsFreeEdit 
	, IsFreeEditSelectable 
	, IsRelationBasedRead 
	, IsRelationBasedReadSelectable 
	, IsOrganizationBasedRead 
	, IsOrganizationBasedReadSelectable 
	, IsOrganizationBasedReadSub 
	, IsOrganizationBasedReadParent 
	, IsProjectBasedRead 
	, IsProjectBasedReadSelectable 
	, IsProjectBasedReadSub 
	, IsProjectBasedReadParent 
	, IsFreeRead 
	, IsFreeReadSelectable 
	, Contenttypes.Color
	, Contenttypes.IconID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypes.ModifiedDate
FROM ContentTypes 
JOIN ContentTypeGroups
	ON ContentTypeGroups.ContentTypeGroupID= ContentTypes.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID
JOIN Persons Creator
	ON Creator.UserId = ContentTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypes.ModifierID
WHERE ContentTypes.ContentTypeId = @ContentTypeID
