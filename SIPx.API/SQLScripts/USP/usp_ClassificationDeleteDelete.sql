
CREATE PROCEDURE [dbo].[usp_ClassificationDeleteDelete] (
	@ClassificationID int
	)
AS
BEGIN
BEGIN TRANSACTION
DELETE FROM ClassificationLanguages 
WHERE ClassificationID = @ClassificationID 

DELETE FROM Classifications
WHERE ClassificationID = @ClassificationID 

COMMIT TRANSACTION
END