CREATE PROCEDURE [dbo].[usp_ClassificationRole] (@UserID nvarchar(450), @ClassificationRoleID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationRoles.RoleID
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this role')) RoleName
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation typerole')) RelationTypeName
FROM ClassificationRoles 
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageID = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleID = ClassificationRoles.RoleID
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleID = ClassificationRoles.RoleID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages WHERE LanguageID = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationRoles.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeID, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeID = ClassificationRoles.ClassificationRelationTypeID
WHERE ClassificationRoles.ClassificationroleID = @ClassificationRoleID