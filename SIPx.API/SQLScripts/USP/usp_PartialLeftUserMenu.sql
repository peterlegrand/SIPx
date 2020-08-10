CREATE PROCEDURE usp_PartialLeftUserMenu (@UserId nvarchar(450))
AS
SELECT 
	Name
	, TRIM(Icon) Icon
	, UserMenuTypeIDLeft
	, UserPageIdLeft
	, UserMenuTypeIDRight
	, UserPageIdRight
FROM UserMenus
WHERE UserID = @UserId
ORDER BY Sequence
