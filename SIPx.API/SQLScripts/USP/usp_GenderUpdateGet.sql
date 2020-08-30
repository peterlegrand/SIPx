CREATE PROCEDURE [dbo].[usp_GenderUpdateGet] (@UserId nvarchar(450), @GenderId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Genders.GenderId 
	, ISNULL(UINameCustom.Customization,UIName.Name) Name
	, ISNULL(UIDescriptionCustom.Customization,UIDescription.Name) Description
	, ISNULL(UIMenuNameCustom.Customization,UIMenuName.Name) MenuName
	, ISNULL(UIMouseOverCustom.Customization,UIMouseOver.Name) MouseOver
	, Genders.Active
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Genders.ModifierID
	, Genders.ModifiedDate
FROM Genders 
JOIN UITermLanguages UIName
	ON UIName.UITermId = Genders.NameTermID
JOIN UITermLanguages UIDescription
	ON UIDescription.UITermId = Genders.NameTermID
JOIN UITermLanguages UIMenuName
	ON UIMEnuName.UITermId = Genders.NameTermID
JOIN UITermLanguages UIMouseOver
	ON UIMouseOver.UITermId = Genders.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Genders.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDescriptionCustom
	ON UIDescriptionCustom.UITermId = Genders.DescriptionTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMenuNameCustom
	ON UIMenuNameCustom.UITermId = Genders.MenuNameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIMouseOverCustom
	ON UIMouseOverCustom.UITermId = Genders.MouseOverTermID
JOIN Persons Modifier
	ON Modifier.UserId = Genders.ModifierID
WHERE UIName.LanguageId = @LanguageID
	AND UIDescription.LanguageId = @LanguageID
	AND UIMenuName.LanguageId = @LanguageID
	AND UIMouseOver.LanguageId = @LanguageID
	AND Genders.GenderID= @GenderId
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)



