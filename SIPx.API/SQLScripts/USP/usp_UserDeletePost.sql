CREATE PROCEDURE usp_UserDeletePost (
	@SelectedPersonId int
	 )
AS
DELETE 
FROM Persons 
WHERE PersonID = @SelectedPersonId 
	AND UserID IS NOT NULL 