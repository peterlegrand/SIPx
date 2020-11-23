CREATE PROCEDURE usp_ClassificationLevelPropertyCreateGetPropertyList (@UserId nvarchar(450), @ClassificationLevelId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Properties.PropertyID 
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this Property')) Name
FROM Properties
LEFT JOIN (SELECT PropertyId, Name, Description, MenuName, MouseOver FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyId = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name, Description, MenuName, MouseOver FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID
WHERE Properties.PropertyID NOT IN(SELECT PropertyID FROM ClassificationLevelProperties WHERE ClassificationLevelID = @ClassificationLevelId) 
ORDER BY ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this Property'))

