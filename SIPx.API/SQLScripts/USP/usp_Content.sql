CREATE PROCEDURE [dbo].[usp_Content] (@UserID nvarchar(450), @ContentID int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
DECLARE @SecurityLevelID int;
SELECT @SecurityLevelID = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;
SELECT Contents.ContentID
, Contents.Title
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, ISNULL(UISecurityLevelNameCustom.Customization,UISecurityLevelName.Name) SecurityLevelName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No menu name for this organization')) OrganizationName
	, CASE WHEN Contents.ProjectID IS NOT NULL THEN ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No menu name for this organization')) ELSE 'There is no related project' END ProjectName
	, ProcessFields.StringValue ProcessSubject
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Contents.ModifiedDate
FROM Contents 
LEFT JOIN Contents ParentContents
	ON Contents.ParentContentID = ParentContents.ContentID
LEFT JOIN (SELECT ContentTypeID, Name FROM ContentTypeLanguages WHERE LanguageID = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID = Contents.ContentTypeID
LEFT JOIN (SELECT ContentTypeID, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeID = Contents.ContentTypeID
JOIN ContentStatuses
	ON Contents.ContentStatusID = ContentStatuses.ContentStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermID = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermID = ContentStatuses.NameTermID
JOIN Languages
	ON Contents.LanguageID= Languages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN SecurityLevels
	ON Contents.SecurityLevelID= SecurityLevels.SecurityLevelID
JOIN UITermLanguages UISecurityLevelName
	ON UISecurityLevelName.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISecurityLevelNameCustom
	ON UISecurityLevelNameCustom.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID = Contents.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationID = Contents.OrganizationID
LEFT JOIN (SELECT ProjectID, Name FROM ProjectLanguages WHERE LanguageID = @LanguageID) ProjectUserLanguage
	ON ProjectUserLanguage.ProjectID = Contents.ProjectID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) ProjectDefaultLanguage
	ON ProjectDefaultLanguage.ProjectID = Contents.ProjectID
JOIN ProcessFields 
	ON ProcessFields.ProcessID = Contents.ProcessID
JOIN ProcessTemplateFields 
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID 
JOIN Persons Creator
	ON Creator.UserID = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = Contents.ModifierID
WHERE ProcessTemplateFields.ProcessTemplateFieldTypeID = 1
	AND UISecurityLevelName.LanguageID = @LanguageID
	AND UIStatusName.LanguageID = @LanguageID
	AND UILanguageName.LanguageID = @LanguageID
	AND SecurityLevels.SecurityLevelID <= @SecurityLevelID
	AND Contents.ContentID = @ContentID
END;


