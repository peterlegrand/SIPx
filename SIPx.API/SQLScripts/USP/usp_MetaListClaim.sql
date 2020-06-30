CREATE PROCEDURE usp_MetaListClaim
AS
SELECT Claims.ClaimId 
	, UITermLanguages.Name ClaimName
	, ClaimGroups.ClaimGroupID
	, GroupLanguage.Name ClaimGroupName
FROM Claims 
JOIN UITermLanguages 
	ON Claims.NameTermId = UITermLanguages.UITermId 
JOIN ClaimGroups
	ON Claims.ClaimGroupId = ClaimGroups.ClaimGroupID
JOIN UITermLanguages GroupLanguage
	ON ClaimGroups.NameTermId = GroupLanguage.UITermId 
WHERE GroupLanguage.LanguageId =41
	AND UITermLanguages.LanguageId = 41
ORDER BY GroupLanguage.Name 
	, UITermLanguages.Name 
	

