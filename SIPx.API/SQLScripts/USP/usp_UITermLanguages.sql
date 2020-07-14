CREATE PROCEDURE [dbo].[usp_UITermLanguages] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT
	UITermLanguages.UITermLanguageID
	, UITerms.UITermID
	, Name 
	, Description 
	, MouseOver 
	, InternalName
FROM UITermLanguages
JOIN UITerms
	ON UITermLanguages.UITermId = UITerms.UITermID
WHERE LanguageId = @LanguageID
