CREATE PROCEDURE [dbo].[usp_PageSectionDelete] (
	@PageSectionID int) 
AS 
BEGIN TRANSACTION
DELETE FROM PageSectionLanguages WHERE PageSectionID = @PageSectionID
DELETE FROM PageSections WHERE PageSectionID = @PageSectionID
COMMIT TRANSACTION
