CREATE PROCEDURE [dbo].[usp_ContentStatuses] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ContentStatuses.ContentStatusID 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM ContentStatuses 
JOIN UITermLanguages UIName
	ON UIName.UITermID = ContentStatuses.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = ContentStatuses.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = ContentStatuses.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = ContentStatuses.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = ContentStatuses.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = ContentStatuses.MouseOverTermID
	ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)
