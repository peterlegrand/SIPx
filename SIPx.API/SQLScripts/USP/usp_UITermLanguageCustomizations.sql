CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizations] (@languageID int) 
AS 
SELECT
	UITerms.UITermID
	, Name 
	, Description 
	, MouseOver 
	, InternalName
FROM UITermLanguages
JOIN UITerms
	ON UITermLanguages.UITermID = UITerms.UITermID
WHERE LanguageID = @LanguageID
