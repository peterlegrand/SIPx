CREATE PROCEDURE [dbo].[usp_SubRegions] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	SubRegions.SubRegionID
	, Regions.RegionID
	, ISNULL( UserSubRegionName.Customization, SubRegionName.Name) SubRegionName
	, ISNULL( UserRegionName.Customization, RegionName.Name) RegionName
FROM SubRegions 
JOIN UITermLanguages SubRegionName
	ON Subregions.NameTermID = SubRegionName.UITermID 
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID) UserSubRegionName
	ON Subregions.NameTermID = UserSubRegionName.UITermID 
JOIN Regions 
	ON Regions.RegionID = SubRegions.RegionID
JOIN UITermLanguages RegionName
	ON Regions.NameTermID = RegionName.UITermID  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID)  UserRegionName
	ON Regions.NameTermID = UserRegionName.UITermID  
WHERE RegionName.LanguageID =@LanguageID 
	AND SubRegionName.LanguageID = @LanguageID 
ORDER BY  	ISNULL( UserRegionName.Customization, RegionName.Name) 
	, ISNULL( UserSubRegionName.Customization, SubRegionName.Name) 


