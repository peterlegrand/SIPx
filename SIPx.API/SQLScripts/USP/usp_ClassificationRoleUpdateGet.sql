CREATE PROCEDURE [dbo].[usp_ClassificationRoleUpdateGet] (@UserId nvarchar(450), @ClassificationRoleId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationRoles.RoleID
	, ClassificationRoles.ClassificationRoleID
		, ClassificationRoles.ClassificationID
		, ClassificationRoles.ClassificationRelationTypeID
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role')) RoleName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typerole')) RelationTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationRoles.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationRoles.ModifiedDate
FROM ClassificationRoles 
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageId = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleId = ClassificationRoles.RoleID
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleId = ClassificationRoles.RoleID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationRoles.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationRoles.ClassificationRelationTypeID
JOIN Persons Creator
	ON Creator.UserId = ClassificationRoles.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationRoles.ModifierID
WHERE ClassificationRoles.ClassificationroleId = @ClassificationRoleID
