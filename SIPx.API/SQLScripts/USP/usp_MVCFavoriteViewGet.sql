ALTER PROCEDURE usp_MVCFavoriteViewGet (@UserID nvarchar(450) , @MVCFavoriteGroupId int = null)
AS
SELECT 
	Name
	, Controller
	, Action	
	, ISNULL(RouteId,0) RouteId
FROM MVCFavorites
WHERE UserId = @UserId
AND (
	MVCFavoriteGroupId = @MVCFavoriteGroupId 
	OR 
	(@MVCFavoriteGroupId  IS NULL AND MVCFavoriteGroupId IS NULL)
	)
 ORDER BY Sequence
