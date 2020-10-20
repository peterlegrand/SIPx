CREATE PROCEDURE [dbo].[usp_ClassificationValueUserIndexGet] (@UserId nvarchar(450), @ClassificationValueID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValueUsers.ClassificationValueUserID
	, Persons.UserID
	, Persons.FirstName
	, Persons.LastName
	, OrganizationLanguages.Name OrganizationName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this relation type')) ClassificationRelationTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationValueUsers.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationValueUsers.ModifiedDate
	, Modifier.PersonID ModifierId
FROM ClassificationValueUsers
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationRelationTypeId = ClassificationValueUsers.ClassificationRelationTypeId
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationRelationTypeId = ClassificationValueUsers.ClassificationRelationTypeId
JOIN Persons
	ON ClassificationValueUsers.UserID = Persons.UserID
JOIN OrganizationLanguages
	ON Persons.DefaultOrganizationID = OrganizationLanguages.OrganizationID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueUsers.ModifierID
WHERE ClassificationValueUsers.ClassificationValueID = @ClassificationValueID
	AND OrganizationLanguages.LanguageID = @LanguageId
ORDER BY Persons.FirstName
	, Persons.LastName
