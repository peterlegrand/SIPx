CREATE PROCEDURE [dbo].[usp_ClassificationLanguageIndexGet] (@UserId nvarchar(450), @ClassificationId int) 
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
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Creator.PersonID ModifierID
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
WHERE Classifications.ClassificationId = @ClassificationID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)