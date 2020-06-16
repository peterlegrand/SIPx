CREATE PROCEDURE [dbo].[usp_MetaListCountry]
AS
SELECT 
	Countries.CountryID
	, ForeignName
	, ISO31662
	, ISO31663
	, ISO3166Num
	, CountryLanguage.Name CountryName
	, ISNULL(SubRegion.SubRegionID,0) SubRegionID
	, ISNULL(SubRegion.SubregionName, '') SubRegionName
	, ISNULL(SubRegion.RegionID, 0)RegionID
	, ISNULL(SubRegion.RegionName,'')RegionName 
	, ISNULL(IntermediateRegion.IntermediateRegionID,0)IntermediateRegionID 
	, ISNULL(IntermediateRegion.Name,'') IntermediateRegionName
FROM Countries 
JOIN UITermLanguages CountryLanguage 
	ON Countries.NameTermID = CountryLanguage.UITermID 
LEFT JOIN (
	SELECT SubRegionName.Name as SubregionName , SubRegionID, Regions.RegionID, RegionName.Name RegionName
	FROM SubRegions 
	JOIN UITermLanguages SubRegionName
		ON Subregions.NameTermID = SubRegionName.UITermID 
	JOIN Regions 
		ON Regions.RegionID = SubRegions.RegionID
	JOIN UITermLanguages RegionName
		ON Regions.NameTermID = RegionName.UITermID  WHERE RegionName.LanguageID =41 AND SubRegionName.LanguageID =41 
	) SubRegion
ON SubRegion.SubRegionID = Countries.SubRegionID
LEFT JOIN (SELECT IntermediateRegionName.Name, IntermediateRegions.IntermediateRegionID 
	FROM IntermediateRegions
	JOIN UITermLanguages IntermediateRegionName
		ON IntermediateRegions.NameTermID = IntermediateRegionName.UITermID  WHERE LanguageID =41 
	) IntermediateRegion
ON IntermediateRegion.IntermediateRegionID = Countries.IntermediateRegionID 
WHERE CountryLanguage.LanguageID =41 
ORDER BY CountryLanguage.Name
