CREATE PROCEDURE [dbo].[usp_ContentTypeGroupViewGet] (@LanguageID int)
AS
BEGIN
SELECT
	ContentTypeGroups.ContentTypeGroupID
	, ISNULL(UserContentTypeGroupLanguages.Name, ISNULL(DefaultContentTypeGroupLanguages.Name, '')) ContentTypeGroupName
	, ISNULL(UserContentTypeGroupLanguages.Description, ISNULL(DefaultContentTypeGroupLanguages.Description, '')) ContentTypeGroupDescription
	, ISNULL(UserContentTypeGroupLanguages.MenuName, ISNULL(DefaultContentTypeGroupLanguages.MenuName, '')) ContentTypeGroupName
	, ISNULL(UserContentTypeGroupLanguages.MouseOver, ISNULL(DefaultContentTypeGroupLanguages.MouseOver, '')) ContentTypeGroupName
	, CAST(CASE WHEN UserContentTypeGroupLanguages.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultContentTypeGroupLanguage
	, ContentTypeGroups.CreatedDate
	, ContentTypeGroups.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
FROM ContentTypeGroups
LEFT JOIN (SELECT 
		ContentTypeGroupLanguages.ContentTypeGroupID
		, ContentTypeGroupLanguages.Name 
		, ContentTypeGroupLanguages.Description
		, ContentTypeGroupLanguages.MenuName
		, ContentTypeGroupLanguages.MouseOver
		FROM ContentTypeGroupLanguages
		WHERE ContentTypeGroupLanguages.LanguageID = @LanguageID) UserContentTypeGroupLanguages
	ON UserContentTypeGroupLanguages.ContentTypeGroupID = ContentTypeGroups.ContentTypeGroupID
LEFT JOIN (SELECT 
		ContentTypeGroupLanguages.ContentTypeGroupID
		, ContentTypeGroupLanguages.Name 
		, ContentTypeGroupLanguages.Description
		, ContentTypeGroupLanguages.MenuName
		, ContentTypeGroupLanguages.MouseOver
		FROM ContentTypeGroupLanguages
		JOIN Settings
			ON Settings.IntValue = ContentTypeGroupLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultContentTypeGroupLanguages
	ON DefaultContentTypeGroupLanguages.ContentTypeGroupID = ContentTypeGroups.ContentTypeGroupID
JOIN AspNetUsers Creator
	ON Creator.Id = ContentTypeGroups.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ContentTypeGroups.ModifierID
ORDER BY ISNULL(UserContentTypeGroupLanguages.Name, ISNULL(DefaultContentTypeGroupLanguages.Name, '')) 
	
END
