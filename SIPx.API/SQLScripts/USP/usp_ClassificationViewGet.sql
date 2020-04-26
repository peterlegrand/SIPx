CREATE PROCEDURE [dbo].[usp_ClassificationViewGet] (@LanguageID int, @ClassificationID int = NULL)
AS
BEGIN
SELECT
	Classifications.ClassificationID
	, Classifications.HasDropDown
	, Classifications.DropDownSequence
	, ISNULL(UserStatusLanguage.Name, ISNULL(DefaultStatusLanguage.Name, '')) StatusName
	, CAST(CASE WHEN UserStatusLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultStatusLanguage
	, ISNULL(UserClassificationPageLanguage.Name, ISNULL(DefaultClassificationPageLanguage.Name, '')) ClassificationPageName
	, CAST(CASE WHEN UserClassificationLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationLanguage
	, Classifications.CreatedDate
	, Classifications.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) Name
	, ISNULL(UserClassificationLanguage.Description, ISNULL(DefaultClassificationLanguage.Description, '')) Description
	, ISNULL(UserClassificationLanguage.MenuName, ISNULL(DefaultClassificationLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationLanguage.MouseOver, ISNULL(DefaultClassificationLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserStatusLanguage.Name IS NULL AND DefaultClassificationPageLanguage.Name IS NOT NULL THEN 1 ELSE 0 END AS bit) DefaultClassificationPageLanguage
FROM Classifications
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		, ClassificationLanguages.Description
		, ClassificationLanguages.MenuName
		, ClassificationLanguages.MouseOver
		FROM ClassificationLanguages
		WHERE ClassificationLanguages.LanguageID = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT 
		ClassificationLanguages.ClassificationID
		, ClassificationLanguages.Name 
		, ClassificationLanguages.Description
		, ClassificationLanguages.MenuName
		, ClassificationLanguages.MouseOver
		FROM ClassificationLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationID = Classifications.ClassificationID
JOIN AspNetUsers Creator
	ON Creator.Id = Classifications.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = Classifications.ModifierID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		WHERE ClassificationPageLanguages.LanguageID = @LanguageID) UserClassificationPageLanguage
	ON Classifications.DefaultPageID = UserClassificationPageLanguage.ClassificationPageID
LEFT JOIN (SELECT 
		ClassificationPageLanguages.ClassificationPageID
		, ClassificationPageLanguages.Name 
		FROM ClassificationPageLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationPageLanguages.LanguageID ) DefaultClassificationPageLanguage
	ON Classifications.DefaultPageID = DefaultClassificationPageLanguage.ClassificationPageID
LEFT JOIN (SELECT 
		StatusLanguages.StatusID
		, StatusLanguages.Name 
		FROM StatusLanguages
		WHERE StatusLanguages.LanguageID = @LanguageID) UserStatusLanguage
	ON Classifications.DefaultPageID = UserStatusLanguage.StatusID
LEFT JOIN (SELECT 
		StatusLanguages.StatusID
		, StatusLanguages.Name 
		FROM StatusLanguages
		JOIN Settings
			ON Settings.IntValue = StatusLanguages.LanguageID ) DefaultStatusLanguage
	ON Classifications.StatusID = DefaultStatusLanguage.StatusID
WHERE (Classifications.ClassificationID = @ClassificationID OR @ClassificationID IS NULL)
ORDER BY Name
END



