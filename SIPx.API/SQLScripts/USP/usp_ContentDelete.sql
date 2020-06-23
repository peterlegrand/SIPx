CREATE PROCEDURE [dbo].[usp_ContentDelete] (
	@ContentID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ContentClassificationValues WHERE ContentID = @ContentID
DELETE FROM Contents WHERE ContentID= @ContentID
COMMIT TRANSACTION
