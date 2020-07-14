CREATE PROCEDURE [dbo].[usp_SettingIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Settings.SettingId 
	, Settings.IntValue
	, Settings.StringValue
	, Settings.DateTimeValue
	, Settings.GuidValue
	, ISNULL(UISettingsNameCustom.Customization,UISettingsName.Name) SettingsName
	, ISNULL(UISettingsDescriptionCustom.Customization,UISettingsDescription.Name) SettingsDescription
	, ISNULL(UISettingsMenuNameCustom.Customization,UISettingsMenuName.Name) SettingsMenuName
	, ISNULL(UISettingsMouseOverCustom.Customization,UISettingsMouseOver.Name) SettingsMouseOver
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Settings.ModifierID
	, Settings.ModifiedDate
FROM Settings
JOIN UITermLanguages UISettingsName
	ON UISettingsName.UITermId = Settings.NameTermID
JOIN UITermLanguages UISettingsDescription
	ON UISettingsDescription.UITermId = Settings.NameTermID
JOIN UITermLanguages UISettingsMenuName
	ON UISettingsMEnuName.UITermId = Settings.NameTermID
JOIN UITermLanguages UISettingsMouseOver
	ON UISettingsMouseOver.UITermId = Settings.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISettingsNameCustom
	ON UISettingsNameCustom.UITermId = Settings.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISettingsDescriptionCustom
	ON UISettingsDescriptionCustom.UITermId = Settings.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISettingsMenuNameCustom
	ON UISettingsMenuNameCustom.UITermId = Settings.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UISettingsMouseOverCustom
	ON UISettingsMouseOverCustom.UITermId = Settings.MouseOverTermID
JOIN Persons Modifier
	ON Modifier.UserId = Settings.ModifierID
WHERE UISettingsName.LanguageId = @LanguageID
	AND UISettingsDescription.LanguageId = @LanguageID
	AND UISettingsMenuName.LanguageId = @LanguageID
	AND UISettingsMouseOver.LanguageId = @LanguageID
ORDER BY 
ISNULL(UISettingsNameCustom.Customization,UISettingsName.Name) 