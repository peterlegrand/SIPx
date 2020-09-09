CREATE PROCEDURE [dbo].[usp_ContentTypeGroupCreateGetSequence] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentTypeGroups.Sequence 
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type group')) Name
FROM ContentTypeGroups 
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeGroupID= ContentTypeGroups.ContentTypeGroupID
LEFT JOIN (SELECT ContentTypeGroupId, Name, Description, MenuName, MouseOver FROM ContentTypeGroupLanguages JOIN Settings ON ContentTypeGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeGroupId = ContentTypeGroups.ContentTypeGroupID
ORDER BY ContentTypeGroups.Sequence
