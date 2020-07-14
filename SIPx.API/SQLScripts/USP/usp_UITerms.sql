CREATE PROCEDURE [dbo].[usp_UITerms] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UITerms.UITermId 
	, UITerms.InternalName
	, UITermLanguages.Name Name
	, UITermLanguages.Description Description
	, UITermLanguages.MouseOver MouseOver
	, ISNULL(Customization.Customization, 'No customization') Customization
	
FROM UITerms
JOIN UITermLanguages
	ON UITermLanguages.UITermId = UITerms.UITermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations WHERE LanguageId = @LanguageID) Customization
	ON Customization.UITermId = UITerms.UITermID
WHERE UITermLanguages.LanguageId = @LanguageID
ORDER BY UITermLanguages.Name 