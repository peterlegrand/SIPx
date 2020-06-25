CREATE PROCEDURE [dbo].[usp_PersonRelationTypeCreate] (
	@LanguageID int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @User nvarchar(450)) 
AS 
BEGIN TRANSACTION

INSERT INTO PersonRelationTypes (
	CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@User
	, getdate()
	, @User
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
	, @User
	, getdate()
	, @User
	, getdate())

	COMMIT TRANSACTION
