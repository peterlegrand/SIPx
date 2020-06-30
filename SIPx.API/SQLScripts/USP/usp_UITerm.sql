CREATE PROCEDURE [dbo].[usp_UITerm] (@UserId nvarchar(450),@UITermId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UITerms.UITermId 
	, UITerms.InternalName
	, UITermLanguages.Name UITermLanguageName
	, UITermLanguages.Description UITermLanguageDescription
	, UITermLanguages.MouseOver UITermLanguageMouseOver
	, ISNULL(Customization, 'No customization') Customization
	, LanguageName.Name
FROM UITerms
JOIN UITermLanguages
	ON UITermLanguages.UITermId = UITerms.UITermID
JOIN Languages
	ON Languages.LanguageID	= UITermLanguages.LanguageID
JOIN UITermLanguages LanguageName
	ON Languages.NameTermId = LanguageName.UITermID
LEFT JOIN UITermLanguageCustomizations 
	ON UITermLanguageCustomizations.UITermId = UITerms.UITermID
		AND UITermLanguageCustomizations.LanguageId = Languages.LanguageID
WHERE UITerms.UITermId = @UITermID
	AND LanguageName.LanguageId = @LanguageID
ORDER BY UITermLanguages.Name 