CREATE PROCEDURE [dbo].[usp_Regions] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Regions.RegionID 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM Regions
JOIN UITermLanguages UIName
	ON UIName.UITermID = Regions.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = Regions.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = Regions.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = Regions.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = Regions.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = Regions.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = Regions.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = Regions.MouseOverTermID
WHERE UIName.LanguageID = @LanguageID
	AND UIDescription.LanguageID = @LanguageID
	AND UIMenuName.LanguageID = @LanguageID
	AND UIMouseOver.LanguageID = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name) 