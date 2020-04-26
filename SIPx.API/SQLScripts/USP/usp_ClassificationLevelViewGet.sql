CREATE PROCEDURE [dbo].[usp_ClassificationLevelViewGet] (@LanguageID int, @ClassificationID int, @ClassificationLevelID int = NULL)
AS
BEGIN
SELECT
	ClassificationLevels.ClassificationLevelID
	, ClassificationLevels.ClassificationID
	, ISNULL(UserClassificationLanguage.Name, ISNULL(DefaultClassificationLanguage.Name, '')) ClassificationName
	, ClassificationLevels.CreatedDate
	, ClassificationLevels.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier	
	, ClassificationLevels.Sequence
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.CanLink
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
	, ISNULL(UserClassificationLevelLanguage.Name, ISNULL(DefaultClassificationLevelLanguage.Name, '')) Name
	, ISNULL(UserClassificationLevelLanguage.Description, ISNULL(DefaultClassificationLevelLanguage.Description, '')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName, ISNULL(DefaultClassificationLevelLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver, ISNULL(DefaultClassificationLevelLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserClassificationLevelLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultClassificationLevelLanguage
	, ISNULL(UserDateLevelLanguage.Name, ISNULL(DefaultDateLevelLanguage.Name, '')) DateLevelName
	, CAST(CASE WHEN UserDateLevelLanguage.Name IS NULL  THEN 1 ELSE 0 END AS bit) DefaultDateLevelLanguage
FROM ClassificationLevels 
JOIN Classifications
	ON Classifications.ClassificationID = ClassificationLevels.ClassificationID
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
		ClassificationLevelLanguages.ClassificationLevelID
		, ClassificationLevelLanguages.Name 
		, ClassificationLevelLanguages.Description
		, ClassificationLevelLanguages.MenuName
		, ClassificationLevelLanguages.MouseOver
		FROM ClassificationLevelLanguages
		WHERE ClassificationLevelLanguages.LanguageID = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT 
		ClassificationLevelLanguages.ClassificationLevelID
		, ClassificationLevelLanguages.Name 
		, ClassificationLevelLanguages.Description
		, ClassificationLevelLanguages.MenuName
		, ClassificationLevelLanguages.MouseOver
		FROM ClassificationLevelLanguages
		JOIN Settings
			ON Settings.IntValue = ClassificationLevelLanguages.LanguageID 
		WHERE Settings.SettingID = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
JOIN AspNetUsers Creator
	ON Creator.Id = ClassificationLevels.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = ClassificationLevels.ModifierID
LEFT JOIN (SELECT 
			DateLevelLanguages.DateLevelID
			, DateLevelLanguages.Name
		FROM DateLevelLanguages
		WHERE DateLevelLanguages.LanguageID = @LanguageID) UserDateLevelLanguage
	ON ClassificationLevels.DateLevelID = UserDateLevelLanguage.DateLevelID
LEFT JOIN (SELECT 
			DateLevelLanguages.DateLevelID
			, DateLevelLanguages.Name
		FROM DateLevelLanguages
		JOIN Settings
			ON Settings.IntValue = DateLevelLanguages.LanguageID ) DefaultDateLevelLanguage
	ON ClassificationLevels.DateLevelID = DefaultDateLevelLanguage.DateLevelID
WHERE (ClassificationLevels.ClassificationLevelID = @ClassificationLevelID OR @ClassificationLevelID IS NULL) 
	AND ClassificationLevels.ClassificationID = @ClassificationID
	ORDER BY ClassificationLevels.Sequence
END
