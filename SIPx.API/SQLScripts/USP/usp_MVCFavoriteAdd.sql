CREATE PROCEDURE usp_MVCFavoriteAdd (
	@UserID nvarchar(450)
	, @Controller nvarchar(450)
	, @Action nvarchar(450) 
	, @RouteId int = null 
	, @Name nvarchar(50)
	, @Sequence int = null
	, @MVCFavoriteGroupId int = null
	) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION
IF @Sequence IS NULL
BEGIN
IF @MVCFavoriteGroupId IS NULL
BEGIN
SELECT @Sequence = max(sequence)+ 1 FROM MVCFavorites WHERE UserId = @UserID AND MVCFavoriteGroupId IS NULL
END
ELSE
BEGIN
SELECT @Sequence = max(sequence)+ 1 FROM MVCFavorites WHERE UserId = @UserID AND MVCFavoriteGroupId = @MVCFavoriteGroupId
END
END
UPDATE MVCFavorites 
SET Sequence = Sequence + 1
WHERE MVCFavoriteGroupId = @MVCFavoriteGroupId 
	AND UserId = @UserId 
	AND Sequence <= @Sequence

INSERT INTO MVCFavorites (
	UserId
	, Controller
	, Action
	, RouteId
	, Sequence
	, MVCFavoriteGroupId
	, Name
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserID
	, @Controller
	, @Action
	, @RouteId
	, @Sequence
	, @MVCFavoriteGroupId
	, @Name
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION


