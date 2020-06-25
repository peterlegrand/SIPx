CREATE PROCEDURE [dbo].[usp_ValueUpdateTypes] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ValueUpdateTypes.ValueUpdateTypeID 
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) GroupName
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) GroupDescription
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) GroupMenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) GroupMouseOver
FROM ValueUpdateTypes
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermID = ValueUpdateTypes.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermID = ValueUpdateTypes.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermID = ValueUpdateTypes.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermID = ValueUpdateTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermID = ValueUpdateTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermID = ValueUpdateTypes.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermID = ValueUpdateTypes.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermID = ValueUpdateTypes.MouseOverTermID
WHERE UIGroupName.LanguageID = @LanguageID
	AND UIGroupDescription.LanguageID = @LanguageID
	AND UIGroupMenuName.LanguageID = @LanguageID
	AND UIGroupMouseOver.LanguageID = @LanguageID
ORDER BY ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name)


