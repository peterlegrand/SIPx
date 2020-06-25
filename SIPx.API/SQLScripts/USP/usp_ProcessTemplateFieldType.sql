CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldType] (@UserID nvarchar(450), @ProcessTemplateFieldTypeID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ProcessTemplateFieldTypes
JOIN UITermLanguages UIName
	ON UIName.UITermID = ProcessTemplateFieldTypes.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = ProcessTemplateFieldTypes.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = ProcessTemplateFieldTypes.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = ProcessTemplateFieldTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = ProcessTemplateFieldTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = ProcessTemplateFieldTypes.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = ProcessTemplateFieldTypes.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = ProcessTemplateFieldTypes.MouseOverTermID
WHERE UIName.LanguageID = @LanguageID
	AND UIDescription.LanguageID = @LanguageID
	AND UIMenuName.LanguageID = @LanguageID
	AND UIMouseOver.LanguageID = @LanguageID
	AND ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId = @ProcessTemplateFieldTypeID