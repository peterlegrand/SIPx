CREATE PROCEDURE [dbo].[usp_ClassificationValueUserDeleteGet] (@UserId nvarchar(450), @ClassificationValueUserId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValueUsers.ClassificationValueUserID
	, ClassificationValueUsers.ClassificationValueID
	, ClassificationValueUsers.ClassificationRelationTypeID
	,ClassificationValueUsers.UserID
	, Persons.FirstName
	, Persons.LastName
	,  ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typeUser')) RelationTypeName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationValueUsers.CreatorID
	, ClassificationValueUsers.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationValueUsers.ModifierID
	, ClassificationValueUsers.ModifiedDate
FROM ClassificationValueUsers 
JOIN Persons
	ON Persons.Userid = ClassificationValueUsers.UserID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationId = Persons.DefaultOrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = Persons.DefaultOrganizationID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueUsers.ModifierID
WHERE ClassificationValueUsers.ClassificationValueUserId = @ClassificationValueUserID


