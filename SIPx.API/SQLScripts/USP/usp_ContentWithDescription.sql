CREATE PROCEDURE [dbo].[usp_ContentWithDescription] (@UserId nvarchar(450), @ContentId int, @Top int =1000) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelID
FROM AspNetUsers
WHERE Id = @UserID;
SELECT Contents.ContentID
, Contents.Title
, Contents.Description
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, ISNULL(UISecurityLevelNameCustom.Customization,UISecurityLevelName.Name) SecurityLevelName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No menu name for this organization')) OrganizationName
	, CASE WHEN Contents.ProjectId IS NOT NULL THEN ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No menu name for this organization')) ELSE 'There is no related project' END ProjectName
	, ProcessFields.StringValue ProcessSubject
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Contents.ModifiedDate
FROM Contents 
LEFT JOIN Contents ParentContents
	ON Contents.ParentContentId = ParentContents.ContentID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeId = Contents.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = Contents.ContentTypeID
JOIN ContentStatuses
	ON Contents.ContentStatusId = ContentStatuses.ContentStatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermId = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermId = ContentStatuses.NameTermID
JOIN Languages
	ON Contents.LanguageID= Languages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN SecurityLevels
	ON Contents.SecurityLevelID= SecurityLevels.SecurityLevelID
JOIN UITermLanguages UISecurityLevelName
	ON UISecurityLevelName.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISecurityLevelNameCustom
	ON UISecurityLevelNameCustom.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationId = Contents.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = Contents.OrganizationID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages WHERE LanguageId = @LanguageID) ProjectUserLanguage
	ON ProjectUserLanguage.ProjectId = Contents.ProjectID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ProjectDefaultLanguage
	ON ProjectDefaultLanguage.ProjectId = Contents.ProjectID
JOIN ProcessFields 
	ON ProcessFields.ProcessId = Contents.ProcessID
JOIN ProcessTemplateFields 
	ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldId 
JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID
WHERE ProcessTemplateFields.ProcessTemplateFieldTypeId = 1
	AND UISecurityLevelName.LanguageId = @LanguageID
	AND UIStatusName.LanguageId = @LanguageID
	AND UILanguageName.LanguageId = @LanguageID
	AND SecurityLevels.SecurityLevelId <= @SecurityLevelID
	AND Contents.ContentId = @ContentID
END;


