CREATE PROCEDURE [dbo].[usp_ClassificationLanguage] (@UserId nvarchar(450), @ClassificationLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationLanguages.ClassificationLanguageID
	, ClassificationLanguages.LanguageID
	, ClassificationLanguages.Name
	, ClassificationLanguages.Description
	, ClassificationLanguages.MenuName
	, ClassificationLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationLanguages.ModifiedDate
FROM Classifications
JOIN ClassificationLanguages
	ON Classifications.ClassificationId = ClassificationLanguages.ClassificationID
JOIN Languages 
	ON Languages.LanguageId = ClassificationLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationLanguages.ModifierID
WHERE ClassificationLanguages.ClassificationLanguageId = @ClassificationLanguageID
	AND UILanguageName.LanguageId = @LanguageID
