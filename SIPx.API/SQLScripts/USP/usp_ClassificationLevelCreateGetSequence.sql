CREATE PROCEDURE [dbo].[usp_ClassificationLevelCreateGetSequence] (@UserId nvarchar(450), @ClassificationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevels.Sequence
	, ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this level')) Name
FROM ClassificationLevels 
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages WHERE LanguageId = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelId, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelId = ClassificationLevels.ClassificationLevelID
WHERE ClassificationLevels.ClassificationID = @ClassificationId
ORDER BY  ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this level'))

