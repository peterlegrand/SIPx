CREATE PROCEDURE [dbo].[usp_Claims] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT Claims.ClaimID 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) GroupName
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) GroupDescription
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) GroupMenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) GroupMouseOver
FROM Claims 
JOIN ClaimGroups
	ON Claims.ClaimGroupID = ClaimGroups.ClaimGroupID
JOIN UITermLanguages UIName
	ON UIName.UITermID = Claims.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermID = Claims.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermID = Claims.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermID = Claims.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = Claims.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermID = Claims.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermID = Claims.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermID = Claims.MouseOverTermID
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermID = ClaimGroups.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermID = ClaimGroups.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermID = ClaimGroups.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermID = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermID = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermID = ClaimGroups.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermID = ClaimGroups.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermID = ClaimGroups.MouseOverTermID
WHERE UIName.LanguageID = @LanguageID
	AND UIDescription.LanguageID = @LanguageID
	AND UIMenuName.LanguageID = @LanguageID
	AND UIMouseOver.LanguageID = @LanguageID
	AND UIGroupName.LanguageID = @LanguageID
	AND UIGroupDescription.LanguageID = @LanguageID
	AND UIGroupMenuName.LanguageID = @LanguageID
	AND UIGroupMouseOver.LanguageID = @LanguageID
ORDER BY ClaimGroups.Sequence
	, ISNULL(UINameCustom.Customization,UIName.Name)

