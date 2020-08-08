CREATE PROCEDURE usp_PartialLeftUserMenu (@UserId nvarchar(450))
AS
SELECT 
	Name
	, Icon
	, UserPageIdLeft
	, UserPageIdRight
FROM UserMenus
WHERE UserID = @UserId
ORDER BY Sequence
