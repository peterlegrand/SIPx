CREATE PROCEDURE usp_MVCFavoriteViewMenu (@UserID nvarchar(450) )
AS

DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;


select id, name text, url, parentId FROM (
SELECT DISTINCT 
	'root' id
	, ISNULL(Customization.Customization ,UITermLanguages.Name) name
	, '' url, '' parentId , 'a' sequence
FROM UITerms
JOIN UITermLanguages 
	ON UITermLanguages.UITermID = UITerms.UITermID 
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageId) Customization
	ON UITermLanguages.UITermID = Customization.UITermID 
WHERE UITermLanguages.LanguageID = @LanguageId
	AND UITerms.InternalName = 'Favorites'

UNION ALL
SELECT concat('roota',MVCFavoriteId) id, name, concat('/',Controller,'/',Action) url, 'root' parentId, concat('roota',Sequence) Sequence FROM MVCFavorites WHERE MVCFavoriteGroupId is null AND UserId = @UserID
UNION ALL
SELECT concat('rootB',MVCFavoriteGroupId) id, name,'' url, 'root' parentId, concat('rootB',Sequence) Sequence  FROM MVCFavoriteGroups WHERE  UserId = @UserID
UNION ALL
SELECT concat('rootC',MVCFavoriteId) id, name, concat('/',Controller,'/',Action) url, concat('rootB',MVCFavoriteGroupId) parentId,  concat('rootc',Sequence)  FROM MVCFavorites WHERE MVCFavoriteGroupId is not null  AND UserId = @UserID
UNION ALL 
SELECT DISTINCT 
	'rootx' id
	, ISNULL(Customization.Customization ,UITermLanguages.Name) name
	, '/UserFavorites/Index' url, 'root' parentId , 'z' sequence
FROM UITerms
JOIN UITermLanguages 
	ON UITermLanguages.UITermID = UITerms.UITermID 
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageID = @LanguageId) Customization
	ON UITermLanguages.UITermID = Customization.UITermID 
WHERE UITermLanguages.LanguageID = @LanguageId
	AND UITerms.InternalName = 'Manage favorites'

) FavoriteMenu order by sequence

