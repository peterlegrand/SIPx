CREATE PROCEDURE [dbo].[usp_PageSectionDataType] (@UserID nvarchar(450), @PageSectionDataTypeID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT PageSectionDataTypes.PageSectionDataTypeID 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM PageSectionDataTypes
JOIN UITermLanguages UIName
	ON UIName.UITermID = PageSectionDataTypes.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = PageSectionDataTypes.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = PageSectionDataTypes.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = PageSectionDataTypes.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = PageSectionDataTypes.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = PageSectionDataTypes.MouseOverTermID
WHERE UIName.LanguageID = @LanguageID
	AND UIDescription.LanguageID = @LanguageID
	AND UIMenuName.LanguageID = @LanguageID
	AND UIMouseOver.LanguageID = @LanguageID
	AND PageSectionDataTypes.PageSectionDataTypeID  = @PageSectionDataTypeID
