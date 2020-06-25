CREATE PROCEDURE [dbo].[usp_PersonRelationUpdate] (
	@PersonRelationID int
	, @FromPersonID int
	, @ToPersonID int
	, @ValidFrom int
	, @ValidTill int
	, @PersonRelationTypeID int
	, @User nvarchar(450)) 
AS 
UPDATE  PersonRelations SET 
	FromPersonID= @FromPersonID
	, ToPersonID= @ToPersonID
	, ValidFrom = @ValidFrom
	, ValidTill = @ValidTill
	, PersonRelationTypeID = @PersonRelationTypeID
	, ModifierID = @User
	, ModifiedDate = getdate()
WHERE PersonRelationID= @PersonRelationID

