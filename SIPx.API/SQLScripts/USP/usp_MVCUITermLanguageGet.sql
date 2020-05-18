CREATE PROCEDURE usp_MVCUITermLanguageGet (@Controller varchar(30),@Action varchar(20), @LanguageId int)
AS
SELECT 
	UITerms.UITermID
	, ISNULL(UserLanguage.Customization, ISNULL(DefaultLanguage.Customization, UIterms.Name)) Name 
FROM UITerms 
LEFT JOIN (
		SELECT 
			UITermID
			, Customization 
		FROM UITermLanguages 
		WHERE LanguageID = @LanguageID
	) UserLanguage
ON UserLanguage.UITermID = UITerms.UITermID
LEFT JOIN (
		SELECT 
			UITermID
			, Customization 
		FROM UITermLanguages 
		JOIN Settings 
			ON Settings.IntValue = UITermLanguages.LanguageID 
		WHERE SettingID = 1) DefaultLanguage
ON UserLanguage.UITermID = UITerms.UITermID
JOIN MVCUITermScreens
	ON UITerms.UITermId = MVCUITermScreens.UITermID
JOIN MVCUIScreens
	ON MVCUIScreens.MVCUIScreenID = MVCUITermScreens.MVCUIScreenID
WHERE MVCUIScreens.Controller = @Controller
	AND MVCUIScreens.Action = @Action
