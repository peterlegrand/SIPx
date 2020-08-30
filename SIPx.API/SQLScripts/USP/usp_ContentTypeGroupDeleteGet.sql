CREATE PROCEDURE [dbo].[usp_ContentTypeGroupDeleteGet] (@UserId nvarchar(450), @ContentTypeGroupID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypeGroups.ContentTypeGroupID
	, ContentTypeGroups.Sequence
	, ISNULL(UserGroupLanguage.ContentTypeGroupLanguageID,ISNULL(DefaultGroupLanguage.ContentTypeGroupLanguageID,0)) ContentTypeGroupLanguageID
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this content type group')) Name
	, ISNULL(UserGroupLanguage.Description,ISNULL(DefaultGroupLanguage.Description,'No description for this content type group')) Description
	, ISNULL(UserGroupLanguage.MenuName,ISNULL(DefaultGroupLanguage.MenuName,'No menu name for this content type group')) MenuName
	, ISNULL(UserGroupLanguage.MouseOver,ISNULL(DefaultGroupLanguage.MouseOver,'No mouse over for this content type group')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypeGroups.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypeGroups.ModifiedDate
FROM ContentTypeGroups
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver, ContentTypeGroupLanguageID FROM ContentTypeGroupLanguages WHERE LanguageId = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.ContentTypeGroupId  = ContentTypeGroups.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver, ContentTypeGroupLanguageID FROM ContentTypeGroupLanguages JOIN Settings ON ContentTypeGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.ContentTypeGroupId = ContentTypeGroups.ContentTypeGroupID
JOIN Persons Creator
	ON Creator.UserId = ContentTypeGroups.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeGroups.ModifierID
WHERE ContentTypeGroups.ContentTypeGroupID = @ContentTypeGroupID
