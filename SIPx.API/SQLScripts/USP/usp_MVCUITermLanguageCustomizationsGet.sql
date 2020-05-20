CREATE PROCEDURE usp_MVCUITermLanguageCustomizationsGet (@Controller varchar(50),@Action varchar(50), @LanguageId int)
AS
BEGIN
SELECT 
	UITerms.InternalName
	, ISNULL(UserTermLanguageCustomizations.Customization, ISNULL(DefaultTermLanguageCustomizations.Customization, UITermLanguages.Name)) TermString
FROM MVCUIScreens
JOIN MVCUITermScreens
	ON MVCUIScreens.MVCUIScreenID = MVCUITermScreens.MVCUIScreenID
JOIN UITerms
	ON UITerms.UITermID = MVCUITermScreens.UITermID
JOIN UITermLanguages
	ON UITermLanguages.UITermID = MVCUITermScreens.UITermID
LEFT JOIN (
	SELECT 
		UITermLanguageCustomizations.UITermID, 
		UITermLanguageCustomizations.Customization 
	FROM UITermLanguageCustomizations
	WHERE UITermLanguageCustomizations.LanguageID = @LanguageId
	) UserTermLanguageCustomizations
	ON UserTermLanguageCustomizations.UITermID = MVCUITermScreens.UITermID
LEFT JOIN (
	SELECT 
		UITermLanguageCustomizations.UITermID, 
		UITermLanguageCustomizations.Customization 
	FROM UITermLanguageCustomizations
	JOIN Settings 
		ON Settings.IntValue = UITermLanguageCustomizations.LanguageID 
		WHERE Settings.SettingID = 1
	) DefaultTermLanguageCustomizations
	ON DefaultTermLanguageCustomizations.UITermID = MVCUITermScreens.UITermID
WHERE UITermLanguages.LanguageID = @LanguageId
	AND MVCUIScreens.Controller = @Controller
	AND MVCUIScreens.Action = @Action
END;