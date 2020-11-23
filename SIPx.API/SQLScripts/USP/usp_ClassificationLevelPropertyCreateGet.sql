CREATE PROCEDURE usp_ClassificationLevelPropertyCreateGet (@UserId nvarchar(450), @ClassificationLevelId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT
	ClassificationLevels.ClassificationLevelID
	, ClassificationLevels.ClassificationID
	, ISNULL(ClassificationLevelUserLanguage.Name,ISNULL(ClassificationLevelDefaultLanguage.Name,'No description for this classification level')) ClassificationLevelName
	, ISNULL(ClassificationUserLanguage.Name,ISNULL(ClassificationDefaultLanguage.Name,'No description for this classification')) ClassificationName
FROM ClassificationLevels 
LEFT JOIN (SELECT ClassificationLevelId, Name  FROM ClassificationLevelLanguages WHERE LanguageId = @LanguageID) ClassificationLevelUserLanguage
	ON ClassificationLevelUserLanguage.ClassificationLevelID= ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelId, Name FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ClassificationLevelDefaultLanguage
	ON ClassificationLevelDefaultLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationId, Name  FROM ClassificationLanguages WHERE LanguageId = @LanguageID) ClassificationUserLanguage
	ON ClassificationUserLanguage.ClassificationID= ClassificationLevels.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ClassificationDefaultLanguage
	ON ClassificationDefaultLanguage.ClassificationId = ClassificationLevels.ClassificationID
WHERE ClassificationLevels.ClassificationLevelID = @ClassificationLevelId