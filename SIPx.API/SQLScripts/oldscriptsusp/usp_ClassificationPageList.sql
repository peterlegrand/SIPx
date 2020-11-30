CREATE PROCEDURE usp_ClassificationPageList (@UserId nvarchar(450),@ClassificationId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationPages.ClassificationPageID, Name 
FROM ClassificationPages 
JOIN ClassificationPageLanguages
	ON ClassificationPages.ClassificationPageID = ClassificationPageLanguages.ClassificationPageID
WHERE ClassificationPages.ClassificationID = @ClassificationId
	AND ClassificationPageLanguages.LanguageID = @LanguageId