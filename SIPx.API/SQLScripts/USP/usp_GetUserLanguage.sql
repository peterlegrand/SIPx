CREATE PROCEDURE [dbo].[usp_GetUserLanguage] (@UserID nvarchar(450)) 
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	Languages.LanguageId
	, ISNULL(UINameCustom.Customization ,UIName.Name) Name
FROM Languages
JOIN UITermLanguages UIName
	ON UIName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = Languages.NameTermID
WHERE UIName.LanguageID = @LanguageID
AND Languages.LanguageID = @LanguageID
END