CREATE PROCEDURE usp_OrganizationPositionUpdatePost (
	@OrganizationPersonId  int
	, @PersonId int
	, @PositionId int
	, @UserId nvarchar(450)) 
AS 

UPDATE OrganizationPersons SET
	 PersonId  = @PersonId
	, PositionID = @PositionId 
	, ModifierId = @UserId
	, ModifiedDate = getdate()
	WHERE OrganizationPersonId = @OrganizationPersonId
	
