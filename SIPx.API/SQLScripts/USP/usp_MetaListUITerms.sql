CREATE PROCEDURE [dbo].[usp_MetaListUITerms]
AS
SELECT UITerms.UITermID, InternalName, Name 
FROM UITerms 
JOIN UITermLanguages
	ON UITerms.UITermID = UITermLanguages.UITermID
WHERE LanguageID =41 
ORDER BY InternalName

