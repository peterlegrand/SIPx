CREATE PROCEDURE [dbo].[usp_MetaListRegion]
AS
SELECT 
	 Regions.RegionID
	, ISNULL(RegionName.Name,'') Name 
	FROM Regions 
	JOIN UITermLanguages RegionName
		ON Regions.NameTermId = RegionName.UITermId  WHERE RegionName.LanguageId =41  
ORDER BY RegionName.Name

