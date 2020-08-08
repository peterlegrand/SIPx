CREATE PROCEDURE usp_contentForPanel (@UserId nvarchar(450)) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Contents.ContentID
	, Contents.Title
	, Contents.Description
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ContentType')) ContentTypeName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Contents.CreatorID
	, Contents.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Contents.ModifierID
	, Contents.ModifiedDate
	, CONCAT('controlID',Contents.ContentId) ControlId
FROM Contents
JOIN ContentTypes
	ON Contents.ContentTypeID = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID
JOIN Persons Creator
	ON Creator.UserId = Contents.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Contents.ModifierID
ORDER BY Contents.CreatedDate

