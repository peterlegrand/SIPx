CREATE PROCEDURE usp_ClassificationRelationTypeDeletePost (@UserId nvarchar(450), @ClassificationRelationTypeId int)
AS
BEGIN TRANSACTION
DELETE FROM ClassificationRelationTypeLanguages 
WHERE ClassificationRelationTypeID  = @ClassificationRelationTypeId 

DELETE FROM ClassificationRelationTypes 
WHERE ClassificationRelationTypeID = @ClassificationRelationTypeId
COMMIT TRANSACTION