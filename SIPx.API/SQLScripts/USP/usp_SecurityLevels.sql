CREATE PROCEDURE [dbo].[usp_SecurityLevels] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT SecurityLevels.SecurityLevelID 
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) GroupName
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) GroupDescription
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) GroupMenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) GroupMouseOver
FROM SecurityLevels
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermID = SecurityLevels.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermID = SecurityLevels.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermID = SecurityLevels.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermID = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermID = SecurityLevels.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermID = SecurityLevels.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermID = SecurityLevels.MouseOverTermID
WHERE UIGroupName.LanguageID = @LanguageID
	AND UIGroupDescription.LanguageID = @LanguageID
	AND UIGroupMenuName.LanguageID = @LanguageID
	AND UIGroupMouseOver.LanguageID = @LanguageID
ORDER BY ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name)


