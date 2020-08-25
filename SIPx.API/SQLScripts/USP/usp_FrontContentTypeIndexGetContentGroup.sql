CREATE PROCEDURE usp_FrontContentTypeIndexGetContentGroup (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
DECLARE @SecurityLevelId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT @SecurityLevelId = SecurityLevelID FROM AspNetUsers WHERE id = @UserId;
SELECT 
	ContentTypeGroups.ContentTypeGroupID
	, ISNULL(UserGroupLanguage.Name,ISNULL(DefaultGroupLanguage.Name,'No name for this content type group')) ContentTypeGroupName

FROM ContentTypeGroups
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver, ContentTypeGroupLanguageID FROM ContentTypeGroupLanguages WHERE LanguageId = @LanguageID) UserGroupLanguage
	ON UserGroupLanguage.ContentTypeGroupID= ContentTypeGroups.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver, ContentTypeGroupLanguageID FROM ContentTypeGroupLanguages JOIN Settings ON ContentTypeGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultGroupLanguage
	ON DefaultGroupLanguage.ContentTypeGroupId = ContentTypeGroups.ContentTypeGroupID
WHERE ContentTypeGroups.ContentTypeGroupID IN (SELECT ContentTypeGroupID FROM ContentTypes WHERE SecurityLevelID <=@SecurityLevelId)
ORDER BY ContentTypeGroups.Sequence