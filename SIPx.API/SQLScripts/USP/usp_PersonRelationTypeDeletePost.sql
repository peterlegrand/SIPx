CREATE PROCEDURE usp_PersonRelationTypeDeletePost ( @PersonRelationTypeId int)
AS
SET XACT_ABORT ON;
BEGIN TRANSACTION
DELETE FROM PersonRelationTypeLanguages 
WHERE PersonRelationTypeID  = @PersonRelationTypeId 

DELETE FROM PersonRelationTypes 
WHERE PersonRelationTypeID = @PersonRelationTypeId
COMMIT TRANSACTION