CREATE PROCEDURE usp_FrontIndex_Panels (@PageID int)
AS
SELECT
	pagesectionId, PageSectionTypeId, PageSectionDataTypeId, QueryBuilderRule, SizeX, SizeY, DashboardRow, DashboardColumn , Concat('P' , pagesectionId) PanelId, Concat('SP'  , pagesectionId) SubPanelId
FROM pagesections 

WHERE PageID =@PageID

