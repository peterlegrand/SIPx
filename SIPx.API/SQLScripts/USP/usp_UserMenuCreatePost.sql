CREATE PROCEDURE [dbo].[usp_UserMenuCreatePost] (
	@Name nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @UserMenuTypeIDLeft int
	, @UserMenuTypeIDRight int
	, @IconId Int
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
	, MouseOver
	, UserPageIdLeft
	, UserPageIdRight
	, UserMenuTypeIDLeft
	, UserMenuTypeIDRight
	, IconId
	, Sequence
	, CreatorID
	, CreatedDate
	, ModifierID
	, ModifiedDate)
VALUES (
	@CreatorId
	, @Name
	, @MouseOver
	, @UserPageIdLeft
	, @UserPageIdRight
	, @UserMenuTypeIDLeft
	, @UserMenuTypeIDRight
	, @IconId
	, @Sequence
	, @CreatorId
	, getdate()
	, @CreatorId
	, getdate())


	COMMIT TRANSACTION


