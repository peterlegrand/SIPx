CREATE PROCEDURE [dbo].[usp_MetaListPageSectionDataTypes]
AS
SELECT PageSectionDataTypes.PageSectionDataTypeId, Name
FROM PageSectionDataTypes 
JOIN UITermLanguages
	ON PageSectionDataTypes.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name