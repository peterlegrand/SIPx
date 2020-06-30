CREATE PROCEDURE [dbo].[usp_PersonRelationTypeDelete] (
	@PersonRelationTypeId int) 
AS 
BEGIN TRANSACTION
DELETE FROM PersonRelationTypeLanguages WHERE @PersonRelationTypeId = PersonRelationTypeID
DELETE FROM PersonRelationTypes WHERE @PersonRelationTypeId = PersonRelationTypeID
COMMIT TRANSACTION


