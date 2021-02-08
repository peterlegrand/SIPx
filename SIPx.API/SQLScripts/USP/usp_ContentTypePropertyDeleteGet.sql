CREATE PROCEDURE usp_ContentTypePropertyDeleteGet (@UserId nvarchar(450),@ContentTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'ContentTypeProperty', 'Delete',1,'',@ContentTypePropertyId,@UserId

SELECT ContentTypeProperties.ContentTypePropertyID
	, ContentTypeProperties.ContentTypeID 
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this Content type')) ContentTypeName
	, ContentTypeProperties.PropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ContentTypeProperties.ObjectTypePropertyStatusId
	, ISNULL(CustomStatus.Customization,DefaultStatus.Name) StatusName
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

JOIN Properties 
	ON ContentTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID


JOIN ObjectTypePropertyStatuses 
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusId = ContentTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages DefaultStatus
	ON DefaultStatus.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomStatus
	ON CustomStatus.UITermId = ObjectTypePropertyStatuses.NameTermID


JOIN Persons Creator
	ON Creator.UserId = ContentTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentTypeProperties.ModifierID
WHERE ContentTypeProperties.ContentTypePropertyId = @ContentTypePropertyID
AND DefaultStatus.LanguageId = @LanguageID
COMMIT TRANSACTION


