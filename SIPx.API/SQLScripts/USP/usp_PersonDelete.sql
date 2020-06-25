CREATE PROCEDURE [dbo].[usp_PersonDelete] (
	@PersonID int) 
AS 
DELETE FROM Persons WHERE PersonID = @PersonID


