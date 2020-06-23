CREATE PROCEDURE [dbo].[usp_IntermediateRegions] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	IntermediateRegions.IntermediateRegionID
	, ISNULL( UserIntermediateRegionName.Customization, IntermediateRegionName.Name) IntermediateRegionName
FROM IntermediateRegions 
JOIN UITermLanguages IntermediateRegionName
	ON IntermediateRegions.NameTermID = IntermediateRegionName.UITermID  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID)  UserIntermediateRegionName
	ON IntermediateRegions.NameTermID = UserIntermediateRegionName.UITermID  
WHERE IntermediateRegionName.LanguageID =@LanguageID 
ORDER BY  	ISNULL( UserIntermediateRegionName.Customization, IntermediateRegionName.Name) 
	

