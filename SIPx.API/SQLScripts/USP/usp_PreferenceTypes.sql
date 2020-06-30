CREATE PROCEDURE [dbo].[usp_PreferenceTypes] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PreferenceTypes.PreferenceTypeId 
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) GroupName
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) GroupDescription
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) GroupMenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) GroupMouseOver
FROM PreferenceTypes
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermId = PreferenceTypes.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermId = PreferenceTypes.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermId = PreferenceTypes.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermId = PreferenceTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermId = PreferenceTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermId = PreferenceTypes.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermId = PreferenceTypes.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermId = PreferenceTypes.MouseOverTermID
WHERE UIGroupName.LanguageId = @LanguageID
	AND UIGroupDescription.LanguageId = @LanguageID
	AND UIGroupMenuName.LanguageId = @LanguageID
	AND UIGroupMouseOver.LanguageId = @LanguageID
ORDER BY ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) 