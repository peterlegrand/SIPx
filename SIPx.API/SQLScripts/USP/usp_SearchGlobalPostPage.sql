CREATE PROCEDURE usp_SearchGlobalPostPage(@UserId nvarchar(450))
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT Pages.PageID
	, Pages.ShowTitleName
	, Pages.ShowTitleDescription
	, ISNULL(PageUserLanguage.TitleName,ISNULL(PageDefaultLanguage.TitleName,'No name for this Page')) TitleName
	, ISNULL(PageUserLanguage.TitleDescription,ISNULL(PageDefaultLanguage.TitleDescription,'No description for this Page')) TitleDescription
FROM 
	Pages
LEFT JOIN (SELECT PageId, TitleName, TitleDescription FROM PageLanguages WHERE LanguageId = @LanguageID ) PageUserLanguage
	ON PageUserLanguage.PageID= Pages.PageID
LEFT JOIN (SELECT PageId, TitleName, TitleDescription FROM PageLanguages JOIN Settings ON PageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 ) PageDefaultLanguage
	ON PageDefaultLanguage.PageId = Pages.PageID
JOIN Settings	
	ON Settings.IntValue = Pages.PageId
WHERE Settings.SettingID = 2