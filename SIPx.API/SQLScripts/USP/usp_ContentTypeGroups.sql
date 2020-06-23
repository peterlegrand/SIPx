CREATE PROCEDURE [dbo].[usp_ContentTypeGroups] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ContentTypeGroups.ContentTypeGroupID
	, ContentTypeGroups.Sequence
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this content type group')) Name
	, ISNULL(UserGroupLanguage.Description,ISNULL(DefaultGroupLanguage.Description,'No description for this content type group')) Description
	, ISNULL(UserGroupLanguage.MenuName,ISNULL(DefaultGroupLanguage.MenuName,'No menu name for this content type group')) MenuName
	, ISNULL(UserGroupLanguage.MouseOver,ISNULL(DefaultGroupLanguage.MouseOver,'No mouse over for this content type group')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ContentTypeGroups.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ContentTypeGroups.ModifiedDate
FROM ContentTypeGroups
LEFT JOIN (SELECT ContentTypeGroupID, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages WHERE LanguageID = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.ContentTypeGroupID  = ContentTypeGroups.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages JOIN Settings ON ContentTypeGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.ContentTypeGroupID = ContentTypeGroups.ContentTypeGroupID
JOIN Persons Creator
	ON Creator.UserID = ContentTypeGroups.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ContentTypeGroups.ModifierID
ORDER BY ContentTypeGroups.Sequence

