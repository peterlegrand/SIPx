CREATE PROCEDURE [dbo].[usp_ClassificationLanguage] (@UserID nvarchar(450), @ClassificationLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON Classifications.ClassificationID = ClassificationLanguages.ClassificationID
JOIN Languages 
	ON Languages.LanguageID = ClassificationLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ClassificationLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationLanguages.ModifierID
WHERE Classifications.ClassificationLanguageID = @ClassificationLanguageID
	AND UILanguageName.LanguageID = @LanguageID