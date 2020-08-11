CREATE PROCEDURE [dbo].[usp_OrganizationSettingIndexGet] (@UserId nvarchar(450), @OrganizationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT OrganizationSettings.OrganizationSettingID
	, ISNULL(DefaultTypeNameCustom.Customization,DefaultTypeName.Name) AddressTypeName
	, ISNULL(DefaultTypeGroupNameCustom.Customization,DefaultTypeGroupName.Name) AddressTypeGroupName
	, CASE WHEN OrganizationSettings.OrganizationSettingTypeID = 1
	THEN
		DefaultLanguage.Name
--Homepage page
	WHEN OrganizationSettings.OrganizationSettingTypeID= 2
	THEN ISNULL(Pages.Name,'No name') END AS ValueName
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, OrganizationSettings.ModifierID
	, OrganizationSettings.ModifiedDate
FROM OrganizationSettings
JOIN OrganizationSettingTypes
	ON OrganizationSettingTypes.OrganizationSettingTypeID = OrganizationSettings.OrganizationSettingTypeID
JOIN OrganizationSettingTypeGroups
	ON OrganizationSettingTypeGroups.OrganizationSettingTypeGroupID = OrganizationSettingTypes.OrganizationSettingTypeGroupID
JOIN UITermLanguages DefaultTypeName
	ON DefaultTypeName.UITermID =OrganizationSettingTypes.NameTermID 
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) DefaultTypeNameCustom
	ON DefaultTypeNameCustom.UITermId = OrganizationSettingTypes.NameTermID

JOIN UITermLanguages DefaultTypeGroupName
	ON DefaultTypeGroupName.UITermID =OrganizationSettingTypeGroups.NameTermID 
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) DefaultTypeGroupNameCustom
	ON DefaultTypeGroupNameCustom.UITermId = OrganizationSettingTypeGroups.NameTermID

	LEFT JOIN   (
	SELECT Languages.LanguageID 	
		, ISNULL(CustomDefaultLanguage.Customization ,DefaultLanguage.Name) Name
	FROM Languages
	JOIN UITermLanguages DefaultLanguage
		ON DefaultLanguage.UITermID = Languages.NameTermID
	LEFT JOIN (
		SELECT UITermID
			, Customization
		FROM UITermLanguageCustomizations 
		WHERE LanguageID = @LanguageID) CustomDefaultLanguage 
	ON CustomDefaultLanguage.UITermID = Languages.NameTermID
	WHERE DefaultLanguage.LanguageID = @LanguageId
	) DefaultLanguage
ON DefaultLanguage.LanguageID = OrganizationSettings.IntValue

LEFT JOIN   (
	SELECT PageLanguages.PageID 	
		, ISNULL(PageLanguages.Name,'No name') Name
	FROM PageLanguages
	WHERE PageLanguages.LanguageID = @LanguageID
) Pages
ON Pages.PageID = OrganizationSettings.IntValue



JOIN Persons Modifier
	ON Modifier.UserId = OrganizationSettings.ModifierID
WHERE DefaultTypeName.LanguageId = @LanguageID
	AND DefaultTypeGroupName.LanguageId = @LanguageID
		AND OrganizationSettings.OrganizationId = @OrganizationID
ORDER BY ISNULL(DefaultTypeGroupNameCustom.Customization,DefaultTypeGroupName.Name)
	, ISNULL(DefaultTypeNameCustom.Customization,DefaultTypeName.Name)