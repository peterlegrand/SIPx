CREATE PROCEDURE [dbo].[usp_IntermediateRegions] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	IntermediateRegions.IntermediateRegionID
	, ISNULL( UserIntermediateRegionName.Customization, IntermediateRegionName.Name) IntermediateRegionName
FROM IntermediateRegions 
JOIN UITermLanguages IntermediateRegionName
	ON IntermediateRegions.NameTermId = IntermediateRegionName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserIntermediateRegionName
	ON IntermediateRegions.NameTermId = UserIntermediateRegionName.UITermId  
WHERE IntermediateRegionName.LanguageId =@LanguageId 
ORDER BY  	ISNULL( UserIntermediateRegionName.Customization, IntermediateRegionName.Name) 
	

