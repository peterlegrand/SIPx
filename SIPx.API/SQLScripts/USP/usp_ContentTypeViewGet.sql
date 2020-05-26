CREATE PROCEDURE [dbo].[usp_ContentTypeViewGet] (@LanguageID int)
AS
BEGIN
SELECT
	ContentTypes.ContentTypeID
	, ContentTypes.ContentTypeGroupID
	, ISNULL(UserContentTypeLanguages.Name, ISNULL(DefaultContentTypeLanguages.Name, '')) ContentTypeName
	, ISNULL(UserContentTypeLanguages.Description, ISNULL(DefaultContentTypeLanguages.Description, '')) ContentTypeDescription
	, ISNULL(UserContentTypeLanguages.MenuName, ISNULL(DefaultContentTypeLanguages.MenuName, '')) ContentTypeName
	, ISNULL(UserContentTypeLanguages.MouseOver, ISNULL(DefaultContentTypeLanguages.MouseOver, '')) ContentTypeName
	, CAST(CASE WHEN UserContentTypeLanguages.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultContentTypeLanguage
	, ContentTypes.CreatedDate
	, ContentTypes.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
FROM ContentTypes
LEFT JOIN (SELECT 
		ContentTypeLanguages.ContentTypeID
		, ContentTypeLanguages.Name 
		, ContentTypeLanguages.Description
		, ContentTypeLanguages.MenuName
		, ContentTypeLanguages.MouseOver
		FROM ContentTypeLanguages
		WHERE ContentTypeLanguages.LanguageID = @LanguageID) UserContentTypeLanguages
	ON UserContentTypeLanguages.ContentTypeID = ContentTypes.ContentTypeID
LEFT JOIN (SELECT 
		ContentTypeLanguages.ContentTypeID
		, ContentTypeLanguages.Name 
		, ContentTypeLanguages.Description
		, ContentTypeLanguages.MenuName
		, ContentTypeLanguages.MouseOver
		FROM ContentTypeLanguages
		JOIN Settings
			ON Settings.IntValue = ContentTypeLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultContentTypeLanguages
	ON DefaultContentTypeLanguages.ContentTypeID = ContentTypes.ContentTypeID
JOIN AspNetUsers Creator
	ON Creator.Id = ContentTypes.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ContentTypes.ModifierID
ORDER BY ISNULL(UserContentTypeLanguages.Name, ISNULL(DefaultContentTypeLanguages.Name, '')) 
	
END
