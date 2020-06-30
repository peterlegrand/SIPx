CREATE PROCEDURE [dbo].[usp_SubRegions] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	SubRegions.SubRegionID
	, Regions.RegionID
	, ISNULL( UserSubRegionName.Customization, SubRegionName.Name) SubRegionName
	, ISNULL( UserRegionName.Customization, RegionName.Name) RegionName
FROM SubRegions 
JOIN UITermLanguages SubRegionName
	ON Subregions.NameTermId = SubRegionName.UITermId 
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID) UserSubRegionName
	ON Subregions.NameTermId = UserSubRegionName.UITermId 
JOIN Regions 
	ON Regions.RegionId = SubRegions.RegionID
JOIN UITermLanguages RegionName
	ON Regions.NameTermId = RegionName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserRegionName
	ON Regions.NameTermId = UserRegionName.UITermId  
WHERE RegionName.LanguageId =@LanguageId 
	AND SubRegionName.LanguageId = @LanguageId 
ORDER BY  	ISNULL( UserRegionName.Customization, RegionName.Name) 
	, ISNULL( UserSubRegionName.Customization, SubRegionName.Name) 


