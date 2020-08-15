CREATE PROCEDURE usp_UserMenuDeletePost (@UserMenuId int)
AS
DELETE FROM UserMenus WHERE UserMenuID = @UserMenuId