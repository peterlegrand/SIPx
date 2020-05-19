CREATE PROCEDURE [dbo].[usp_ContentStatusViewGet] (@LanguageID int)
AS
BEGIN
SELECT
	ContentStatusLanguages.ContentStatusID
	, ContentStatusLanguages.Name
	, ContentStatusLanguages.Description
	, ContentStatusLanguages.MenuName
	, ContentStatusLanguages.MouseOver
FROM ContentStatusLanguages
WHERE ContentStatusLanguages.LanguageID = @LanguageID
ORDER BY Name
END
