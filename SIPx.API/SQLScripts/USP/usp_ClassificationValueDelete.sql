CREATE PROCEDURE [dbo].[usp_ClassificationValueDelete] (
	@ClassificationValueID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationValueLanguages WHERE ClassificationValueID = @ClassificationValueID
DELETE FROM ClassificationValues WHERE ClassificationValueID = @ClassificationValueID
COMMIT TRANSACTION


