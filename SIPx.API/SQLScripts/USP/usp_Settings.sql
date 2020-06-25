CREATE PROCEDURE [dbo].[usp_Settings] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Settings.SettingID 
	, Settings.IntValue
	, Settings.StringValue
	, Settings.DateTimeValue
	, Settings.GuidValue
	, ISNULL(UISettingsNameCustom.Customization,UISettingsName.Name) SettingsName
	, ISNULL(UISettingsDescriptionCustom.Customization,UISettingsDescription.Name) SettingsDescription
	, ISNULL(UISettingsMenuNameCustom.Customization,UISettingsMenuName.Name) SettingsMenuName
	, ISNULL(UISettingsMouseOverCustom.Customization,UISettingsMouseOver.Name) SettingsMouseOver
FROM Settings
JOIN UITermLanguages UISettingsName
	ON UISettingsName.UITermID = Settings.NameTermID
JOIN UITermLanguages UISettingsDescription
	ON UISettingsDescription.UITermID = Settings.NameTermID
JOIN UITermLanguages UISettingsMenuName
	ON UISettingsMEnuName.UITermID = Settings.NameTermID
JOIN UITermLanguages UISettingsMouseOver
	ON UISettingsMouseOver.UITermID = Settings.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISettingsNameCustom
	ON UISettingsNameCustom.UITermID = Settings.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISettingsDescriptionCustom
	ON UISettingsDescriptionCustom.UITermID = Settings.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISettingsMenuNameCustom
	ON UISettingsMenuNameCustom.UITermID = Settings.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UISettingsMouseOverCustom
	ON UISettingsMouseOverCustom.UITermID = Settings.MouseOverTermID
WHERE UISettingsName.LanguageID = @LanguageID
	AND UISettingsDescription.LanguageID = @LanguageID
	AND UISettingsMenuName.LanguageID = @LanguageID
	AND UISettingsMouseOver.LanguageID = @LanguageID
ORDER BY 
ISNULL(UISettingsNameCustom.Customization,UISettingsName.Name) 