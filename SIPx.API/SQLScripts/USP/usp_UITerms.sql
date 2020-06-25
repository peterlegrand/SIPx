CREATE PROCEDURE [dbo].[usp_UITerms] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT UITerms.UITermID 
	, UITerms.InternalName
	, UITermLanguages.Name UITermLanguageName
	, UITermLanguages.Description UITermLanguageDescription
	, UITermLanguages.MouseOver UITermLanguageMouseOver
	, ISNULL(Customization.Customization, 'No customization') Customization
	
FROM UITerms
JOIN UITermLanguages
	ON UITermLanguages.UITermID = UITerms.UITermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations WHERE LanguageID = @LanguageID) Customization
	ON Customization.UITermID = UITerms.UITermID
WHERE UITermLanguages.LanguageID = @LanguageID
ORDER BY UITermLanguages.Name 