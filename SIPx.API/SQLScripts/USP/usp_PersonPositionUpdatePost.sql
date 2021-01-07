CREATE PROCEDURE usp_PersonPositionUpdatePost (
	@OrganizationPersonId  int
	, @OrganizationId int
	, @PositionId int
	, @UserId nvarchar(450)) 
AS 

UPDATE OrganizationPersons SET
	 OrganizationId = @OrganizationId
	, PositionID = @PositionId 
	, ModifierId = @UserId
	, ModifiedDate = getdate()
	WHERE OrganizationPersonId = @OrganizationPersonId
	
