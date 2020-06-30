CREATE PROCEDURE [dbo].[usp_MetaListUITermCustomizations]
AS
SELECT UITerms.UITermId, InternalName, Customization 
FROM UITerms 
JOIN UITermLanguageCustomizations
	ON UITerms.UITermId = UITermLanguageCustomizations.UITermID
WHERE LanguageId =41 
ORDER BY InternalName

