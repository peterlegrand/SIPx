CREATE PROCEDURE usp_FrontIndexPanels (@UserId nvarchar(450), @PageID int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT
	pagesections.pagesectionId
	, PageSectionTypeId
	, PageSectionDataTypeId
	, QueryBuilderRule
	, SizeX
	, SizeY
	, DashboardRow
	, DashboardColumn 
	, Concat('P' , pagesections.pagesectionId) PanelId
	, Concat('SP'  , pagesections.pagesectionId) SubPanelId
	, CASE WHEN ShowSectionTitleName = 1 THEN ISNULL(UserPageSectionLanguage.TitleName,ISNULL(DefaultPageSectionLanguage.TitleName,'No title name for this section')) ELSE '' END PageSectionTitleName
	, CASE WHEN ShowSectionTitleDescription = 1 THEN ISNULL(UserPageSectionLanguage.TitleDescription,ISNULL(DefaultPageSectionLanguage.TitleDescription,'No title description for this section')) ELSE '' END PageSectionTitleDescription
	, ShowSectionTitleName
	, ShowSectionTitleDescription
FROM pagesections 

LEFT JOIN (SELECT PageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageSectionLanguages WHERE LanguageId = @LanguageID) UserPageSectionLanguage
	ON UserPageSectionLanguage.PageSectionId = PageSections.PageSectionID
LEFT JOIN (SELECT PageSectionId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageSectionLanguages JOIN Settings ON PageSectionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionLanguage
	ON DefaultPageSectionLanguage.PageSectionId = PageSections.PageSectionID

WHERE PageID =@PageID

