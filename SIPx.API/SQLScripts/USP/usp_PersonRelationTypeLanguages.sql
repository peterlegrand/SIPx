CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguages] (@UserId nvarchar(450), @PersonRelationTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT PersonRelationTypeLanguages.PersonRelationTypeLanguageID
	, PersonRelationTypeLanguages.LanguageID
	, PersonRelationTypeLanguages.Name
	, PersonRelationTypeLanguages.Description
	, PersonRelationTypeLanguages.MenuName
	, PersonRelationTypeLanguages.MouseOver
	, PersonRelationTypeLanguages.FromIsAnXOfTo
	, PersonRelationTypeLanguages.ToIsAnXOfFrom
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, PersonRelationTypeLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, PersonRelationTypeLanguages.ModifiedDate
FROM PersonRelationTypes
JOIN PersonRelationTypeLanguages
	ON PersonRelationTypes.PersonRelationTypeId = PersonRelationTypeLanguages.PersonRelationTypeID
JOIN Languages 
	ON Languages.LanguageId = PersonRelationTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = PersonRelationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonRelationTypeLanguages.ModifierID
WHERE PersonRelationTypes.PersonRelationTypeId = @PersonRelationTypeID
	AND UILanguageName.LanguageId = @LanguageID
ORDER BY ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name)

