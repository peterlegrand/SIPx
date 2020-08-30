CREATE PROCEDURE [dbo].[usp_ContentTypeDeleteGet] (@UserId nvarchar(450), @ContentTypeID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypes.ContentTypeID
	, @LanguageId LanguageId
	, ContentTypeGroups.Sequence
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this content type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this content type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this content type')) MouseOver
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this content type group')) ContentTypeGroupName
	, ISNULL(UserGroupLanguage.Description,ISNULL(DefaultGroupLanguage.Description,'No description for this content type group')) GroupDescription
	, ISNULL(UserGroupLanguage.MenuName,ISNULL(DefaultGroupLanguage.MenuName,'No menu name for this content type group')) GroupMenuName
	, ISNULL(UserGroupLanguage.MouseOver,ISNULL(DefaultGroupLanguage.MouseOver,'No mouse over for this content type group')) GroupMouseOver
	, ISNULL(UISecurityLevelNameCustom.Customization ,UISecurityLevelName.Name) SecurityLevelName
	, CASE WHEN ContentTypes.ProcessTemplateId IS NOT NULL THEN ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguageLanguage.Name,'No name for the process template')) ELSE 'There is process no template' END ProcessTemplateName
	, ISNULL(ContentTypes.ProcessTemplateId,0) ProcessTemplateId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
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
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateId = ContentTypes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateLanguageLanguage
	ON DefaultProcessTemplateLanguageLanguage.ProcessTemplateId = ContentTypes.ProcessTemplateID
JOIN Languages 
	ON Languages.LanguageId = @LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ContentTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypes.ModifierID
WHERE UISecurityLevelName.LanguageId = @LanguageID
	AND ContentTypes.ContentTypeID = @ContentTypeID