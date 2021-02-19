CREATE PROCEDURE usp_FrontContentContentNewGetContentType ( @ContentTypeId int) 
AS 
SELECT 
	SecurityLevelID
	, CodePrefix
	, CodeSuffix
	, CodeTypeId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) ContentTypeName
	
FROM contenttypes
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = 41) UserLanguage
	ON UserLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID
WHERE contenttypes.ContentTypeID = @ContentTypeId