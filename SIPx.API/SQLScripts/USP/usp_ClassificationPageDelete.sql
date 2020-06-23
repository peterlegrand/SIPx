CREATE PROCEDURE [dbo].[usp_ClassificationPageDelete] (
	@ClassificationPageID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationPageLanguages WHERE ClassificationPageID = @ClassificationPageID
DELETE FROM ClassificationPages WHERE ClassificationPageID = @ClassificationPageID
COMMIT TRANSACTION