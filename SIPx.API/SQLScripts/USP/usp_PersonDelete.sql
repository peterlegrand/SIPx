CREATE PROCEDURE [dbo].[usp_PersonDelete] (
	@PersonId int) 
AS 
DELETE FROM Persons WHERE PersonId = @PersonID


