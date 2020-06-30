CREATE PROCEDURE [dbo].[usp_MetaListPageSectionTypes]
AS
SELECT PageSectionTypes.PageSectionTypeId, Name
FROM PageSectionTypes 
JOIN UITermLanguages
	ON PageSectionTypes.NameTermId = UITermLanguages.UITermID
WHERE LanguageId =41 
ORDER BY Name