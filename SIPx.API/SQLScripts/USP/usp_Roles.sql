CREATE PROCEDURE [dbo].[usp_Roles] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT AspNetRoles.Id 
	, AspNetRoles.Name InternalName 
	, ISNULL(UserRoleLanguage.Name,DefaultRoleLanguage.Name) Name
	, ISNULL(UserRoleLanguage.Description,DefaultRoleLanguage.Description) Description
	, ISNULL(UserRoleLanguage.MenuName,DefaultRoleLanguage.MenuName) MenuName
	, ISNULL(UserRoleLanguage.MouseOver,DefaultRoleLanguage.MouseOver) MouseOver
	, RoleGroups.RoleGroupID
	, RoleGroups.Sequence
	, ISNULL(UserRoleGroupLanguage.Name,DefaultRoleGroupLanguage.Name) GroupName
	, ISNULL(UserRoleGroupLanguage.Description,DefaultRoleGroupLanguage.Description) GroupDescription
	, ISNULL(UserRoleGroupLanguage.MenuName,DefaultRoleGroupLanguage.MenuName) GroupMenuName
	, ISNULL(UserRoleGroupLanguage.MouseOver,DefaultRoleGroupLanguage.MouseOver) GroupMouseOver
FROM AspNetRoles
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageID = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleID = AspNetRoles.Id
LEFT JOIN (SELECT RoleID, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleID = AspNetRoles.Id
JOIN RoleGroups
	ON AspNetRoles.RoleGroupID = RoleGroups.RoleGroupID
LEFT JOIN (SELECT RoleGroupID, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages WHERE LanguageID = @LanguageID) UserRoleGroupLanguage
	ON UserRoleGroupLanguage.RoleGroupID = AspNetRoles.RoleGroupID
LEFT JOIN (SELECT RoleGroupID, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages JOIN Settings ON RoleGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultRoleGroupLanguage
	ON DefaultRoleGroupLanguage.RoleGroupID= AspNetRoles.RoleGroupID

ORDER BY  RoleGroups.Sequence
	, ISNULL(UserRoleLanguage.Name,DefaultRoleLanguage.Name) 