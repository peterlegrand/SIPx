CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleDeleteGet] (@UserId nvarchar(450), @ClassificationValueRoleId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValueRoles.RoleID
	, ClassificationValueRoles.ClassificationValueID
	, ClassificationValueRoles.ClassificationValueRoleID
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role')) RoleName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typerole')) ClassificationRelationTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationValueRoles.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationValueRoles.ModifiedDate
FROM ClassificationValueRoles 
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageId = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleId = ClassificationValueRoles.RoleID
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleId = ClassificationValueRoles.RoleID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueRoles.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueRoles.ClassificationRelationTypeID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueRoles.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueRoles.ModifierID
WHERE ClassificationValueRoles.ClassificationValueroleId = @ClassificationValueRoleID


