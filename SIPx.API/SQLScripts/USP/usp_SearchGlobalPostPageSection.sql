CREATE PROCEDURE usp_SearchGlobalPostPageSection(@UserId nvarchar(450), @PageId int)
AS
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

SELECT PageSections.PageSectionID
	, PageSections.PageID
	, PageSections.PageSectionTypeID
	, PageSections.PageSectionDataTypeID
	, PageSections.ShowSectionTitleName
	, PageSections.ShowSectionTitleDescription
	, PageSections.ShowContentTypeTitleName
	, PageSections.ShowContentTypeTitleDescription
	, PageSections.SizeX
	, PageSections.SizeY
	, PageSections.DashboardRow
	, PageSections.DashboardColumn
	, ISNULL(PageSectionUserLanguage.TitleName,ISNULL(PageSectionDefaultLanguage.TitleName,'No name for this PageSection')) TitleName
	, ISNULL(PageSectionUserLanguage.TitleDescription,ISNULL(PageSectionDefaultLanguage.TitleDescription,'No description for this PageSection')) TitleDescription
	, Concat('P' , PageSections.PagesectionId) PanelId
	, Concat('SP'  , PageSections.pagesectionId) SubPanelId
FROM 
	PageSections
LEFT JOIN (SELECT PageSectionId, TitleName, TitleDescription FROM PageSectionLanguages WHERE LanguageId = @LanguageID ) PageSectionUserLanguage
	ON PageSectionUserLanguage.PageSectionID= PageSections.PageSectionID
LEFT JOIN (SELECT PageSectionId, TitleName, TitleDescription FROM PageSectionLanguages JOIN Settings ON PageSectionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1 ) PageSectionDefaultLanguage
	ON PageSectionDefaultLanguage.PageSectionId = PageSections.PageSectionID
WHERE PageSections.PageID = @PageId