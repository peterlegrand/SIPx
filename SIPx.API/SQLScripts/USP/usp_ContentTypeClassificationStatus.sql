CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationStatus] (@UserID nvarchar(450), @ContentTypeClassificationStatusID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ContentTypeClassificationStatuses.ContentTypeClassificationStatusID 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ContentTypeClassificationStatuses 
JOIN UITermLanguages UIName
	ON UIName.UITermID = ContentTypeClassificationStatuses.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = ContentTypeClassificationStatuses.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = ContentTypeClassificationStatuses.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = ContentTypeClassificationStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = ContentTypeClassificationStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = ContentTypeClassificationStatuses.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = ContentTypeClassificationStatuses.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = ContentTypeClassificationStatuses.MouseOverTermID
WHERE UIName.LanguageID = @LanguageID
	AND UIDescription.LanguageID = @LanguageID
	AND UIMenuName.LanguageID = @LanguageID
	AND UIMouseOver.LanguageID = @LanguageID
	AND ContentTypeClassificationStatuses.ContentTypeClassificationStatusID = @ContentTypeClassificationStatusID