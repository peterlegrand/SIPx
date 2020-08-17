CREATE PROCEDURE [dbo].[usp_PersonRelationCreatePost] (
	@FromPersonId int
	, @ToPersonId int
	, @ValidFrom DateTime
	, @ValidTo DateTime
	, @PersonRelationTypeId int
	, @UserId nvarchar(450)) 
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
