CREATE PROCEDURE [dbo].[usp_ContentTypeClassificationStatusViewGet] (@LanguageID int)
AS
BEGIN
SELECT
	ContentTypeClassificationStatusLanguages.ContentTypeClassificationStatusID
	, ContentTypeClassificationStatusLanguages.Name
	, ContentTypeClassificationStatusLanguages.Description
	, ContentTypeClassificationStatusLanguages.MenuName
	, ContentTypeClassificationStatusLanguages.MouseOver
FROM ContentTypeClassificationStatusLanguages
WHERE ContentTypeClassificationStatusLanguages.LanguageID = @LanguageID
ORDER BY Name
END


