CREATE PROCEDURE [dbo].[usp_MetaListPreferenceTypes]
AS
SELECT PreferenceTypes.PreferenceTypeID, Name
FROM PreferenceTypes 
JOIN UITermLanguages
	ON PreferenceTypes.NameTermID = UITermLanguages.UITermID
WHERE LanguageID =41 
ORDER BY Name