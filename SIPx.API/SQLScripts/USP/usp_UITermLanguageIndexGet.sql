CREATE PROCEDURE usp_UITermLanguageIndexGet ( @USerID nvarchar(450), @UITermID int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UITerms.UITermID
	, UITerms.InternalName 
	, UITermLanguages.UITermLanguageID
	, UITermLanguages.LanguageID
	, UITermLanguages.Name
	, UITermLanguages.Description
	, UITermLanguages.MouseOver
	, ISNULL(Customization.Customization,'No customization') Customization
	, ISNULL(UINameCustom.Customization,UIName.Name) LanguageName
FROM UITerms 
JOIN UITermLanguages 
	ON UITerms.UITermID = UITermLanguages.UITermID
LEFT JOIN (SELECT UITermLanguageID, Customization FROM UITermLanguageCustomizations WHERE UITermID = @UITermID) Customization
	ON Customization.UITermLanguageID = UITermLanguages.UITermLanguageID
JOIN Languages
	ON UITermLanguages.LanguageID = Languages.LanguageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Languages.NameTermID
WHERE UIName.LanguageId = @LanguageID
	AND UITerms.UITermID = @UITermID
ORDER BY ISNULL(UINameCustom.Customization,UIName.Name)