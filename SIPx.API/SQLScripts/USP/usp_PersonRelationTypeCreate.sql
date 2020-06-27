CREATE PROCEDURE [dbo].[usp_PersonRelationTypeCreate] (
	@LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO PersonRelationTypes (
	CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPersonRelationTypeId int	= scope_identity();

INSERT INTO PersonRelationTypeLanguages (
	PersonRelationTypeID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, FromIsAnXOfTo
	, ToIsAnXOfFrom
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewPersonRelationTypeID
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @FromIsAnXOfTo
	, @ToIsAnXOfFrom
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION
