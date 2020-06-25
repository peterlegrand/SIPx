CREATE PROCEDURE [dbo].[usp_UITerm] (@UserID nvarchar(450),@UITermID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT UITerms.UITermID 
	, UITerms.InternalName
	, UITermLanguages.Name UITermLanguageName
	, UITermLanguages.Description UITermLanguageDescription
	, UITermLanguages.MouseOver UITermLanguageMouseOver
	, ISNULL(Customization, 'No customization') Customization
	, LanguageName.Name
FROM UITerms
JOIN UITermLanguages
	ON UITermLanguages.UITermID = UITerms.UITermID
JOIN Languages
	ON Languages.LanguageID	= UITermLanguages.LanguageID
JOIN UITermLanguages LanguageName
	ON Languages.NameTermID = LanguageName.UITermID
LEFT JOIN UITermLanguageCustomizations 
	ON UITermLanguageCustomizations.UITermID = UITerms.UITermID
		AND UITermLanguageCustomizations.LanguageID = Languages.LanguageID
WHERE UITerms.UITermID = @UITermID
	AND LanguageName.LanguageID = @LanguageID
ORDER BY UITermLanguages.Name 