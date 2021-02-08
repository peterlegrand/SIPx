CREATE PROCEDURE usp_ContentTypePropertyUpdateGet (@UserId nvarchar(450),@ContentTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'ContentTypeProperty', 'Edit',1,'',@ContentTypePropertyId,@UserId

SELECT ContentTypeProperties.ContentTypePropertyID
	, ContentTypeProperties.ContentTypeID 
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
	, ContentTypeProperties.PropertyID
	, ContentTypeProperties.ObjectTypePropertyStatusId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ContentTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ContentTypeProperties.ModifiedDate
FROM ContentTypeProperties 
JOIN ContentTypes 
	ON ContentTypeProperties.PropertyID = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID= ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID

JOIN Persons Creator
	ON Creator.UserId = ContentTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeProperties.ModifierID
WHERE ContentTypeProperties.ContentTypePropertyId = @ContentTypePropertyID

COMMIT TRANSACTION


