CREATE PROCEDURE [dbo].[usp_RoleGroups] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT RoleGroups.RoleGroupID
	, RoleGroups.Sequence
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this content type group')) Name
	, ISNULL(UserGroupLanguage.Description,ISNULL(DefaultGroupLanguage.Description,'No description for this content type group')) Description
	, ISNULL(UserGroupLanguage.MenuName,ISNULL(DefaultGroupLanguage.MenuName,'No menu name for this content type group')) MenuName
	, ISNULL(UserGroupLanguage.MouseOver,ISNULL(DefaultGroupLanguage.MouseOver,'No mouse over for this content type group')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, RoleGroups.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, RoleGroups.ModifiedDate
FROM RoleGroups
LEFT JOIN (SELECT RoleGroupId, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages WHERE LanguageId = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.RoleGroupId  = RoleGroups.RoleGroupID
LEFT JOIN (SELECT RoleGroupId, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages JOIN Settings ON RoleGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.RoleGroupId = RoleGroups.RoleGroupID
JOIN Persons Creator
	ON Creator.UserId = RoleGroups.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = RoleGroups.ModifierID
ORDER BY RoleGroups.Sequence

