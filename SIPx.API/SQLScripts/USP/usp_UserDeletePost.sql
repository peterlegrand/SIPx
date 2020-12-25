CREATE PROCEDURE usp_UserDeletePost (
	@UserId nvarchar(450), @SelectedPersonId int
	 )
AS
DELETE 
FROM Persons 
WHERE PersonID = @SelectedPersonId 
	AND UserID IS NOT NULL 