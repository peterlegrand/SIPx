CREATE PROCEDURE [dbo].[usp_UserMenuCreateGetSequence] (@UserId nvarchar(450)) 
AS 
SELECT UserMenus.Sequence
	, Name
FROM UserMenus 
WHERE UserMenus.UserId= @UserId
ORDER BY  UserMenus.Sequence

