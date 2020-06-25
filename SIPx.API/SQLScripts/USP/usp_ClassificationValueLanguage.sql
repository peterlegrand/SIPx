CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguage] (@UserID nvarchar(450), @ClassificationValueLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ClassificationValueLanguages.ClassificationValueLanguageID
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
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValueLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValueLanguages.ModifiedDate
FROM ClassificationValues
JOIN ClassificationValueLanguages
	ON ClassificationValues.ClassificationValueID = ClassificationValueLanguages.ClassificationValueID
JOIN Languages 
	ON Languages.LanguageID = ClassificationValueLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ClassificationValueLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationValueLanguages.ModifierID
WHERE ClassificationValueLanguages.ClassificationValueLanguageID = @ClassificationValueLanguageID
	AND UILanguageName.LanguageID = @LanguageID



