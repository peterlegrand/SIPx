CREATE PROCEDURE usp_UserMenuDeletePostCheck (@UserId nvarchar(450),@UserMenuId int)
AS
DELETE FROM UserMenus WHERE UserMenuID = @UserMenuId