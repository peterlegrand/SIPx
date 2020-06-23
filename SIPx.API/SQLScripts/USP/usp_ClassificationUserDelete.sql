CREATE PROCEDURE [dbo].[usp_ClassificationUserDelete] (
	@ClassificationUserID int) 
AS 
DELETE FROM ClassificationUsers WHERE @ClassificationUserID = ClassificationUserID


