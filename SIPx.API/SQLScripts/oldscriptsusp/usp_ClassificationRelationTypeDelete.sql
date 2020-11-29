CREATE PROCEDURE [dbo].[usp_ClassificationRelationTypeDelete] (
	@ClassificationRelationTypeId int) 
AS 
BEGIN TRANSACTION
DELETE FROM ClassificationRelationTypeLanguages WHERE ClassificationRelationTypeId = @ClassificationRelationTypeID
DELETE FROM ClassificationRelationTypes WHERE ClassificationRelationTypeId = @ClassificationRelationTypeID
COMMIT TRANSACTION
