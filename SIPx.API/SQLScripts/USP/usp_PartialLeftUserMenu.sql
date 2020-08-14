CREATE PROCEDURE usp_PartialLeftUserMenu (@UserId nvarchar(450))
AS
SELECT 
	Name
	, TRIM(Icons.FileName) Icon
	, UserMenuTypeIDLeft
	, UserPageIdLeft
	, UserMenuTypeIDRight
	, UserPageIdRight
FROM UserMenus
JOIN Icons	
	ON ICons.IconId = UserMenus.IconID
WHERE UserID = @UserId
ORDER BY UserMenus.Sequence
