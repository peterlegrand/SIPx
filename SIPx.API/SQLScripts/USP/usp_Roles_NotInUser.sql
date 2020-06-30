CREATE PROCEDURE [dbo].[usp_Roles_NotInUser] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT aspnetroles.Id 
	, ISNULL(RolesUserLanguage.Name,ISNULL(RolesDefaultLanguage.Name,'No name for this role')) Name
	, ISNULL(RolesUserLanguage.Description,ISNULL(RolesDefaultLanguage.Description,'No description for this role')) Description
	, ISNULL(RolesUserLanguage.MenuName,ISNULL(RolesDefaultLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(RolesUserLanguage.MouseOver,ISNULL(RolesDefaultLanguage.MouseOver,'No mouse over for this role')) MouseOver
FROM AspNetRoles 
JOIN RoleLanguages
	ON AspNetRoles.Id = RoleLanguages.RoleID
LEFT JOIN (SELECT RoleGroupId, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages WHERE LanguageId = @LanguageID) RolesUserLanguage
	ON RolesUserLanguage.RoleGroupId = AspNetRoles.RoleGroupID
LEFT JOIN (SELECT RoleGroupId, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages JOIN Settings ON RoleGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) RolesDefaultLanguage
	ON RolesDefaultLanguage.RoleGroupId = AspNetRoles.RoleGroupID
WHERE Aspnetroles.Id NOT IN (SELECT RoleId FROM AspNetUserRoles WHERE AspNetUserRoles.UserId = @UserID)


