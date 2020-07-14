CREATE PROCEDURE [dbo].[usp_UITermLanguageCustomization] (@UserId nvarchar(450), @UITermId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT
	UITerms.UITermID
	, UITermLanguages.LanguageID
	, Customization
	, Name 
	, Description 
	, MouseOver 
	, InternalName
FROM UITermLanguages
JOIN UITerms
	ON UITermLanguages.UITermId = UITerms.UITermID
JOIN UITermLanguageCustomizations 
	ON UITermLanguageCustomizations.UITermId = UITerms.UITermID
WHERE UITermLanguages.LanguageId = @LanguageID
	AND UITermLanguageCustomizations.LanguageId = @languageID
	AND UITermLanguageCustomizations.UITermId = @UITermID
