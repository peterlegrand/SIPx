CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationViewGet] (@LanguageID int, @ContentTypeID int)
AS
BEGIN
SELECT
	ContentTypeClassifications.ContentTypeClassificationID
	, ISNULL(UserClassifications.Name, ISNULL(DefaultClassifications.Name, '')) ClassificationName
	, ISNULL(UserClassifications.Description, ISNULL(DefaultClassifications.Description, '')) ClassificationDescription
	, ISNULL(UserClassifications.MenuName, ISNULL(DefaultClassifications.MenuName, '')) ClassificatioMenuname
	, ISNULL(UserClassifications.MouseOver, ISNULL(DefaultClassifications.MouseOver, '')) ClassificationMouseOver
	, CAST(CASE WHEN UserClassifications.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationLanguage
	, ContentTypeClassifications.ModifiedDate
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
	, ISNULL(UserContentTypeClassificationStatus.Name, ISNULL(DefaultContentTypeClassificationStatus.Name, '')) ContentTypeClassificationStatusName
	, ISNULL(UserContentTypeClassificationStatus.Description, ISNULL(DefaultContentTypeClassificationStatus.Description, '')) ContentTypeClassificationStatusDescription
	, ISNULL(UserContentTypeClassificationStatus.MenuName, ISNULL(DefaultContentTypeClassificationStatus.MenuName, '')) ContentTypeClassificationStatusMenuName
	, ISNULL(UserContentTypeClassificationStatus.MouseOver, ISNULL(DefaultContentTypeClassificationStatus.MouseOver, '')) ContentTypeClassificationStatusMouseOver
	, CAST(CASE WHEN UserContentTypeClassificationStatus.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultUserContentTypeClassificationStatusLanguage
FROM ContentTypeClassifications
LEFT JOIN (SELECT ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name
		, ClassificationLanguages.Description
		, ClassificationLanguages.MenuName
		, ClassificationLanguages.MouseOver
	FROM ClassificationLanguages 
	WHERE ClassificationLanguages.LanguageID = @LanguageID
	) UserClassifications
	ON UserClassifications.ClassificationID = ContentTypeClassifications.ClassificationID
LEFT JOIN (SELECT ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name
		, ClassificationLanguages.Description
		, ClassificationLanguages.MenuName
		, ClassificationLanguages.MouseOver
	FROM ClassificationLanguages 
	JOIN Settings	
		ON ClassificationLanguages.LanguageID = Settings.IntValue
	WHERE Settings.SettingID = 1) DefaultClassifications
	ON DefaultClassifications.ClassificationID = ContentTypeClassifications.ClassificationID
JOIN ContentTypeClassificationStatuses
	ON ContentTypeClassifications.ContentTypeClassificationStatusID = ContentTypeClassificationStatuses.ContentTypeClassificationStatusID
LEFT JOIN (SELECT 
		ContentTypeClassificationStatusLanguages.ContentTypeClassificationStatusID
		, ContentTypeClassificationStatusLanguages.Name 
		, ContentTypeClassificationStatusLanguages.Description
		, ContentTypeClassificationStatusLanguages.MenuName
		, ContentTypeClassificationStatusLanguages.MouseOver
		FROM ContentTypeClassificationStatusLanguages
		WHERE ContentTypeClassificationStatusLanguages.LanguageID = @LanguageID) UserContentTypeClassificationStatus
	ON UserContentTypeClassificationStatus.ContentTypeClassificationStatusID = ContentTypeClassificationStatuses.ContentTypeClassificationStatusID
LEFT JOIN (SELECT 
		ContentTypeClassificationStatusLanguages.ContentTypeClassificationStatusID
		, ContentTypeClassificationStatusLanguages.Name 
		, ContentTypeClassificationStatusLanguages.Description
		, ContentTypeClassificationStatusLanguages.MenuName
		, ContentTypeClassificationStatusLanguages.MouseOver
		FROM ContentTypeClassificationStatusLanguages
		JOIN Settings
			ON Settings.IntValue = ContentTypeClassificationStatusLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultContentTypeClassificationStatus
	ON DefaultContentTypeClassificationStatus.ContentTypeClassificationStatusID = ContentTypeClassificationStatuses.ContentTypeClassificationStatusID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ContentTypeClassifications.ModifierID
WHERE ContentTypeClassifications.ContentTypeID = @ContentTypeID
ORDER BY ISNULL(UserClassifications.Name, ISNULL(DefaultClassifications.Name, '')) 
	
END
