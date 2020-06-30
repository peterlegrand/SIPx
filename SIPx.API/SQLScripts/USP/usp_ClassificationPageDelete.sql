CREATE PROCEDURE [dbo].[usp_ClassificationPageDelete] (
	@ClassificationPageId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationPageLanguages WHERE ClassificationPageId = @ClassificationPageID
DELETE FROM ClassificationPages WHERE ClassificationPageId = @ClassificationPageID
COMMIT TRANSACTION