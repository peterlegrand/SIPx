CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeLanguage] (@UserID nvarchar(450), @ClassificationRelationTypeLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT ClassificationRelationTypes.ClassificationRelationTypeID 
	, ClassificationRelationTypeLanguages.ClassificationRelationTypeLanguageID
	, ClassificationRelationTypeLanguages.LanguageID
	, ClassificationRelationTypeLanguages.Name
	, ClassificationRelationTypeLanguages.Description
	, ClassificationRelationTypeLanguages.MenuName
	, ClassificationRelationTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationRelationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationRelationTypeLanguages.ModifiedDate
FROM ClassificationRelationTypes
JOIN ClassificationRelationTypeLanguages
	ON ClassificationRelationTypes.ClassificationRelationTypeID = ClassificationRelationTypeLanguages.ClassificationRelationTypeID
JOIN Languages 
	ON Languages.LanguageID = ClassificationRelationTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ClassificationRelationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationRelationTypeLanguages.ModifierID
WHERE ClassificationRelationTypeLanguages.ClassificationRelationTypeLanguageID = @ClassificationRelationTypeLanguageID
	AND UILanguageName.LanguageID = @LanguageID
