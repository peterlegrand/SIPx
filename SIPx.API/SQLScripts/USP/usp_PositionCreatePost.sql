CREATE PROCEDURE usp_PositionCreatePost (
	 @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserId nvarchar(450)) 
AS 

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO Positions (
	 CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	 @UserID
	, getdate()
	, @UserID
	, getdate())


DECLARE @NewPositionId int	= scope_identity();

INSERT INTO PositionLanguages (
	PositionID
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
	@NewPositionId 
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