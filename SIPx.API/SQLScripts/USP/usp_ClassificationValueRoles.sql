CREATE PROCEDURE [dbo].[usp_ClassificationValueRoles] (@UserID nvarchar(450), @ClassificationValueID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationValueRoles.RoleID
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role')) RoleName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typerole')) RelationTypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValueRoles.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValueRoles.ModifiedDate
FROM ClassificationValueRoles 
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageID = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleID = ClassificationValueRoles.RoleID
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleID = ClassificationValueRoles.RoleID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages WHERE LanguageID = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationValueRoles.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationValueRoles.ClassificationRelationTypeID
JOIN Persons Creator
	ON Creator.UserID = ClassificationValueRoles.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationValueRoles.ModifierID
WHERE ClassificationValueRoles.ClassificationValueID = @ClassificationValueID
ORDER BY ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role'))
