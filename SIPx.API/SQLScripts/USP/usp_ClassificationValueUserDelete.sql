CREATE PROCEDURE [dbo].[usp_ClassificationValueUserDelete] (
	@ClassificationValueUserID int) 
AS 
DELETE FROM ClassificationValueUsers WHERE @ClassificationValueUserID = ClassificationValueUserID

