CREATE PROCEDURE usp_PartialLeftUserMenu (@UserId nvarchar(450))
AS
SELECT 
	Name
	, MouseOver
	, TRIM(Icons.FileName) Icon
	, UserMenuTypeIDLeft
	, UserPageIdLeft
	, UserMenuTypeIDRight
	, UserPageIdRight
	, CONCAT('LeftControl' , UserMenus.UserMenuID) LeftControl
	, CONCAT('RightControl' , UserMenus.UserMenuID ) RightControl
FROM UserMenus
JOIN Icons	
	ON ICons.IconId = UserMenus.IconID
WHERE UserID = @UserId
ORDER BY UserMenus.Sequence
