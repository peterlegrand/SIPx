CREATE PROCEDURE [dbo].[usp_OrganizationSettingUpdateGet] (@UserId nvarchar(450), @OrganizationSettingId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationSettings.OrganizationSettingId 
	, OrganizationSettings.IntValue
	, OrganizationSettings.StringValue
	, OrganizationSettings.DateTimeValue
	, OrganizationSettings.GuidValue
	, OrganizationSettings.OrganizationSettingTypeID
	, ISNULL(UIOrganizationSettingsNameCustom.Customization,UIOrganizationSettingsName.Name) OrganizationSettingsName
	, ISNULL(UIOrganizationSettingsDescriptionCustom.Customization,UIOrganizationSettingsDescription.Name) OrganizationSettingsDescription
	, ISNULL(UIOrganizationSettingsMenuNameCustom.Customization,UIOrganizationSettingsMenuName.Name) OrganizationSettingsMenuName
	, ISNULL(UIOrganizationSettingsMouseOverCustom.Customization,UIOrganizationSettingsMouseOver.Name) OrganizationSettingsMouseOver
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, OrganizationSettings.ModifierID
	, OrganizationSettings.ModifiedDate
FROM OrganizationSettings
JOIN OrganizationSettingTypes
	ON OrganizationSettingTypes.OrganizationSettingTypeID = OrganizationSettings.OrganizationSettingTypeID 
JOIN UITermLanguages UIOrganizationSettingsName
	ON UIOrganizationSettingsName.UITermId = OrganizationSettingTypes.NameTermID
JOIN UITermLanguages UIOrganizationSettingsDescription
	ON UIOrganizationSettingsDescription.UITermId = OrganizationSettingTypes.NameTermID
JOIN UITermLanguages UIOrganizationSettingsMenuName
	ON UIOrganizationSettingsMEnuName.UITermId = OrganizationSettingTypes.NameTermID
JOIN UITermLanguages UIOrganizationSettingsMouseOver
	ON UIOrganizationSettingsMouseOver.UITermId = OrganizationSettingTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIOrganizationSettingsNameCustom
	ON UIOrganizationSettingsNameCustom.UITermId = OrganizationSettingTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIOrganizationSettingsDescriptionCustom
	ON UIOrganizationSettingsDescriptionCustom.UITermId = OrganizationSettingTypes.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIOrganizationSettingsMenuNameCustom
	ON UIOrganizationSettingsMenuNameCustom.UITermId = OrganizationSettingTypes.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIOrganizationSettingsMouseOverCustom
	ON UIOrganizationSettingsMouseOverCustom.UITermId = OrganizationSettingTypes.MouseOverTermID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationSettings.ModifierID
WHERE UIOrganizationSettingsName.LanguageId = @LanguageID
	AND UIOrganizationSettingsDescription.LanguageId = @LanguageID
	AND UIOrganizationSettingsMenuName.LanguageId = @LanguageID
	AND UIOrganizationSettingsMouseOver.LanguageId = @LanguageID
	AND OrganizationSettingId = @OrganizationSettingID
