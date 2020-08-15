CREATE PROCEDURE [dbo].[usp_UserMenuUpdatePost] (
	@UserMenuID int
	, @Name nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserPageIdLeft int
	, @UserPageIdRight int
	, @UserMenuTypeIDLeft int
	, @UserMenuTypeIDRight int
	, @IconId Int
	, @Sequence int
	, @ModifierID nvarchar(450)) 

AS 

DECLARE @OldSequence int;
SELECT @OldSequence = Sequence FROM UserMenus WHERE UserMenuId = @UserMenuId;
BEGIN TRANSACTION
IF @OldSequence > @Sequence
BEGIN
UPDATE UserMenus SET Sequence = Sequence + 1 WHERE Sequence < @Sequence AND Sequence >= @OldSequence AND UserID = @ModifierID 
END
ELSE
BEGIN
UPDATE UserMenus SET Sequence = Sequence - 1 WHERE Sequence <= @Sequence AND Sequence > @OldSequence AND UserID = @ModifierID
END

UPDATE UserMenus SET
	Name = @Name
	, MouseOver = @MouseOver
	, UserPageIdLeft = @UserPageIdLeft
	, UserPageIdRight = @UserPageIdRight
	, UserMenuTypeIDLeft = @UserMenuTypeIDLeft
	, UserMenuTypeIDRight = @UserMenuTypeIDRight
	, IconId = @IconId
	, Sequence = @Sequence
	, ModifierID = @ModifierID
	, ModifiedDate = Getdate()
WHERE UserID = @ModifierID
	AND UserMenuID = @UserMenuID
	COMMIT TRANSACTION

