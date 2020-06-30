CREATE PROCEDURE [dbo].[usp_PersonRelationUpdate] (
	@PersonRelationId int
	, @FromPersonId int
	, @ToPersonId int
	, @ValidFrom int
	, @ValidTill int
	, @PersonRelationTypeId int
	, @UserId nvarchar(450)) 
AS 
UPDATE  PersonRelations SET 
	FromPersonID= @FromPersonID
	, ToPersonID= @ToPersonID
	, ValidFrom = @ValidFrom
	, ValidTill = @ValidTill
	, PersonRelationTypeId = @PersonRelationTypeID
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE PersonRelationID= @PersonRelationID

