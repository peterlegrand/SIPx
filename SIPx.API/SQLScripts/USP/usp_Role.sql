CREATE PROCEDURE [dbo].[usp_Role] (@UserId nvarchar(450), @RoleId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT AspNetRoles.Id RoleID
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
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageId = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleId = AspNetRoles.Id
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleId = AspNetRoles.Id
JOIN RoleGroups
	ON AspNetRoles.RoleGroupId = RoleGroups.RoleGroupID
LEFT JOIN (SELECT RoleGroupId, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages WHERE LanguageId = @LanguageID) UserRoleGroupLanguage
	ON UserRoleGroupLanguage.RoleGroupId = AspNetRoles.RoleGroupID
LEFT JOIN (SELECT RoleGroupId, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages JOIN Settings ON RoleGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleGroupLanguage
	ON DefaultRoleGroupLanguage.RoleGroupID= AspNetRoles.RoleGroupID
WHERE AspNetRoles.Id = @RoleID


