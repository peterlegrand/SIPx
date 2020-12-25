CREATE PROCEDURE usp_UserMenuDeletePost (@UserId nvarchar(450),@UserMenuId int)
AS
DELETE FROM UserMenus WHERE UserMenuID = @UserMenuId