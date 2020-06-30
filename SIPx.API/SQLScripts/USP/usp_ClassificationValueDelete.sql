CREATE PROCEDURE [dbo].[usp_ClassificationValueDelete] (
	@ClassificationValueId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationValueLanguages WHERE ClassificationValueId = @ClassificationValueID
DELETE FROM ClassificationValues WHERE ClassificationValueId = @ClassificationValueID
COMMIT TRANSACTION


