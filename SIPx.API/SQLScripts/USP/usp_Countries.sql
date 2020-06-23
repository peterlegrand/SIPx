CREATE PROCEDURE [dbo].[usp_Countries] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
		ON Regions.NameTermID = RegionName.UITermID  WHERE RegionName.LanguageID =@LanguageID AND SubRegionName.LanguageID =@LanguageID 
	) SubRegion
ON SubRegion.SubRegionID = Countries.SubRegionID
LEFT JOIN (SELECT IntermediateRegionName.Name, IntermediateRegions.IntermediateRegionID 
	FROM IntermediateRegions
	JOIN UITermLanguages IntermediateRegionName
		ON IntermediateRegions.NameTermID = IntermediateRegionName.UITermID  WHERE LanguageID =@LanguageID 
	) IntermediateRegion
ON IntermediateRegion.IntermediateRegionID = Countries.IntermediateRegionID 
WHERE CountryLanguage.LanguageID =@LanguageID 
ORDER BY CountryLanguage.Name


