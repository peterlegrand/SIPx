CREATE PROCEDURE [dbo].[usp_ClassificationUserDeleteGet] (@UserId nvarchar(450), @ClassificationUserId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationUsers.ClassificationUserID
	, ClassificationUsers.ClassificationID
	, ClassificationUsers.ClassificationRelationTypeID
	,ClassificationUsers.UserID
	, Persons.FirstName
	, Persons.LastName
	,  ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typeUser')) RelationTypeName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationUsers.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationUsers.ModifiedDate
FROM ClassificationUsers 
JOIN Persons
	ON Persons.Userid = ClassificationUsers.UserID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationId = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserId = ClassificationUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationUsers.ModifierID
WHERE ClassificationUsers.ClassificationUserId = @ClassificationUserID


