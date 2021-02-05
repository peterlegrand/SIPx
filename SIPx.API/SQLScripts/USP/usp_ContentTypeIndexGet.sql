CREATE PROCEDURE [dbo].[usp_ContentTypeIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypes.ContentTypeID
	, @LanguageId LanguageId
	, ContentTypeGroups.Sequence GroupSequence
	, ContentTypeGroups.ContentTypeGroupID
	, ObjectTypeStatusId
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this content type group')) ContentTypeGroupName
	, ISNULL(UserGroupLanguage.Description,ISNULL(DefaultGroupLanguage.Description,'No description for this content type group')) GroupDescription
	, ISNULL(UserGroupLanguage.MenuName,ISNULL(DefaultGroupLanguage.MenuName,'No menu name for this content type group')) GroupMenuName
	, ISNULL(UserGroupLanguage.MouseOver,ISNULL(DefaultGroupLanguage.MouseOver,'No mouse over for this content type group')) GroupMouseOver
	, @LanguageId LanguageId
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this content type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this content type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this content type')) MouseOver
	, ISNULL(ContentTypes.SecurityLevelId,0) SecurityLevelId 
	, ISNULL(UISecurityLevelNameCustom.Customization ,UISecurityLevelName.Name) SecurityLevelName
	, ISNULL(ContentTypes.ProcessTypeID,0) ProcessTypeID
	, CASE WHEN ContentTypes.ProcessTypeId IS NOT NULL THEN ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguageLanguage.Name,'No name for the process type')) ELSE 'There is process no template' END ProcessTypeName
	, ContentTypes.Color
	, ContentTypes.IconID
	, ISNULL(UIIconNameCustom.Customization ,UIIconName.Name) IconName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, ContentTypes.ModifiedDate
FROM ContentTypes 
JOIN ContentTypeGroups
	ON ContentTypeGroups.ContentTypeGroupID= ContentTypes.ContentTypeGroupID
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelID= Contenttypes.SecurityLevelID
JOIN UITermLanguages UISecurityLevelName
	ON UISecurityLevelName.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISecurityLevelNameCustom
	ON UISecurityLevelNameCustom.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages WHERE LanguageId = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.ContentTypeGroupId  = ContentTypes.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages JOIN Settings ON ContentTypeGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.ContentTypeGroupId = ContentTypes.ContentTypeGroupID
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeLanguage
	ON UserProcessTypeLanguage.ProcessTypeId = ContentTypes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeLanguageLanguage
	ON DefaultProcessTypeLanguageLanguage.ProcessTypeId = ContentTypes.ProcessTypeID
JOIN Languages 
	ON Languages.LanguageId = @LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Icons
	ON Icons.IconID= Contenttypes.IconID
JOIN UITermLanguages UIIconName
	ON UIIconName.UITermId = Icons.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIIconNameCustom
	ON UIIconNameCustom.UITermId = Icons.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ContentTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypes.ModifierID
WHERE UISecurityLevelName.LanguageId = @LanguageID
	AND UIIconName.LanguageId = @LanguageID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ContentTypeGroups.Sequence, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ContentType')) 
