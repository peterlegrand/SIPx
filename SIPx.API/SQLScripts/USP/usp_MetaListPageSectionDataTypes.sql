CREATE PROCEDURE [dbo].[usp_MetaListPageSectionDataTypes]
AS
SELECT PageSectionDataTypes.PageSectionDataTypeID, Name
FROM PageSectionDataTypes 
JOIN UITermLanguages
	ON PageSectionDataTypes.NameTermID = UITermLanguages.UITermID
WHERE LanguageID =41 
ORDER BY Name