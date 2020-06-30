CREATE PROCEDURE [dbo].[usp_ClassificationPageLanguage] (@UserId nvarchar(450), @ClassificationPageLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationPageLanguages.ClassificationPageLanguageID
	, ClassificationPageLanguages.LanguageID
	, ClassificationPageLanguages.Name
	, ClassificationPageLanguages.Description
	, ClassificationPageLanguages.MenuName
	, ClassificationPageLanguages.MouseOver
	, ClassificationPageLanguages.TitleName
	, ClassificationPageLanguages.TitleDescription
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationPageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationPageLanguages.ModifiedDate
FROM ClassificationPages
JOIN ClassificationPageLanguages
	ON ClassificationPages.ClassificationPageId = ClassificationPageLanguages.ClassificationPageID
JOIN Languages 
	ON Languages.LanguageId = ClassificationPageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationPageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationPageLanguages.ModifierID
WHERE ClassificationPageLanguages.ClassificationPageLanguageId = @ClassificationPageLanguageID
	AND UILanguageName.LanguageId = @LanguageID



