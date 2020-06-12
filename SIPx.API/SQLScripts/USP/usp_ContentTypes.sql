CREATE PROCEDURE [dbo].[usp_ContentTypes] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
	DECLARE @SecurityLevelID int;
SELECT @SecurityLevelID = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;
SELECT ContentTypes.ContentTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ContentType')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Name,'No description for this ContentType')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.Name,'No menu name for this ContentType')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this ContentType')) MouseOver
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this ContentType')) GroupName
	, ISNULL(UISecurityLevelNameCustom.Customization,UISecurityLevelName.Name) SecurityLevelName
	, CASE WHEN ContentTypes.ProcessTemplateID IS NULL THEN 'No process template' ELSE ProcessTemplate.Name END ProcessName
	, CASE WHEN ContentTypes.ProcessTemplateID IS NULL THEN 'No process template group' ELSE ProcessTemplate.GroupName END ProcessGroupName
FROM ContentTypes 
LEFT JOIN (SELECT ContentTypeID, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages WHERE LanguageID = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeID = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeGroupID, Name FROM ContentTypeGroupLanguages WHERE LanguageID = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.ContentTypeGroupID = ContentTypes.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeGroupID, Name FROM ContentTypeGroupLanguages  JOIN Settings ON ContentTypeGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.ContentTypeGroupID = ContentTypes.ContentTypeGroupID
JOIN SecurityLevels
	ON ContentTypes.SecurityLevelID= SecurityLevels.SecurityLevelID
JOIN UITermLanguages UISecurityLevelName
	ON UISecurityLevelName.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISecurityLevelNameCustom
	ON UISecurityLevelNameCustom.UITermID = SecurityLevels.NameTermID
LEFT JOIN (
	SELECT ProcessTemplates.ProcessTemplateID
		, ISNULL(UserProcessLanguage.Name,ISNULL(DefaultProcessLanguage.Name,'No name for this process template')) Name 
		, ISNULL(UserProcessGroupLanguage.Name,ISNULL(DefaultProcessGroupLanguage.Name,'No group name for this process template')) GroupName 
	FROM ProcessTemplates 
	LEFT JOIN (SELECT ProcessTemplateID, Name FROM ProcessTemplateLanguages WHERE LanguageID = @LanguageID) UserProcessLanguage
		ON UserProcessLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateID
	LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessLanguage
		ON DefaultProcessLanguage.ProcessTemplateID = ProcessTemplates.ProcessTemplateID
	LEFT JOIN (SELECT ProcessTemplateGroupID, Name FROM ProcessTemplateGroupLanguages WHERE LanguageID = @LanguageID) UserProcessGroupLanguage
		ON UserProcessGroupLanguage.ProcessTemplateGroupID= ProcessTemplates.ProcessTemplateGroupID
	LEFT JOIN (SELECT ProcessTemplateGroupId, Name FROM ProcessTemplateGroupLanguages JOIN Settings ON ProcessTemplateGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessGroupLanguage
		ON DefaultProcessGroupLanguage.ProcessTemplateGroupID = ProcessTemplates.ProcessTemplateGroupID
		) ProcessTemplate
ON ProcessTemplate.ProcessTemplateID = Contenttypes.ProcessTemplateID
JOIN Persons Creator
	ON Creator.UserID = ContentTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypes.ModifierID
WHERE UISecurityLevelName.LanguageID = @LanguageID
	AND SecurityLevels.SecurityLevelID <= @SecurityLevelID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ContentType')) 

