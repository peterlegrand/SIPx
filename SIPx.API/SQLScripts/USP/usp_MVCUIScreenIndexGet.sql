CREATE PROCEDURE usp_MVCUIScreenIndexGet (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @DefaultLanguageId int;
SELECT @DefaultLanguageId =  IntValue  FROM Settings WHERE Settings.SettingId = 1

SELECT MVCUIScreens.MVCUIScreenID
	, MVCUIScreens.Action
	, MVCUIScreens.Controller
	, MVCUIScreens.IsLogRecordGrid
	, ISNULL(UIScreenNameCustom.Customization,UIScreenName.Name) ScreenName
FROM MVCUIScreens
JOIN UITermLanguages UIScreenName
	ON UIScreenName.UITermId = MVCUIScreens.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIScreenNameCustom
	ON UIScreenNameCustom.UITermId = MVCUIScreens.NameTermID
WHERE UIScreenName.LanguageID = @LanguageId
	AND MVCUIScreens.IsObsolete = 0
ORDER BY ISNULL(UIScreenNameCustom.Customization,UIScreenName.Name)