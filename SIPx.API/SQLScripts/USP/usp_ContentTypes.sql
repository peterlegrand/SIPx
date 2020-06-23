CREATE PROCEDURE [dbo].[usp_ContentTypes] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ContentTypes.ContentTypeID
	, ContentTypeGroups.Sequence
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this content type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this content type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this content type')) MouseOver
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this content type group')) GroupName
	, ISNULL(UserGroupLanguage.Description,ISNULL(DefaultGroupLanguage.Description,'No description for this content type group')) GroupDescription
	, ISNULL(UserGroupLanguage.MenuName,ISNULL(DefaultGroupLanguage.MenuName,'No menu name for this content type group')) GroupMenuName
	, ISNULL(UserGroupLanguage.MouseOver,ISNULL(DefaultGroupLanguage.MouseOver,'No mouse over for this content type group')) GroupMouseOver
	, ISNULL(UISecurityLevelNameCustom.Customization ,UISecurityLevelName.Name) SecurityLevelName
	, CASE WHEN ContentTypes.ProcessTemplateID IS NULL THEN ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguageLanguage.Name,'No name for the process template')) ELSE 'There is process template' END ProcessTemplate
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ContentTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypes.ModifiedDate
FROM ContentTypes 
JOIN ContentTypeGroups
	ON ContentTypeGroups.ContentTypeGroupID= ContentTypes.ContentTypeGroupID
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelID= Contenttypes.SecurityLevelID
JOIN UITermLanguages UISecurityLevelName
	ON UISecurityLevelName.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISecurityLevelNameCustom
	ON UISecurityLevelNameCustom.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT ContentTypeID, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeID = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeGroupID, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages WHERE LanguageID = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.ContentTypeGroupID  = ContentTypes.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages JOIN Settings ON ContentTypeGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.ContentTypeGroupID = ContentTypes.ContentTypeGroupID
LEFT JOIN (SELECT ProcessTemplateID, Name FROM ProcessTemplateLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateID = ContentTypes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateID, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateLanguageLanguage
	ON DefaultProcessTemplateLanguageLanguage.ProcessTemplateID = ContentTypes.ProcessTemplateID
JOIN Persons Creator
	ON Creator.UserID = ContentTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypes.ModifierID
WHERE UISecurityLevelName.LanguageID = @LanguageID
ORDER BY ContentTypeGroups.Sequence, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ContentType')) 
