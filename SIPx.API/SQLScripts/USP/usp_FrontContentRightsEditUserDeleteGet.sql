CREATE PROCEDURE usp_FrontContentRightsEditUserDeleteGet (@UserId nvarchar(450), @ContentUserEditId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentUserEdit.ContentUserEditID
	, ContentUserEdit.ContentID
	, Persons.UserID SelectedUserId
	, Persons.FirstName + ' ' + Persons.LastName SelectedUserName
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for the default organization')) DefaultOrganizationName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentUserEdit.CreatedDate
FROM ContentUserEdit
JOIN Persons 
	ON ContentUserEdit.UserID= Persons.UserID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationId = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserId = ContentUserEdit.CreatorID
WHERE ContentUserEditID = @ContentUserEditId
