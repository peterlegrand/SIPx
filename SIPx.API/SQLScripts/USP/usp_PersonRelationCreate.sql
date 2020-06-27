CREATE PROCEDURE [dbo].[usp_PersonRelationCreate] (
	@FromPersonID int
	, @ToPersonID int
	, @ValidFrom DateTime
	, @ValidTo DateTime
	, @PersonRelationTypeID int
	, @UserID nvarchar(450)) 
AS 

INSERT INTO PersonRelations (
	FromPersonID
	, ToPersonID
	, ValidFrom
	, ValidTill
	, PersonRelationTypeID
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@FromPersonID
	, @ToPersonID
	, @ValidFrom
	, @ValidTo
	, @PersonRelationTypeID
	, @UserID
	, getdate()
	, @UserID
	, getdate())
