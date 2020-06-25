CREATE PROCEDURE [dbo].[usp_SortBys] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT SortBys.SortByID 
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) GroupName
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) GroupDescription
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) GroupMenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) GroupMouseOver
FROM SortBys
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermID = SortBys.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermID = SortBys.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermID = SortBys.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermID = SortBys.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermID = SortBys.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermID = SortBys.DescriptionTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermID = SortBys.MenuNameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermID = SortBys.MouseOverTermID
WHERE UIGroupName.LanguageID = @LanguageID
	AND UIGroupDescription.LanguageID = @LanguageID
	AND UIGroupMenuName.LanguageID = @LanguageID
	AND UIGroupMouseOver.LanguageID = @LanguageID
ORDER BY ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name)


