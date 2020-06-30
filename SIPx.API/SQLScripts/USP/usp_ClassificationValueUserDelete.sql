CREATE PROCEDURE [dbo].[usp_ClassificationValueUserDelete] (
	@ClassificationValueUserId int) 
AS 
DELETE FROM ClassificationValueUsers WHERE @ClassificationValueUserId = ClassificationValueUserID

