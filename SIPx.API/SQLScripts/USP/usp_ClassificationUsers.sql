CREATE PROCEDURE [dbo].[usp_ClassificationUsers] (@UserID nvarchar(450), @ClassificationID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationUsers.UserID
	, Persons.FirstName
	, Persons.LastName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typeUser')) RelationTypeName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationUsers.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationUsers.ModifiedDate
FROM ClassificationUsers 
JOIN Persons
	ON Persons.Userid = ClassificationUsers.UserID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages WHERE LanguageID = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages WHERE LanguageID = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationID, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationID = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserID = ClassificationUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationUsers.ModifierID
WHERE ClassificationUsers.ClassificationID = @ClassificationID
ORDER BY Persons.FirstName, Persons.LastName 	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) 



