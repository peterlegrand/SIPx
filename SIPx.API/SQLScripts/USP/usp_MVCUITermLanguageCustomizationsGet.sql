CREATE PROCEDURE usp_MVCUITermLanguageCustomizationsGet (@Controller nvarchar(50), @Action nvarchar(50), @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT UITerms.InternalName
	, ISNULL(Customization.Customization, UITermLanguages.Name) TermString
FROM MVCUIScreens
JOIN MVCUITermScreens
	ON MVCUIScreens.MVCUIScreenID= MVCUITermScreens.MVCUIScreenID
JOIN UITerms 
	ON UITerms.UITermID = MVCUITermScreens.UITermID
JOIN UITermLanguages
	ON UITermLanguages.UITermID = MVCUITermScreens.UITermID 
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations WHERE @LanguageID = LanguageID) Customization
ON Customization.UITermID = MVCUITermScreens.UITermID 
WHERE Controller = @Controller 
	AND Action = @Action
	AND UITermLanguages.LanguageID = @LanguageID
