CREATE PROCEDURE usp_FavoriteAdd (@UserID nvarchar(450), @Controller nvarchar(450), @Action nvarchar(450) ) 
AS 
BEGIN TRANSACTION

INSERT INTO Favorites (
	UserId
	, Controller
	, Action
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@UserID
	, @Controller
	, @Action
	, @UserID
	, getdate()
	, @UserID
	, getdate())

	COMMIT TRANSACTION


