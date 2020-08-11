CREATE PROCEDURE usp_UserMenuUpdateGet(@UserMenuID int)
AS
SELECT * FROM UserMenus WHERE UserMenuID = @UserMenuID