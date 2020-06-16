CREATE PROCEDURE [dbo].[usp_MetaListSubRegion]
AS
SELECT 
	 SubRegions.SuBRegionID
	, ISNULL(SubRegionName.Name, '') SubRegionName
	, SubRegions.RegionID
	, ISNULL(RegionName.Name,'')RegionName 
	FROM SubRegions 
	JOIN UITermLanguages SubRegionName
		ON Subregions.NameTermID = SubRegionName.UITermID 
	JOIN Regions 
		ON Regions.RegionID = SubRegions.RegionID
	JOIN UITermLanguages RegionName
		ON Regions.NameTermID = RegionName.UITermID  WHERE RegionName.LanguageID =41 AND SubRegionName.LanguageID =41 
ORDER BY RegionName, SubregionName
