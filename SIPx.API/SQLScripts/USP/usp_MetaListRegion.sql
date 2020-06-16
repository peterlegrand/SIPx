CREATE PROCEDURE [dbo].[usp_MetaListRegion]
AS
SELECT 
	 Regions.RegionID
	, ISNULL(RegionName.Name,'') Name 
	FROM Regions 
	JOIN UITermLanguages RegionName
		ON Regions.NameTermID = RegionName.UITermID  WHERE RegionName.LanguageID =41  
ORDER BY RegionName.Name

