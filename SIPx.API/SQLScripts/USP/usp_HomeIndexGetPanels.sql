CREATE PROCEDURE usp_HomeIndexGetPanels
AS
DECLARE @PageId int;
select @PageId =IntValue  from settings where SettingID = 3 ;

SELECT
	pagesectionId
	, PageSectionTypeId
	, PageSectionDataTypeId
	, QueryBuilderRule
	, SizeX
	, SizeY
	, DashboardRow
	, DashboardColumn 
	, Concat('P' , pagesectionId) PanelId
	, Concat('SP'  , pagesectionId) SubPanelId
FROM pagesections 
WHERE PageID =@PageID

