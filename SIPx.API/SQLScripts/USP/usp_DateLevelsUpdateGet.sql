CREATE PROCEDURE [dbo].[usp_DateLevelsUpdateGet] (@UserId nvarchar(450), @DateLevelId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT DateLevels.DateLevelId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM DateLevels 
JOIN UITermLanguages UIName
	ON UIName.UITermId = DateLevels.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = DateLevels.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = DateLevels.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = DateLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = DateLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = DateLevels.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = DateLevels.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = DateLevels.MouseOverTermID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
	AND Datelevels.DateLevelID = @DateLevelId
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)



