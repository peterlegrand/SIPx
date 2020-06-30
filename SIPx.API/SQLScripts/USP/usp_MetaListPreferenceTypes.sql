CREATE PROCEDURE [dbo].[usp_MetaListPreferenceTypes]
AS
SELECT PreferenceTypes.PreferenceTypeId, Name
FROM PreferenceTypes 
JOIN UITermLanguages
	ON PreferenceTypes.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name