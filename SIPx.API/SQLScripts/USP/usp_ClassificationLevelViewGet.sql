CREATE PROCEDURE usp_ClassificationLevelViewGet (@LanguageID int, @ClassificationID int , @ClassificationLevelID int = NULL)
AS
BEGIN
SELECT
	ClassificationLevels.ClassificationLevelID
	, ClassificationLevels.Sequence
	, ClassificationLevels.DateLevelID
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.CanLink
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
	, DateLevelLanguages.Name DateLevelNameName
	, DateLevelLanguages.Description DateLevelDescription
	, DateLevelLanguages.MenuName DateLevelMenuName
	, DateLevelLanguages.MouseOver DateLevelMouseOver
	, ClassificationLevels.CreatedDate
	, ClassificationLevels.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
	, ISNULL(UserClassificationLevelLanguage.Name, ISNULL(DefaultClassificationLevelLanguage.Name, '')) Name
	, ISNULL(UserClassificationLevelLanguage.Description, ISNULL(DefaultClassificationLevelLanguage.Description, '')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName, ISNULL(DefaultClassificationLevelLanguage.MenuName, '')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver, ISNULL(DefaultClassificationLevelLanguage.MouseOver, '')) MouseOver
	, CAST(CASE WHEN UserClassificationLevelLanguage.Name IS NULL AND DefaultClassificationLevelLanguage.Name IS NOT NULL THEN 1 ELSE 0 END AS bit) DefaultClassificationLevelLanguage
FROM ClassificationLevels
JOIN DateLevelLanguages 
	ON ClassificationLevels.DateLevelID = DateLevelLanguages.DateLevelID
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
WHERE (ClassificationLevels.ClassificationLevelID = @ClassificationLevelID OR @ClassificationLevelID IS NULL) AND ClassificationLevels.ClassificationID = @ClassificationID
ORDER BY ClassificationLevels.Sequence
END




