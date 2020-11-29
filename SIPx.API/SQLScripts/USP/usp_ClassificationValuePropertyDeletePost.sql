CREATE PROCEDURE [dbo].[usp_ClassificationValuePropertyDeletePost] (
	@ClassificationValuePropertyId int) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ClassificationValuePropertyLanguages WHERE @ClassificationValuePropertyId = ClassificationValuePropertyID
DELETE FROM ClassificationValueProperties WHERE @ClassificationValuePropertyId = ClassificationValuePropertyID
COMMIT TRANSACTION