CREATE PROCEDURE [dbo].[usp_PersonRelationTypeLanguage] (@UserID nvarchar(450), @PersonRelationTypeLanguageID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

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
	ON PersonRelationTypes.PersonRelationTypeID = PersonRelationTypeLanguages.PersonRelationTypeID
JOIN Persons Creator
	ON Creator.UserID = PersonRelationTypeLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = PersonRelationTypeLanguages.ModifierID
JOIN Languages 
	ON Languages.LanguageID = PersonRelationTypeLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermID = Languages.NameTermID
WHERE PersonRelationTypeLanguages.PersonRelationTypeLanguageID = @PersonRelationTypeLanguageID
	AND UILanguageName.LanguageID = @LanguageID


