CREATE PROCEDURE [dbo].[usp_MetaListCountry]
AS
SELECT 
	Countries.CountryID
	, ForeignName
	, ISO31662
	, ISO31663
	, ISO3166Num
	, CountryLanguage.Name CountryName
	, SubRegion.SuRegionID
	, ISNULL(SubRegion.SubregionName, '') SubRegionName
	, SubRegion.RegionID
	, ISNULL(SubRegion.RegionName,'')RegionName 
	, IntermediateRegion.IntermediateRegionID
	, ISNULL(IntermediateRegion.Name,'') IntermediateRegionName
FROM Countries 
JOIN UITermLanguages CountryLanguage 
	ON Countries.NameTermID = CountryLanguage.UITermID 
LEFT JOIN (
	SELECT SubRegionName.Name as SubregionName , SuRegionID, Regions.RegionID, RegionName.Name RegionName
	FROM SubRegions 
	JOIN UITermLanguages SubRegionName
		ON Subregions.NameTermID = SubRegionName.UITermID 
	JOIN Regions 
		ON Regions.RegionID = SubRegions.RegionID
	JOIN UITermLanguages RegionName
		ON Regions.NameTermID = RegionName.UITermID  WHERE RegionName.LanguageID =41 AND SubRegionName.LanguageID =41 
	) SubRegion
ON SubRegion.SuRegionID = Countries.SuRegionID
LEFT JOIN (SELECT IntermediateRegionName.Name, IntermediateRegions.IntermediateRegionID 
	FROM IntermediateRegions
	JOIN UITermLanguages IntermediateRegionName
		ON IntermediateRegions.NameTermID = IntermediateRegionName.UITermID  WHERE LanguageID =41 
	) IntermediateRegion
ON IntermediateRegion.IntermediateRegionID = Countries.IntermediateRegionID 
WHERE CountryLanguage.LanguageID =41 
ORDER BY CountryLanguage.Name
