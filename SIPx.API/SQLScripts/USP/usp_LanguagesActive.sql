CREATE PROCEDURE [dbo].[usp_LanguagesActive] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT 
	Languages.LanguageID
	, ForeignName
	, ISO6391
	, ISO6392
	, ISNULL( UserLanguageName.Customization, LanguageName.Name) LanguageName
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Languages.ModifiedDate
FROM Languages 
JOIN Statuses	
	ON Languages.StatusID = Statuses.StatusID
JOIN UITermLanguages LanguageName
	ON Languages.NameTermID = LanguageName.UITermID  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageID)  UserLanguageName
	ON Languages.NameTermID = UserLanguageName.UITermID  
JOIN Persons Modifier
	ON Modifier.UserID = Languages.ModifierID
WHERE LanguageName.LanguageID =@LanguageID 
	AND Languages.StatusID = 1
ORDER BY  	ISNULL( UserLanguageName.Customization, LanguageName.Name) 
	

