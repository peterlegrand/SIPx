CREATE PROCEDURE [dbo].[usp_FrontUserIndexGetContent] (@CurrentUserId nvarchar(450), @SelectedPersonId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserId 
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelId
FROM AspNetUsers
WHERE Id = @CurrentUserId 
;


SELECT 
	Contents.ContentID
	, Contents.ContentTypeID
	, Contents.LanguageID
	, ISNULL(Contents.ParentContentID, 0) ParentContentID
	, Contents.SecurityLevelID
	, Contents.Title
	, Contents.Description
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultTypeLanguage.Name,'No name for this SelectedPerson type')) TypeName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, ISNULL( UserSecurityLevelName.Customization, SecurityLevelName.Name) SecurityLevelName
	, ISNULL( UserLanguageName.Customization, LanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Contents.ModifiedDate
FROM Contents
LEFT JOIN (SELECT ContentID, Title FROM Contents WHERE Contents.SecurityLevelID <= @SecurityLevelId) ParentContent
	ON ParentContent.ContentID = Contents.ParentContentID
JOIN ContentStatuses
	ON ContentStatuses.ContentStatusId = Contents.ContentStatusId
JOIN UITermLanguages StatusName
	ON ContentStatuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON ContentStatuses.NameTermId = UserStatusName.UITermId  
JOIN SecurityLevels
	ON SecurityLevels.SecurityLevelId = Contents.SecurityLevelID
JOIN UITermLanguages SecurityLevelName
	ON SecurityLevels.NameTermId = SecurityLevelName.UITermId  
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID= Contents.ContentTypeID
JOIN Languages
	ON Languages.LanguageId = Contents.LanguageID
JOIN UITermLanguages LanguageName
	ON Languages.NameTermId = LanguageName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageName
	ON Languages.NameTermId = UserLanguageName.UITermId  

LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage
	ON DefaultTypeLanguage.ContentTypeId = Contents.ContentTypeID
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserSecurityLevelName
	ON SecurityLevels.NameTermId = UserSecurityLevelName.UITermId  
JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID

WHERE Creator.PersonID= @SelectedPersonId
	AND Contents.SecurityLevelID <= @SecurityLevelId
	AND StatusName.LanguageId = @LanguageID
	AND LanguageName.LanguageId = @LanguageID
	AND SecurityLevelName.LanguageId = @LanguageID
END