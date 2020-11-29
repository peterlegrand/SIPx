CREATE PROCEDURE usp_PersonRelationTypeCreatePost (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @FromIsAnXOfTo nvarchar(50)
	, @ToIsAnXOfFrom nvarchar(50)
	, @SeePersonal bit
	, @Color char(9)
	, @IconId int
	, @UserId nvarchar(450)) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserId
	AND UserPreferences.PreferenceTypeId = 1 ;

INSERT INTO PersonRelationTypes (
	Color
	, IconId 
	, SeePersonal
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@Color
	, @IconId 
	, @SeePersonal
	,	@UserID
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
