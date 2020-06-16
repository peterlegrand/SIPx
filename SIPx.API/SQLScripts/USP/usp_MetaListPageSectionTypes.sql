CREATE PROCEDURE [dbo].[usp_MetaListPageSectionTypes]
AS
SELECT PageSectionTypes.PageSectionTypeID, Name
FROM PageSectionTypes 
JOIN UITermLanguages
	ON PageSectionTypes.NameTermID = UITermLanguages.UITermID
WHERE LanguageID =41 
ORDER BY Name