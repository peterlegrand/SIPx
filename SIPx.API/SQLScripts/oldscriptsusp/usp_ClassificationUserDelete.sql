CREATE PROCEDURE [dbo].[usp_ClassificationUserDelete] (
	@ClassificationUserId int) 
AS 
DELETE FROM ClassificationUsers WHERE @ClassificationUserId = ClassificationUserID


