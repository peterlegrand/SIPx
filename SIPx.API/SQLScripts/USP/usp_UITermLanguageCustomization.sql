CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomization] (@UITermID int, @languageID int) 
AS 
SELECT
	UITerms.UITermID
	, UITermLanguages.LanguageID
	, Customization
	, Name 
	, Description 
	, MouseOver 
	, InternalName
FROM UITermLanguages
JOIN UITerms
	ON UITermLanguages.UITermID = UITerms.UITermID
JOIN UITermLanguageCustomizations 
	ON UITermLanguageCustomizations.UITermID = UITerms.UITermID
WHERE UITermLanguages.LanguageID = @LanguageID
	AND UITermLanguageCustomizations.LanguageID = @languageID
	AND UITermLanguageCustomizations.UITermID = @UITermID
