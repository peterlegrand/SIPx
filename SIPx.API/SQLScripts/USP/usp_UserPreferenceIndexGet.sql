CREATE PROCEDURE [dbo].[usp_UserPreferenceIndexGet] (@UserId nvarchar(450), @SelectedUserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT UserPreferences.UserPreferenceID 
	, ISNULL(CustomPreferenceTypeLanguage.Customization ,PreferenceTypeLanguage.Name)UserPreferenceTypeName
--Default language
	, CASE WHEN UserPreferenceTypes.UserPreferenceTypeID = 1
	THEN
		DefaultLanguage.Name
--Homepage page
	WHEN UserPreferenceTypes.UserPreferenceTypeID = 2
	THEN ISNULL(Pages.Name,'No name') END AS UserPreferenceName
FROM UserPreferences
LEFT JOIN   (
	SELECT Languages.LanguageID 	
		, ISNULL(CustomDefaultLanguage.Customization ,DefaultLanguage.Name) Name
	FROM Languages
	JOIN UITermLanguages DefaultLanguage
		ON DefaultLanguage.UITermID = Languages.NameTermID
	LEFT JOIN (
		SELECT UITermID
			, Customization
		FROM UITermLanguageCustomizations 
		WHERE LanguageID = @LanguageID) CustomDefaultLanguage 
	ON CustomDefaultLanguage.UITermID = Languages.NameTermID
	WHERE DefaultLanguage.LanguageID = @LanguageId
	) DefaultLanguage
ON DefaultLanguage.LanguageID = UserPreferences.IntPreference

LEFT JOIN   (
	SELECT PageLanguages.PageID 	
		, ISNULL(PageLanguages.Name,'No name') Name
	FROM PageLanguages
	WHERE PageLanguages.LanguageID = @LanguageID
) Pages
ON Pages.PageID = UserPreferences.IntPreference


JOIN UserPreferenceTypes
	ON UserPreferenceTypes.UserPreferenceTypeID = UserPreferences.PreferenceTypeID
JOIN UITermLanguages PreferenceTypeLanguage
		ON PreferenceTypeLanguage.UITermID = UserPreferenceTypes.NameTermID
LEFT JOIN (
	SELECT UITermID
			, Customization
		FROM UITermLanguageCustomizations 
		WHERE LanguageID = @LanguageID) CustomPreferenceTypeLanguage
	ON CustomPreferenceTypeLanguage.UITermID = UserPreferenceTypes.NameTermID
WHERE UserPreferences.UserID = @SelectedUserID
	AND PreferenceTypeLanguage.LanguageID = @LanguageId