CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizations] (@languageId int) 
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
	ON UITermLanguages.UITermId = UITerms.UITermID
JOIN UITermLanguageCustomizations 
	ON UITermLanguageCustomizations.UITermId = UITerms.UITermID
WHERE UITermLanguages.LanguageId = @LanguageID
	AND UITermLanguageCustomizations.LanguageId = @languageID
