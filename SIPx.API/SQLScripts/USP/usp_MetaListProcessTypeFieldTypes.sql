CREATE PROCEDURE [dbo].[usp_MetaListProcessTypeFieldTypes]
AS
SELECT ProcessTypeFieldTypes.ProcessTypeFieldTypeId, Name
FROM ProcessTypeFieldTypes 
JOIN UITermLanguages
	ON ProcessTypeFieldTypes.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name