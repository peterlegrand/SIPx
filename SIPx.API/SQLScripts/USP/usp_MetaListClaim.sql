CREATE PROCEDURE usp_MetaListClaim
AS
SELECT Claims.ClaimID 
	, UITermLanguages.Name ClaimName
	, ClaimGroups.ClaimGroupID
	, GroupLanguage.Name ClaimGroupName
FROM Claims 
JOIN UITermLanguages 
	ON Claims.NameTermID = UITermLanguages.UITermID 
JOIN ClaimGroups
	ON Claims.ClaimGroupID = ClaimGroups.ClaimGroupID
JOIN UITermLanguages GroupLanguage
	ON ClaimGroups.NameTermID = GroupLanguage.UITermID 
WHERE GroupLanguage.LanguageID =41
	AND UITermLanguages.LanguageID = 41
ORDER BY GroupLanguage.Name 
	, UITermLanguages.Name 
	

