CREATE PROCEDURE [dbo].[usp_SortByUpdateGet] (@UserId nvarchar(450), @SortById int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT SortBys.SortById 
	, ISNULL(UIGroupNameCustom.Customization,UIGroupName.Name) Name
	, ISNULL(UIGroupDescriptionCustom.Customization,UIGroupDescription.Name) Description
	, ISNULL(UIGroupMenuNameCustom.Customization,UIGroupMenuName.Name) MenuName
	, ISNULL(UIGroupMouseOverCustom.Customization,UIGroupMouseOver.Name) MouseOver
FROM SortBys
JOIN UITermLanguages UIGroupName
	ON UIGroupName.UITermId = SortBys.NameTermID
JOIN UITermLanguages UIGroupDescription
	ON UIGroupDescription.UITermId = SortBys.NameTermID
JOIN UITermLanguages UIGroupMenuName
	ON UIGroupMEnuName.UITermId = SortBys.NameTermID
JOIN UITermLanguages UIGroupMouseOver
	ON UIGroupMouseOver.UITermId = SortBys.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupNameCustom
	ON UIGroupNameCustom.UITermId = SortBys.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupDescriptionCustom
	ON UIGroupDescriptionCustom.UITermId = SortBys.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMenuNameCustom
	ON UIGroupMenuNameCustom.UITermId = SortBys.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIGroupMouseOverCustom
	ON UIGroupMouseOverCustom.UITermId = SortBys.MouseOverTermID
WHERE UIGroupName.LanguageId = @LanguageID
	AND UIGroupDescription.LanguageId = @LanguageID
	AND UIGroupMenuName.LanguageId = @LanguageID
	AND UIGroupMouseOver.LanguageId = @LanguageID
	AND SortBys.SortById = @SortByID


