CREATE PROCEDURE [dbo].[usp_SecurityLevel] (@UserId nvarchar(450), @SecurityLevelId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT SecurityLevels.SecurityLevelId 
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) GroupName
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) GroupDescription
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) GroupMenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) GroupMouseOver
FROM SecurityLevels
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermId = SecurityLevels.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermId = SecurityLevels.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermId = SecurityLevels.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermId = SecurityLevels.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermId = SecurityLevels.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermId = SecurityLevels.MouseOverTermID
WHERE UIGroupName.LanguageId = @LanguageID
	AND UIGroupDescription.LanguageId = @LanguageID
	AND UIGroupMenuName.LanguageId = @LanguageID
	AND UIGroupMouseOver.LanguageId = @LanguageID
	AND SecurityLevels.SecurityLevelId = @SecurityLevelID


