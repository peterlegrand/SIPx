CREATE PROCEDURE [dbo].[usp_PersonRelationTypeDelete] (
	@PersonRelationTypeID int) 
AS 
BEGIN TRANSACTION
DELETE FROM PersonRelationTypeLanguages WHERE @PersonRelationTypeID = PersonRelationTypeID
DELETE FROM PersonRelationTypes WHERE @PersonRelationTypeID = PersonRelationTypeID
COMMIT TRANSACTION
GO


