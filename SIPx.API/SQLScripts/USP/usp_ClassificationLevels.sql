CREATE PROCEDURE [dbo].[usp_ClassificationLevels] (@UserID nvarchar(450), @ClassificationID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationLevels.ClassificationLevelID
	, ISNULL(UserClassificationLevelLanguage.Name,ISNULL(DefaultClassificationLevelLanguage.Name,'No name for this role')) Name
	, ISNULL(UserClassificationLevelLanguage.Description,ISNULL(DefaultClassificationLevelLanguage.Description,'No description for this role')) Description
	, ISNULL(UserClassificationLevelLanguage.MenuName,ISNULL(DefaultClassificationLevelLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserClassificationLevelLanguage.MouseOver,ISNULL(DefaultClassificationLevelLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UIDateLevelNameCustom.Customization,UIDateLevelName.Name) DateLevelName
	, ClassificationLevels.Sequence
	, ClassificationLevels.Alphabetically
	, ClassificationLevels.OnTheFly
	, ClassificationLevels.InDropDown
	, ClassificationLevels.InMenu
FROM ClassificationLevels 
LEFT JOIN (SELECT ClassificationLevelID, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages WHERE LanguageID = @LanguageID) UserClassificationLevelLanguage
	ON UserClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
LEFT JOIN (SELECT ClassificationLevelID, Name, Description, MenuName, MouseOver FROM ClassificationLevelLanguages JOIN Settings ON ClassificationLevelLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationLevelLanguage
	ON DefaultClassificationLevelLanguage.ClassificationLevelID = ClassificationLevels.ClassificationLevelID
JOIN DateLevels 
	ON DateLevels.DateLevelID = ClassificationLevels.DateLevelID
JOIN UITermLanguages UIDateLevelName
	ON UIDateLevelName.UITermID = DateLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDateLevelNameCustom
	ON UIDateLevelNameCustom.UITermID = DateLevels.NameTermID
WHERE ClassificationLevels.ClassificationID = @ClassificationID
ORDER BY ClassificationLevels.Sequence
