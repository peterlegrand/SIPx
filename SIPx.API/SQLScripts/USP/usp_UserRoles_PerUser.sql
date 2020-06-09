CREATE PROCEDURE [dbo].[usp_UserRoles_PerUser] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT aspnetroles.Id 
	, ISNULL(RolesUserLanguage.Name,ISNULL(RolesDefaultLanguage.Name,'No name for this role')) Name
	, ISNULL(RolesUserLanguage.Description,ISNULL(RolesDefaultLanguage.Description,'No description for this role')) Description
	, ISNULL(RolesUserLanguage.MenuName,ISNULL(RolesDefaultLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(RolesUserLanguage.MouseOver,ISNULL(RolesDefaultLanguage.MouseOver,'No mouse over for this role')) MouseOver
FROM AspNetRoles 
JOIN AspNetUserRoles
	ON AspNetUserRoles.RoleId = AspNetRoles.Id
JOIN RoleLanguages
	ON AspNetRoles.Id = RoleLanguages.RoleID
LEFT JOIN (SELECT RoleGroupID, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages WHERE LanguageID = @LanguageID) RolesUserLanguage
	ON RolesUserLanguage.RoleGroupID = AspNetRoles.RoleGroupID
LEFT JOIN (SELECT RoleGroupID, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages JOIN Settings ON RoleGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) RolesDefaultLanguage
	ON RolesDefaultLanguage.RoleGroupID = AspNetRoles.RoleGroupID
WHERE AspNetUserRoles.UserId = @UserID