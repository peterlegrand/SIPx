CREATE PROCEDURE usp_HomeIndexGetDashboard
AS
DECLARE @LanguageId int;
DECLARE @PageId int;
select @LanguageId  =IntValue  from settings where SettingID = 1 ;
select @PageId =IntValue  from settings where SettingID = 3 ;
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