CREATE PROCEDURE [dbo].[usp_ContentList] (@UserID nvarchar(450), @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Content.ContentID
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, ISNULL(UISecurityLevelNameCustom.Customization,UISecurityLevelName.Name) SecurityLevelName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No menu name for this organization')) OrganizationName
	, CASE WHEN Content.ProjectID IS NOT NULL THEN ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No menu name for this organization')) ELSE 'There is no related project' END ProjectName
	, ProcessFields.StringValue ProcessSubject
FROM Content 
LEFT JOIN Content ParentContent
	ON Content.ParentContentID = ParentContent.ContentID
LEFT JOIN (SELECT ContentTypeID, Name FROM ContentTypeLanguages WHERE LanguageID = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID = Content.ContentTypeID
LEFT JOIN (SELECT ContentTypeID, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeID = Content.ContentTypeID
JOIN ContentStatuses
	ON Content.ContentStatusID = ContentStatuses.ContentStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermID = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermID = ContentStatuses.NameTermID
JOIN Languages
	ON Content.LanguageID= Languages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN SecurityLevels
	ON Content.SecurityLevelID= SecurityLevels.SecurityLevelID
JOIN UITermLanguages UISecurityLevelName
	ON UISecurityLevelName.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISecurityLevelNameCustom
	ON UISecurityLevelNameCustom.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID = Content.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationID = Content.OrganizationID
LEFT JOIN (SELECT ProjectID, Name FROM ProjectLanguages WHERE LanguageID = @LanguageID) ProjectUserLanguage
	ON ProjectUserLanguage.ProjectID = Content.ProjectID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) ProjectDefaultLanguage
	ON ProjectDefaultLanguage.ProjectID = Content.ProjectID
JOIN ProcessFields 
	ON ProcessFields.ProcessID = Content.ProcessID
JOIN ProcessTemplateFields 
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID 
WHERE ProcessTemplateFields.ProcessTemplateFieldTypeID = 1
END;