CREATE PROCEDURE [dbo].[usp_PageSectionDataType] (@UserId nvarchar(450), @PageSectionDataTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionDataTypes.PageSectionDataTypeId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM PageSectionDataTypes
JOIN UITermLanguages UIName
	ON UIName.UITermId = PageSectionDataTypes.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = PageSectionDataTypes.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = PageSectionDataTypes.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = PageSectionDataTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = PageSectionDataTypes.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = PageSectionDataTypes.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = PageSectionDataTypes.MouseOverTermID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
	AND PageSectionDataTypes.PageSectionDataTypeId  = @PageSectionDataTypeID
