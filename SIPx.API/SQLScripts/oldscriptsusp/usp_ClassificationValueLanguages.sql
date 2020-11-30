CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguages] (@UserId nvarchar(450), @ClassificationValueId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

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


