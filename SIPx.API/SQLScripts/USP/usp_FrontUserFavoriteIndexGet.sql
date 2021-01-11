CREATE PROCEDURE usp_FrontUserFavoriteUpdateGet (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT MVCFavorites.MVCFavoriteId
	, MVCFavorites.Name
	, ISNULL(MVCFavoriteGroups.MVCFavoriteGroupId,0) MVCFavoriteGroupId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, MVCFavorites.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, MVCFavorites.ModifiedDate
FROM MVCFavorites 
LEFT JOIN MVCFavoriteGroups 
	ON MVCFavorites.MVCFavoriteGroupId = MVCFavoriteGroups.MVCFavoriteGroupId
JOIN Persons Creator
	ON Creator.UserId = MVCFavorites.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = MVCFavorites.ModifierID
ORDER BY 
MVCFavoriteGroups.Sequence, MVCFavorites.Sequence
