CREATE PROCEDURE [dbo].[usp_ClassificationLevelLanguageUpdateGet] (@UserId nvarchar(450), @ClassificationLevelLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ClassificationLevel' AND Action = 'LanguageUpdate';
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ReadLogClassificationLevelLanguageCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @ClassificationLevelLanguageId, @UserId, Getdate(), @ScreenId)

SELECT ClassificationLevelLanguages.ClassificationLevelLanguageID
	, ClassificationLevelLanguages.ClassificationID
	, ClassificationLevelLanguages.ClassificationLevelID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ClassificationLevelLanguages.LanguageID
	, ClassificationLevelLanguages.Name
	, ClassificationLevelLanguages.Description
	, ClassificationLevelLanguages.MenuName
	, ClassificationLevelLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationLevelLanguages.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationLevelLanguages.ModifiedDate
	, Modifier.PersonID ModifierID
FROM ClassificationLevels
JOIN ClassificationLevelLanguages
	ON ClassificationLevels.ClassificationLevelId = ClassificationLevelLanguages.ClassificationLevelID
JOIN Classifications
	ON ClassificationLevels.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN Languages 
	ON Languages.LanguageId = ClassificationLevelLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationLevelLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationLevelLanguages.ModifierID
WHERE ClassificationLevelLanguages.ClassificationLevelLanguageId = @ClassificationLevelLanguageID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)




COMMIT TRANSACTION