CREATE PROCEDURE [dbo].[usp_MetaListUITermCustomizations]
AS
SELECT UITerms.UITermID, InternalName, Customization 
FROM UITerms 
JOIN UITermLanguageCustomizations
	ON UITerms.UITermID = UITermLanguageCustomizations.UITermID
WHERE LanguageID =41 
ORDER BY InternalName

