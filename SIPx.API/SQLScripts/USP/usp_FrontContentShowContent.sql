CREATE PROCEDURE usp_FrontContentShowContent (@UserId nvarchar(450), @ContentId int)
AS
DECLARE @LanguageId int;
DECLARE @SecurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT @SecurityLevelId = SecurityLevelID FROM AspNetUsers WHERE id = @UserId;
SELECT 
	Contents.ContentID
	, Contents.Title
	, Contents.Description
	, ISNULL(Contents.ProjectId,0) ProjectID
	, Contents.ProjectID 
	, Contents.ContentTypeId 
	, ISNULL(ParentContent.Title, 'No parent content') AS ParentContentTitle
	, ISNULL(UIContentStatusNameCustom.Customization ,UIContentStatusName.Name) ContentStatusName
	, ISNULL(UILanguageNameCustom.Customization ,UILanguageName.Name) LanguageName
	, ISNULL(UISecurityLevelNameCustom.Customization ,UISecurityLevelName.Name) SecurityLevelName
	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this Project')) ProjectName
	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this Project')) ProjectName
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this ContentType')) ContentTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonId CreatorID
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonId ModifierID
	, Contents.ModifiedDate
	, CASE WHEN Contents.OwnerId = @UserId THEN 1 ELSE 0 END AS IsOwner
FROM Contents
LEFT JOIN Contents ParentContent
	ON ParentContent.ContentID = Contents.ParentContentID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectID= Contents.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Contents.ProjectID
--LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
--	ON UserProjectLanguage.ProjectID= Contents.ProjectID
--LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
--	ON DefaultProjectLanguage.ProjectId = Contents.ProjectID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID= Contents.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = Contents.ContentTypeID
JOIN ContentStatuses 
	ON ContentStatuses.ContentStatusID = Contents.ContentStatusID
JOIN UITermLanguages UIContentStatusName
	ON UIContentStatusName.UITermId = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIContentStatusNameCustom
	ON UIContentStatusNameCustom.UITermId = ContentStatuses.NameTermID
JOIN Languages 
	ON Languages.LanguageID = Contents.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN SecurityLevels 
	ON SecurityLevels.SecurityLevelID = SecurityLevels.SecurityLevelID
JOIN UITermLanguages UISecurityLevelName
	ON UISecurityLevelName.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISecurityLevelNameCustom
	ON UISecurityLevelNameCustom.UITermId = SecurityLevels.NameTermID
JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID

WHERE Contents.SecurityLevelID <= @SecurityLevelId
	AND UIContentStatusName.LanguageId = @LanguageID
	AND UILanguageName.LanguageId = @LanguageID
	AND UISecurityLevelName.LanguageId = @LanguageID
	AND Contents.ContentID = @ContentId