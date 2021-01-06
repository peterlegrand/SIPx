CREATE PROCEDURE usp_OrganizationPositionUpdateGet (@UserId nvarchar(450), @OrganizationPersonId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationPersons.OrganizationPersonId 
	, OrganizationPersons.OrganizationID
	, OrganizationPersons.PersonId
	, OrganizationPersons.PositionID 
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this organization')) OrganizationName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationPersons.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationPersons.ModifiedDate
FROM OrganizationPersons
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationID= OrganizationPersons.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = OrganizationPersons.OrganizationID
JOIN Persons Creator
	ON Creator.UserId = OrganizationPersons.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationPersons.ModifierID
WHERE OrganizationPersons.OrganizationPersonId = @OrganizationPersonId
