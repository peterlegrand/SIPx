CREATE PROCEDURE usp_FrontIndexGetDashboard (@UserID nvarchar(450), @PageId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE UserId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Pages.PageID
	, ISNULL(UserLanguage.TitleName,ISNULL(DefaultLanguage.TitleName,'No name ')) TitleName
	, ISNULL(UserLanguage.TitleDescription,ISNULL(DefaultLanguage.TitleDescription,'No description')) TitleDescription
	, ShowTitleName
	, ShowTitleDescription
FROM Pages
LEFT JOIN (SELECT PageId, TitleName, TitleDescription FROM PageLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.PageID= Pages.PageID
LEFT JOIN (SELECT PageId, TitleName, TitleDescription FROM PageLanguages JOIN Settings ON PageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.PageId = Pages.PageID
WHERE Pages.PageID = @PageId