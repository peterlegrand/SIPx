CREATE PROCEDURE usp_OrganizationPositionDeletePost ( @UserId nvarchar(450), @OrganizationPersonId int)
AS
DELETE FROM OrganizationPersons 
WHERE OrganizationPersonID = @OrganizationPersonId
