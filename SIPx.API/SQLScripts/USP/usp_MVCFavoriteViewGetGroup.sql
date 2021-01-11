CREATE PROCEDURE usp_MVCFavoriteViewGetGroup (@UserID nvarchar(450) )
AS
SELECT 
	MVCFavoriteGroupId
	, Name
FROM MVCFavoriteGroups
WHERE UserId = @UserId
ORDER BY Sequence