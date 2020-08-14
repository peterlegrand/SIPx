CREATE PROCEDURE [dbo].[usp_UITermIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UITerms.UITermID
	, ISNULL(UserLanguage.UITermLanguageID,ISNULL(DefaultLanguage.UITermLanguageID,0)) UITermLanguageID
	, @LanguageId LanguageId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this UITerm')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this UITerm')) Description
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this UITerm')) MouseOver
	, ISNULL(Customization.Customization,'No customization') Customization
	, InternalName
FROM UITerms 
LEFT JOIN (SELECT UITermId, Name, Description, MouseOver, UITermLanguageID FROM UITermLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.UITermID= UITerms.UITermID
LEFT JOIN (SELECT UITermId, Name, Description, MouseOver, UITermLanguageID FROM UITermLanguages JOIN Settings ON UITermLanguages.LanguageId = Settings.IntValue 
	WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.UITermId = UITerms.UITermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations WHERE LanguageId = @LanguageID) Customization
	ON Customization.UITermId = UITerms.UITermID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this UITerm')) 


