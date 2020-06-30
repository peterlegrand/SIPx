CREATE PROCEDURE [dbo].[usp_Countries] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	Countries.CountryID
	, ForeignName
	, ISO31662
	, ISO31663
	, ISO3166Num
	, CountryLanguage.Name CountryName
	, ISNULL(SubRegion.SubRegionId,0) SubRegionID
	, ISNULL(SubRegion.SubregionName, '') SubRegionName
	, ISNULL(SubRegion.RegionId, 0)RegionID
	, ISNULL(SubRegion.RegionName,'')RegionName 
	, ISNULL(IntermediateRegion.IntermediateRegionId,0)IntermediateRegionId 
	, ISNULL(IntermediateRegion.Name,'') IntermediateRegionName
FROM Countries 
JOIN UITermLanguages CountryLanguage 
	ON Countries.NameTermId = CountryLanguage.UITermId 
LEFT JOIN (
	SELECT SubRegionName.Name as SubregionName , SubRegionId, Regions.RegionId, RegionName.Name RegionName
	FROM SubRegions 
	JOIN UITermLanguages SubRegionName
		ON Subregions.NameTermId = SubRegionName.UITermId 
	JOIN Regions 
		ON Regions.RegionId = SubRegions.RegionID
	JOIN UITermLanguages RegionName
		ON Regions.NameTermId = RegionName.UITermId  WHERE RegionName.LanguageId =@LanguageId AND SubRegionName.LanguageId =@LanguageId 
	) SubRegion
ON SubRegion.SubRegionId = Countries.SubRegionID
LEFT JOIN (SELECT IntermediateRegionName.Name, IntermediateRegions.IntermediateRegionId 
	FROM IntermediateRegions
	JOIN UITermLanguages IntermediateRegionName
		ON IntermediateRegions.NameTermId = IntermediateRegionName.UITermId  WHERE LanguageId =@LanguageId 
	) IntermediateRegion
ON IntermediateRegion.IntermediateRegionId = Countries.IntermediateRegionId 
WHERE CountryLanguage.LanguageId =@LanguageId 
ORDER BY CountryLanguage.Name


