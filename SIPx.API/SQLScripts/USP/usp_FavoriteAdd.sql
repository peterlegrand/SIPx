CREATE PROCEDURE usp_MVCFavoriteAdd (
	@UserID nvarchar(450)
	, @Controller nvarchar(450)
	, @Action nvarchar(450) 
	, @RouteId int
	, @Name nvarchar(50)
	, @Sequence int
	, @MVCFavoriteGroupId int
	) 
AS 
SET XACT_ABORT ON;
BEGIN TRANSACTION

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


