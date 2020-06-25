CREATE PROCEDURE [dbo].[usp_ClassificationPageLanguages] (@UserID nvarchar(450), @ClassificationPageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON ClassificationPages.ClassificationPageID = ClassificationPageLanguages.ClassificationPageID
JOIN Languages 
	ON Languages.LanguageID = ClassificationPageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ClassificationPageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationPageLanguages.ModifierID
WHERE ClassificationPages.ClassificationPageID = @ClassificationPageID
	AND UILanguageName.LanguageID = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)



