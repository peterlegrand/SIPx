CREATE PROCEDURE [dbo].[usp_UserMenuTypeLeftList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	UserMenuTypes.UserMenuTypeID
	, ISNULL( UserLanguageName.Customization, LanguageName.Name) Name
FROM UserMenuTypes
JOIN UITermLanguages LanguageName
	ON UserMenuTypes.NameTermId = LanguageName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageName
	ON UserMenuTypes.NameTermId = UserLanguageName.UITermId  
WHERE LanguageName.LanguageId =@LanguageId 
	AND UserMenuTypes.AvailableForLeft = 1
ORDER BY  	ISNULL( UserLanguageName.Customization, LanguageName.Name) 
	

