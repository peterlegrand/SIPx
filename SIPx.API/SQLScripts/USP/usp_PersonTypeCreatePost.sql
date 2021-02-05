CREATE PROCEDURE usp_PersonTypeCreatePost (
	 @CodePrefix nvarchar(25)
	, @CodeSuffix nvarchar(25)
	, @CodeTypeId int
	, @ObjectTypeStatusId int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color nchar(9)
	, @IconId int
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO PersonTypes (
	 CodePrefix 
	, CodeSuffix 
	, CodeTypeId 
	, ObjectTypeStatusId
	, Color
	, IconId
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	 @CodePrefix 
	, @CodeSuffix 
	, @CodeTypeId 
	, @ObjectTypeStatusId
	, @Color
	, @IconId
	, @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPersonTypeId int	= scope_identity();

INSERT INTO PersonTypeLanguages (
	PersonTypeID
	, LanguageID
	, Name
	, Description
	, MenuName
	, MouseOver
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@NewPersonTypeId 
	, @LanguageID
	, @Name
	, @Description
	, @MenuName
	, @MouseOver
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION



