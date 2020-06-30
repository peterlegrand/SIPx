CREATE PROCEDURE [dbo].[usp_MetaListSubRegion]
AS
SELECT 
	 SubRegions.SuBRegionID
	, ISNULL(SubRegionName.Name, '') SubRegionName
	, SubRegions.RegionID
	, ISNULL(RegionName.Name,'')RegionName 
	FROM SubRegions 
	JOIN UITermLanguages SubRegionName
		ON Subregions.NameTermId = SubRegionName.UITermId 
	JOIN Regions 
		ON Regions.RegionId = SubRegions.RegionID
	JOIN UITermLanguages RegionName
		ON Regions.NameTermId = RegionName.UITermId  WHERE RegionName.LanguageId =41 AND SubRegionName.LanguageId =41 
ORDER BY RegionName, SubregionName
