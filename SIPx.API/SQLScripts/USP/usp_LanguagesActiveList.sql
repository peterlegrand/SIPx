CREATE PROCEDURE [dbo].[usp_LanguagesActiveList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	Languages.LanguageID
	, ISNULL( UserLanguageName.Customization, LanguageName.Name) Name
FROM Languages 
JOIN Statuses	
	ON Languages.StatusId = Statuses.StatusID
JOIN UITermLanguages LanguageName
	ON Languages.NameTermId = LanguageName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageName
	ON Languages.NameTermId = UserLanguageName.UITermId  
JOIN Persons Modifier
	ON Modifier.UserId = Languages.ModifierID
WHERE LanguageName.LanguageId =@LanguageId 
	AND Languages.StatusId = 1
ORDER BY  	ISNULL( UserLanguageName.Customization, LanguageName.Name) 
	

