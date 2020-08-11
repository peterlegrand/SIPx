CREATE PROCEDURE [dbo].[usp_ClaimGroupIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClaimGroups.ClaimGroupId 
	, ClaimGroups.Sequence
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) Name
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) Description
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) MenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) MouseOver
FROM ClaimGroups
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermId = ClaimGroups.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermId = ClaimGroups.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermId = ClaimGroups.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermId = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermId = ClaimGroups.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermId = ClaimGroups.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermId = ClaimGroups.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermId = ClaimGroups.MouseOverTermID
WHERE UIGroupName.LanguageId = @LanguageID
	AND UIGroupDescription.LanguageId = @LanguageID
	AND UIGroupMenuName.LanguageId = @LanguageID
	AND UIGroupMouseOver.LanguageId = @LanguageID
ORDER BY ClaimGroups.Sequence

