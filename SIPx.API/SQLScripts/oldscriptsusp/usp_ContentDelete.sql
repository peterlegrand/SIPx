CREATE PROCEDURE [dbo].[usp_ContentDelete] (
	@ContentId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ContentClassificationValues WHERE ContentId = @ContentID
DELETE FROM Contents WHERE ContentID= @ContentID
COMMIT TRANSACTION
