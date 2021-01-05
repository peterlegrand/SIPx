CREATE PROCEDURE usp_FrontProjectDashboardContent (@UserId nvarchar(450), @ProjectId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @SecurityLevelId int;
SELECT @SecurityLevelId = SecurityLevelId
FROM AspNetUsers
WHERE Id = @UserID
;


SELECT 
	Contents.ContentID
	, Contents.ContentTypeID
	, Contents.OrganizationID
	, Contents.LanguageID
	, ISNULL(Contents.ParentContentID, 0) ParentContentID
	, Contents.SecurityLevelID
	, Contents.Title
	, Contents.Description
 	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No organization')) OrganizationName
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultTypeLanguage.Name,'No name for this project type')) TypeName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, ISNULL( UserSecurityLevelName.Customization, SecurityLevelName.Name) SecurityLevelName
	, ISNULL( UserLanguageName.Customization, LanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Contents.CreatorID
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Contents.ModifierID
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
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= Contents.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationID = Contents.OrganizationID

JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID

WHERE Contents.ProjectID = @ProjectId
	AND Contents.SecurityLevelID <= @SecurityLevelId
	AND StatusName.LanguageId = @LanguageID
	AND LanguageName.LanguageId = @LanguageID
	AND SecurityLevelName.LanguageId = @LanguageID
END