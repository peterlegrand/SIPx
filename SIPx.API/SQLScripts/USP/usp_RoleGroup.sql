CREATE PROCEDURE [dbo].[usp_RoleGroup] (@UserID nvarchar(450), @RoleGroupID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
LEFT JOIN (SELECT RoleGroupID, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages WHERE LanguageID = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.RoleGroupID  = RoleGroups.RoleGroupID
LEFT JOIN (SELECT RoleGroupId, Name, Description, MenuName, MouseOver FROM RoleGroupLanguages JOIN Settings ON RoleGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.RoleGroupID = RoleGroups.RoleGroupID
JOIN Persons Creator
	ON Creator.UserID = RoleGroups.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = RoleGroups.ModifierID
WHERE RoleGroups.RoleGroupID = @RoleGroupID

