CREATE PROCEDURE [dbo].[usp_Languages] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	Languages.LanguageID
	, ForeignName
	, ISO6391
	, ISO6392
	, ISNULL( UserLanguageName.Customization, LanguageName.Name) LanguageName
	, ISNULL( UserStatusName.Customization, StatusName.Name) StatusName
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Languages.ModifiedDate
FROM Languages 
JOIN Statuses	
	ON Languages.StatusId = Statuses.StatusID
JOIN UITermLanguages LanguageName
	ON Languages.NameTermId = LanguageName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageName
	ON Languages.NameTermId = UserLanguageName.UITermId  
JOIN UITermLanguages StatusName
	ON Statuses.NameTermId = StatusName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName
	ON Statuses.NameTermId = UserStatusName.UITermId  
JOIN Persons Modifier
	ON Modifier.UserId = Languages.ModifierID
WHERE LanguageName.LanguageId =@LanguageId 
	AND StatusName.LanguageId = @LanguageID
ORDER BY  	ISNULL( UserLanguageName.Customization, LanguageName.Name) 
	

