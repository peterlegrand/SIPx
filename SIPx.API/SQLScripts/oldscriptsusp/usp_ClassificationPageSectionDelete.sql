CREATE PROCEDURE [dbo].[usp_ClassificationPageSectionDelete] (
	@ClassificationPageSectionId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationPageSectionLanguages WHERE ClassificationPageSectionId = @ClassificationPageSectionID
DELETE FROM ClassificationPageSections WHERE ClassificationPageSectionId = @ClassificationPageSectionID
COMMIT TRANSACTION
