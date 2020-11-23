CREATE PROCEDURE usp_ClassificationLevelPropertyList (@UserId nvarchar(450), @ClassificationLevelId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationLevelProperties.ClassificationLevelPropertyID
	, ISNULL(PropertyUserLanguage.Name,ISNULL(PropertyDefaultLanguage.Name,'No name for this Property')) Name
FROM ClassificationLevelProperties 
JOIN Properties
	ON Properties.PropertyID = ClassificationLevelProperties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) PropertyUserLanguage
	ON PropertyUserLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) PropertyDefaultLanguage
	ON PropertyDefaultLanguage.PropertyId = Properties.PropertyID
WHERE ClassificationLevelProperties.ClassificationLevelID = @ClassificationLevelId