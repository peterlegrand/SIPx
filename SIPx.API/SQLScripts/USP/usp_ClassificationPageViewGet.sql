CREATE PROCEDURE [dbo].[usp_ClassificationPageViewGet] (@LanguageID int, @ClassificationID int, @ClassificationPageID int = NULL)
AS
BEGIN
SELECT
	ClassificationPages.ClassificationPageID
	, ClassificationPages.ClassificationID
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) ClassificationName
	, ClassificationPages.CreatedDate
	, ClassificationPages.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier	
	, ClassificationPages.ShowTitleName
	, ClassificationPages.ShowTitleDescription
	, ISNULL(UserClassificationPageLanguage.Name, ISNULL(DefaultClassificationPageLanguage.Name, '')) Name
	, ISNULL(UserClassificationPageLanguage.Description, ISNULL(DefaultClassificationPageLanguage.Description, '')) Description
	, ISNULL(UserClassificationPageLanguage.MenuName, ISNULL(DefaultClassificationPageLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationPageLanguage.MouseOver, ISNULL(DefaultClassificationPageLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserClassificationPageLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationPageLanguage
	, ISNULL(UserStatusLanguage.Name, ISNULL(DefaultStatusLanguage.Name, '')) StatusName
	, CAST(CASE WHEN UserStatusLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultStatusLanguage
FROM ClassificationPages 
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
		, ClassificationPageLanguages.Description
		, ClassificationPageLanguages.MenuName
		, ClassificationPageLanguages.MouseOver
		FROM ClassificationPageLanguages
		WHERE ClassificationPageLanguages.LanguageID = @LanguageID) UserClassificationPageLanguage
	ON UserClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		, ClassificationPageLanguages.Description
		, ClassificationPageLanguages.MenuName
		, ClassificationPageLanguages.MouseOver
		FROM ClassificationPageLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationPageLanguage
	ON DefaultClassificationPageLanguage.ClassificationPageID = ClassificationPages.ClassificationPageID
JOIN AspNetUsers Creator
	ON Creator.Id = ClassificationPages.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ClassificationPages.ModifierID
LEFT JOIN (SELECT 
			StatusLanguages.StatusID
			, StatusLanguages.Name
		FROM StatusLanguages
		WHERE StatusLanguages.LanguageID = @LanguageID) UserStatusLanguage
	ON ClassificationPages.StatusID = UserStatusLanguage.StatusID
LEFT JOIN (SELECT 
			StatusLanguages.StatusID
			, StatusLanguages.Name
		FROM StatusLanguages
		JOIN Settings
			ON Settings.IntValue = StatusLanguages.LanguageID ) DefaultStatusLanguage
	ON ClassificationPages.StatusID = DefaultStatusLanguage.StatusID
WHERE (ClassificationPages.ClassificationPageID = @ClassificationPageID OR @ClassificationPageID IS NULL) 
	AND ClassificationPages.ClassificationID = @ClassificationID
	ORDER BY Name
END