CREATE PROCEDURE [dbo].[usp_PersonRelationUpdatePost] (
	@PersonRelationId int
	, @FromPersonId int
	, @ToPersonId int
	, @ValidFrom int
	, @ValidTill int
	, @PersonRelationTypeId int
	, @ModifierId nvarchar(450)) 
AS 
UPDATE  PersonRelations SET 
	FromPersonID= @FromPersonID
	, ToPersonID= @ToPersonID
	, ValidFrom = @ValidFrom
	, ValidTill = @ValidTill
	, PersonRelationTypeId = @PersonRelationTypeID
	, ModifierId = @ModifierId
	, ModifiedDate = getdate()
WHERE PersonRelationID= @PersonRelationID

