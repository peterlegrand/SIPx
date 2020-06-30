CREATE PROCEDURE [dbo].[usp_Statuses] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Statuses.StatusId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
FROM Statuses
JOIN UITermLanguages UIName
	ON UIName.UITermId = Statuses.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = Statuses.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = Statuses.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = Statuses.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = Statuses.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = Statuses.MouseOverTermID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)


