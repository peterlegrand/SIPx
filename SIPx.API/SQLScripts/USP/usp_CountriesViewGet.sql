CREATE PROCEDURE [dbo].[usp_CountriesViewGet] (@LanguageID int)
AS
BEGIN
SELECT
	CountryLanguages.CountryID
	, CountryLanguages.Name
	, Countries.ForeignName
	, Countries.ISO31662
	, Countries.ISO31663
	, Countries.ISO3166Num
	, ISNULL(SubRegionName,'') SubRegionName
	, ISNULL(SubRegionDescription,'') SubRegionDescription
	, ISNULL(SubRegionMenuName,'') SubRegionMenuName
	, ISNULL(SubRegionMouseOver,'') SubRegionMouseOver
	, ISNULL(RegionName,'') RegionName
	, ISNULL(RegionDescription,'') RegionDescription
	, ISNULL(RegionMenuName,'') RegionMenuName
	, ISNULL(RegionMouseOver,'') RegionMouseOver
FROM Countries
JOIN CountryLanguages
	ON Countries.CountryID = CountryLanguages.CountryID
LEFT JOIN (
	SELECT SubRegionLanguages.SubRegionID
		, SubRegionLanguages.Name SubRegionName
		, SubRegionLanguages.Description SubRegionDescription
		, SubRegionLanguages.MenuName SubRegionMenuName
		, SubRegionLanguages.MouseOver SubRegionMouseOver
		, ISNULL(RegionName, '') RegionName
		, ISNULL(RegionDescription, '') RegionDescription
		, ISNULL(RegionMenuName, '') RegionMenuName
		, ISNULL(RegionMouseOver, '') RegionMouseOver
	FROM SubRegions
	JOIN SubRegionLanguages	
		ON SubRegions.SubRegionID = SubRegionLanguages.SubRegionID
	LEFT JOIN (	SELECT RegionLanguages.RegionID
		, RegionLanguages.Name RegionName
		, RegionLanguages.Description RegionDescription
		, RegionLanguages.MenuName RegionMenuName
		, RegionLanguages.MouseOver RegionMouseOver
	FROM RegionLanguages
	WHERE RegionLanguages.LanguageID = @LanguageID) AS Region
		ON Region.RegionID = SubRegions.RegionID
	WHERE SubRegionLanguages.LanguageID = @LanguageID) AS SubRegion
		ON SubRegion.SubRegionID = Countries.SubRegionID
	
WHERE CountryLanguages.LanguageID = @LanguageID
ORDER BY Name
END
