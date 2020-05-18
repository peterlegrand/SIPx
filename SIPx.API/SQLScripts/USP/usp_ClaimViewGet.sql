CREATE PROCEDURE usp_ClaimViewGet (@LanguageID int)
AS
BEGIN
SELECT
	Claims.ClaimID
	, Claims.ClaimType
	, Claims.ClaimValue
	, Claims.ClaimGroupID
	, ClaimLanguages.Name
	, ClaimLanguages.Description
	, ClaimLanguages.MouseOver
	, ClaimLanguages.MenuName
	, ClaimGroups.Sequence
	, ClaimGroupLanguages.Name GroupName
	, ClaimGroupLanguages.Description GroupDescription
	, ClaimGroupLanguages.MenuName GroupMenuName
	, ClaimGroupLanguages.MouseOver GroupMouseOver
FROM Claims 
JOIN ClaimLanguages
	ON Claims.ClaimID = ClaimLanguages.ClaimID
JOIN ClaimGroups
	ON Claims.ClaimGroupID = ClaimGroups.ClaimGroupID
JOIN ClaimGroupLanguages
	ON ClaimGroups.ClaimGroupID = ClaimGroupLanguages.ClaimGroupID
WHERE ClaimLanguages.LanguageID = @LanguageID 
	AND ClaimGroupLanguages.LanguageID = @LanguageID 
ORDER BY ClaimGroups.Sequence, ClaimLanguages.Name
END
