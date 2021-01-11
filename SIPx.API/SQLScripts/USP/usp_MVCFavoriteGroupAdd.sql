CREATE PROCEDURE usp_MVCFavoriteGroupAdd (
	@UserID nvarchar(450)
	, @Name nvarchar(50)
	, @Sequence int
	) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION

UPDATE MVCFavoriteGroups 
SET Sequence = Sequence + 1
WHERE UserId = @UserId 
	AND Sequence <= @Sequence

INSERT INTO MVCFavoriteGroups(
	UserId
	, Sequence
	, Name
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserID
	, @Sequence
	, @Name
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION


