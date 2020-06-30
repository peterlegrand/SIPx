CREATE PROCEDURE [dbo].[usp_UITermLanguages] (@languageId int) 
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
	ON UITermLanguages.UITermId = UITerms.UITermID
WHERE LanguageId = @LanguageID
