CREATE PROCEDURE [dbo].[usp_UserMenuCreatePost] (
	@Name nvarchar(50)
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @Icon nvarchar(20)
	, @Sequence int
	, @CreatorId nvarchar(450)) 

AS 
BEGIN TRANSACTION

UPDATE UserMenus SET Sequence = Sequence + 1 
WHERE UserId = @CreatorId
	AND Sequence >= @Sequence


INSERT INTO UserMenus (
	UserId
	, Name
	, UserPageIdLeft
	, UserPageIdRight
	, Icon
	, Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@CreatorId
	, @Name
	, @UserPageIdLeft
	, @UserPageIdRight
	, @Icon
	, @Sequence
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


	COMMIT TRANSACTION


