CREATE PROCEDURE [dbo].[usp_MetaListUITerms]
AS
SELECT UITerms.UITermId, InternalName, Name 
FROM UITerms 
JOIN UITermLanguages
	ON UITerms.UITermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY InternalName

