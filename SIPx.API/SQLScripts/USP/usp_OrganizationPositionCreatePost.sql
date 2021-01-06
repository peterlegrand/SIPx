CREATE PROCEDURE usp_OrganizationPositionCreatePost (
	@OrganizationId int
	, @PersonId int
	, @PositionId int
	, @UserId nvarchar(450)) 
AS 
INSERT INTO OrganizationPersons (
	OrganizationId 
	, PersonId 
	, PositionId 
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@OrganizationId 
	, @PersonId 
	, @PositionId 
	, @UserId
	, getdate()
	, @UserId
	, getdate())




