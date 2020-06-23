CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionDelete] (
	@ClassificationPageSectionID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationPageSectionLanguages WHERE ClassificationPageSectionID = @ClassificationPageSectionID
DELETE FROM ClassificationPageSections WHERE ClassificationPageSectionID = @ClassificationPageSectionID
COMMIT TRANSACTION
