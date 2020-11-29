CREATE PROCEDURE [dbo].[usp_PageSectionDelete] (
	@PageSectionId int) 
AS 
BEGIN TRANSACTION
DELETE FROM PageSectionLanguages WHERE PageSectionId = @PageSectionID
DELETE FROM PageSections WHERE PageSectionId = @PageSectionID
COMMIT TRANSACTION
