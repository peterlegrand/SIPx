CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeDelete] (
	@ClassificationRelationTypeID int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationRelationTypeLanguages WHERE ClassificationRelationTypeID = @ClassificationRelationTypeID
DELETE FROM ClassificationRelationTypes WHERE ClassificationRelationTypeID = @ClassificationRelationTypeID
COMMIT TRANSACTION
GO


