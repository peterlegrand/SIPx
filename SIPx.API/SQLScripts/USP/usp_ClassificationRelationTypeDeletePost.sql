CREATE PROCEDURE usp_ClassificationRelationTypeDeletePost (@ClassificationRelationTypeId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM ClassificationRelationTypeLanguages 
WHERE ClassificationRelationTypeID  = @ClassificationRelationTypeId 

DELETE FROM ClassificationRelationTypes 
WHERE ClassificationRelationTypeID = @ClassificationRelationTypeId
COMMIT TRANSACTION