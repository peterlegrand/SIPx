CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionViewGet] (@LanguageID int, @ClassificationPageID int, @ClassificationPageSectionID int = NULL)
AS
BEGIN
SELECT
	ClassificationPageSections.ClassificationPageSectionID
	, ClassificationPageSections.ClassificationPageID
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) ClassificationName
	, ClassificationPages.ClassificationID
	, ISNULL(UserClassificationPageLanguage.Name, ISNULL(DefaultClassificationPageLanguage.Name, '')) ClassificationPageName
	, ClassificationPageSections.CreatedDate
	, ClassificationPageSections.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier	
	, ClassificationPageSections.Sequence
	, ClassificationPageSections.ShowSectionTitleName
	, ClassificationPageSections.ShowSectionTitleDescription
	, ClassificationPageSections.ShowContentTypeTitleName
	, ClassificationPageSections.ShowContentTypeTitleDescription
	, ClassificationPageSections.MaxContent
	, ClassificationPageSections.HasPaging
	, ISNULL(UserClassificationPageSectionLanguage.Name, ISNULL(DefaultClassificationPageSectionLanguage.Name, '')) Name
	, ISNULL(UserClassificationPageSectionLanguage.Description, ISNULL(DefaultClassificationPageSectionLanguage.Description, '')) Description
	, ISNULL(UserClassificationPageSectionLanguage.MenuName, ISNULL(DefaultClassificationPageSectionLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationPageSectionLanguage.MouseOver, ISNULL(DefaultClassificationPageSectionLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserClassificationPageSectionLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationPageSectionLanguage
	, ISNULL(UserPageSectionTypeLanguage.Name, ISNULL(DefaultPageSectionTypeLanguage.Name, '')) PageSectionTypeName
	, CAST(CASE WHEN UserPageSectionTypeLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultPageSectionTypeLanguage
	, ISNULL(UserContentTypeLanguage.Name, ISNULL(DefaultContentTypeLanguage.Name, '')) ContentTypeName
	, CAST(CASE WHEN UserContentTypeLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultContentTypeLanguage
	, CAST(CASE WHEN ClassificationPageSections.ContentTypeID IS NULL  THEN 0 ELSE 1 END AS bit) HasContentType
	, ISNULL(UserSortByLanguage.Name, ISNULL(DefaultSortByLanguage.Name, '')) SortByName
	, CAST(CASE WHEN UserSortByLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultSortByLanguage
FROM ClassificationPageSections
JOIN ClassificationPages
	ON ClassificationPageSections.ClassificationPageID = ClassificationPages.ClassificationPageID
JOIN Classifications
	ON Classifications.ClassificationID = ClassificationPages.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		WHERE ClassificationLanguages.LanguageID = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		FROM ClassificationLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		WHERE ClassificationPageLanguages.LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageSectionLanguages.ClassificationPageSectionID
		, ClassificationPageSectionLanguages.Name 
		, ClassificationPageSectionLanguages.Description
		, ClassificationPageSectionLanguages.MenuName
		, ClassificationPageSectionLanguages.MouseOver
		FROM ClassificationPageSectionLanguages
		WHERE ClassificationPageSectionLanguages.LanguageID = @LanguageID) UserClassificationPageSectionLanguage
	ON UserClassificationPageSectionLanguage.ClassificationPageSectionID = ClassificationPageSections.ClassificationPageSectionID
LEFT JOIN (SELECT 
		ClassificationPageSectionLanguages.ClassificationPageSectionID
		, ClassificationPageSectionLanguages.Name 
		, ClassificationPageSectionLanguages.Description
		, ClassificationPageSectionLanguages.MenuName
		, ClassificationPageSectionLanguages.MouseOver
		FROM ClassificationPageSectionLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageSectionLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationPageSectionLanguage
	ON DefaultClassificationPageSectionLanguage.ClassificationPageSectionID = ClassificationPageSections.ClassificationPageSectionID
JOIN AspNetUsers Creator
	ON Creator.Id = ClassificationPageSections.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ClassificationPageSections.ModifierID
LEFT JOIN (SELECT 
			PageSectionTypeLanguages.PageSectionTypeID
			, PageSectionTypeLanguages.Name
		FROM PageSectionTypeLanguages
		WHERE PageSectionTypeLanguages.LanguageID = @LanguageID) UserPageSectionTypeLanguage
	ON ClassificationPageSections.PageSectionTypeID = UserPageSectionTypeLanguage.PageSectionTypeID
LEFT JOIN (SELECT 
			PageSectionTypeLanguages.PageSectionTypeID
			, PageSectionTypeLanguages.Name
		FROM PageSectionTypeLanguages
		JOIN Settings
			ON Settings.IntValue = PageSectionTypeLanguages.LanguageID ) DefaultPageSectionTypeLanguage
	ON ClassificationPageSections.PageSectionTypeID = DefaultPageSectionTypeLanguage.PageSectionTypeID
LEFT JOIN (SELECT 
			ContentTypeLanguages.ContentTypeID
			, ContentTypeLanguages.Name
		FROM ContentTypeLanguages
		WHERE ContentTypeLanguages.LanguageID = @LanguageID) UserContentTypeLanguage
	ON ClassificationPageSections.ContentTypeID = UserContentTypeLanguage.ContentTypeID
LEFT JOIN (SELECT 
			ContentTypeLanguages.ContentTypeID
			, ContentTypeLanguages.Name
		FROM ContentTypeLanguages
		JOIN Settings
			ON Settings.IntValue = ContentTypeLanguages.LanguageID ) DefaultContentTypeLanguage
	ON ClassificationPageSections.ContentTypeID = DefaultContentTypeLanguage.ContentTypeID
LEFT JOIN (SELECT 
			SortByLanguages.SortByID
			, SortByLanguages.Name
		FROM SortByLanguages
		WHERE SortByLanguages.LanguageID = @LanguageID) UserSortByLanguage
	ON ClassificationPageSections.SortByID = UserSortByLanguage.SortByID
LEFT JOIN (SELECT 
			SortByLanguages.SortByID
			, SortByLanguages.Name
		FROM SortByLanguages
		JOIN Settings
			ON Settings.IntValue = SortByLanguages.LanguageID ) DefaultSortByLanguage
	ON ClassificationPageSections.SortByID = DefaultSortByLanguage.SortByID
WHERE (ClassificationPageSections.ClassificationPageSectionID = @ClassificationPageSectionID OR @ClassificationPageSectionID IS NULL) 
	AND ClassificationPageSections.ClassificationPageID = @ClassificationPageID
	ORDER BY Sequence
END