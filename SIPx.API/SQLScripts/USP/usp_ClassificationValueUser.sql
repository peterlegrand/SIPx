CREATE PROCEDURE [dbo].[usp_ClassificationValueUser] (@UserID nvarchar(450), @ClassificationValueUserID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationValueUsers.UserID
	, Persons.FirstName
	, Persons.LastName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typeUser')) RelationTypeName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValueUsers.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValueUsers.ModifiedDate
FROM ClassificationValueUsers 
JOIN Persons
	ON Persons.Userid = ClassificationValueUsers.UserID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages WHERE LanguageID = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationValueUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationValueUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationID = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserID = ClassificationValueUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationValueUsers.ModifierID
WHERE ClassificationValueUsers.ClassificationValueUserID = @ClassificationValueUserID


