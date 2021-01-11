CREATE PROCEDURE usp_MVCFavoriteGroupList (@UserID nvarchar(450) )
AS

SELECT 
	MVCFavoriteGroupId
	, Name 
FROM MVCFavoriteGroups 
WHERE UserId= @UserID 
ORDER BY Sequence
