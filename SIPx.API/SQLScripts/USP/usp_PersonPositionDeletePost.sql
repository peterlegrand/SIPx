CREATE PROCEDURE usp_PersonPositionDeletePost ( @UserId nvarchar(450), @OrganizationPersonId int)
AS
DELETE FROM OrganizationPersons 
WHERE OrganizationPersonID = @OrganizationPersonId
