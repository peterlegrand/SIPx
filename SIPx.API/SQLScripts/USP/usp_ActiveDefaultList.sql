CREATE PROCEDURE [dbo].[usp_ActiveDefaultList]  
AS 
BEGIN
DECLARE @LanguageID int;
SELECT @LanguageID = IntValue
FROM Settings
WHERE SettingId = 1;
SELECT 
	Languages.LanguageId
	, ISNULL(UINameCustom.Customization ,UIName.Name) Name
FROM Languages
JOIN UITermLanguages UIName
	ON UIName.UITermID = Languages.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UINameCustom
	ON UINameCustom.UITermID = Languages.NameTermID
WHERE UIName.LanguageID = @LanguageID
AND Languages.StatusID = 1
END