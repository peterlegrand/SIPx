CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeLanguageIndexGet] (@UserId nvarchar(450), @ClassificationRelationTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationRelationTypeLanguages.ClassificationRelationTypeLanguageID
	, ClassificationRelationTypeLanguages.ClassificationRelationTypeID
	, ClassificationRelationTypeLanguages.LanguageID
	, ClassificationRelationTypeLanguages.Name
	, ClassificationRelationTypeLanguages.Description
	, ClassificationRelationTypeLanguages.MenuName
	, ClassificationRelationTypeLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationRelationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationRelationTypeLanguages.ModifiedDate
FROM ClassificationRelationTypes
JOIN ClassificationRelationTypeLanguages
	ON ClassificationRelationTypes.ClassificationRelationTypeId = ClassificationRelationTypeLanguages.ClassificationRelationTypeID
JOIN Languages 
	ON Languages.LanguageId = ClassificationRelationTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ClassificationRelationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationRelationTypeLanguages.ModifierID
WHERE ClassificationRelationTypes.ClassificationRelationTypeId = @ClassificationRelationTypeID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)



