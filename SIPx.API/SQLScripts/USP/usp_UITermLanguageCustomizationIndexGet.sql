CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomizationIndexGet] (@UserId nvarchar(450), @UITermId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
	UITermLanguages.UITermID
	, UITermLanguages.Name
	, UITermLanguages.Description
	, UITermLanguages.MouseOver
	, ISNULL(UITermLanguageCustomizations.UITermLanguageID,0) UITermLanguageIDCustomization
	, ISNULL(UITermLanguageCustomizations.Customization,'') Customization
 	, ISNULL(UINameCustom.Customization,UIName.Name) LanguageName
	, UITermLanguages.LanguageID
FROM UITermLanguages
LEFT JOIN UITermLanguageCustomizations
	ON UITermLanguages.UITermID = UITermLanguageCustomizations.UITermID
		AND UITermLanguages.LanguageID = UITermLanguageCustomizations.LanguageID
JOIN Languages
	ON UITermLanguages.LanguageID = Languages.LanguageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Languages.NameTermID
WHERE UITermLanguages.UITermID = @UITermID