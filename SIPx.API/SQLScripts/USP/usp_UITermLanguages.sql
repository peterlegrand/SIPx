CREATE PROCEDURE [dbo].[usp_UITermLanguages] (@languageID int) 
AS 
SELECT
	UITermLanguages.UITermLanguageID
	, UITerms.UITermID
	, Name 
	, Description 
	, MouseOver 
	, InternalName
FROM UITermLanguages
JOIN UITerms
	ON UITermLanguages.UITermID = UITerms.UITermID
WHERE LanguageID = @LanguageID
