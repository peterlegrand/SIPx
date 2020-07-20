CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguageIndex] (@UserId nvarchar(450), @ClassificationValueId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationValueLanguages.ClassificationValueLanguageID
	, ClassificationValueLanguages.ClassificationValueID
	, ClassificationValueLanguages.ClassificationID
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) ClassificationName
	, ClassificationValueLanguages.LanguageID
	, ClassificationValueLanguages.Name
	, ClassificationValueLanguages.Description
	, ClassificationValueLanguages.MenuName
	, ClassificationValueLanguages.MouseOver
	, ClassificationValueLanguages.PageName
	, ClassificationValueLanguages.PageDescription
	, ClassificationValueLanguages.HeaderName
	, ClassificationValueLanguages.HeaderDescription
	, ClassificationValueLanguages.TopicName
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationValueLanguages.CreatedDate
	, ClassificationValueLanguages.CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationValueLanguages.ModifiedDate
	, ClassificationValueLanguages.ModifierID
FROM ClassificationValues
JOIN Classifications
	ON ClassificationValues.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN ClassificationValueLanguages
	ON ClassificationValues.ClassificationValueId = ClassificationValueLanguages.ClassificationValueID
JOIN Languages 
	ON Languages.LanguageId = ClassificationValueLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueLanguages.ModifierID
WHERE ClassificationValues.ClassificationValueId = @ClassificationValueID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)


