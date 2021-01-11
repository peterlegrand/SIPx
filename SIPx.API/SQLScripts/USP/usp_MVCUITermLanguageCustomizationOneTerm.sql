CREATE PROCEDURE usp_MVCUITermLanguageCustomizationOneTerm (@InternalName nvarchar(450), @UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ISNULL(Customization.Customization, UITermLanguages.Name) TermString
FROM UITerms 
JOIN UITermLanguages
	ON UITermLanguages.UITermID = UITerms.UITermID 
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations WHERE @LanguageID = LanguageID) Customization
ON Customization.UITermID = UITerms.UITermID 
WHERE InternalName = @InternalName
	AND UITermLanguages.LanguageID = @LanguageID

