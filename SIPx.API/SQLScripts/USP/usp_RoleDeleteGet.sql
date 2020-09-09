CREATE PROCEDURE usp_RoleDeleteGet (@UserId nvarchar(450),@RoleId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT AspNetRoles.ID RoleId
	, ISNULL(UserRoleLanguage.Name,ISNULL(DefaultRoleLanguage.Name,'No name for this Role')) Name
	, ISNULL(UserRoleLanguage.Description,ISNULL(DefaultRoleLanguage.Description,'No description for this Role')) Description
	, ISNULL(UserRoleLanguage.MenuName,ISNULL(DefaultRoleLanguage.MenuName,'No menu name for this Role')) MenuName
	, ISNULL(UserRoleLanguage.MouseOver,ISNULL(DefaultRoleLanguage.MouseOver,'No drop Mouse over for this Role')) MouseOver
	, ISNULL(UserRoleGroupLanguage.Name,ISNULL(DefaultRoleGroupLanguage.Name,'No name for this role group')) GroupName
	--, Creator.FirstName + ' ' + Creator.LastName CreatorName
	--, Creator.PersonID CreatorID
	--, Roles.CreatedDate
	--, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	--, Modifier.PersonID ModifierID
	--, Roles.ModifiedDate
FROM AspNetRoles
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages WHERE LanguageId = @LanguageID) UserRoleLanguage
	ON UserRoleLanguage.RoleId = AspNetRoles.ID
LEFT JOIN (SELECT RoleId, Name, Description, MenuName, MouseOver FROM RoleLanguages JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleLanguage
	ON DefaultRoleLanguage.RoleId = AspNetRoles.ID
LEFT JOIN (SELECT RoleGroupId, Name FROM RoleGroupLanguages WHERE LanguageId = @LanguageID) UserRoleGroupLanguage
	ON UserRoleGroupLanguage.RoleGroupID = AspNetRoles.RoleGroupID
LEFT JOIN (SELECT RoleGroupID, Name FROM RoleGroupLanguages JOIN Settings ON RoleGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRoleGroupLanguage
	ON DefaultRoleGroupLanguage.RoleGroupID= AspNetRoles.RoleGroupID
--JOIN Persons Creator
--	ON Creator.UserId = Roles.CreatorID
--JOIN Persons Modifier
--	ON Modifier.UserId = Roles.ModifierID
WHERE  AspNetRoles.ID = @RoleID
	