CREATE PROCEDURE usp_ClassificationPageSectionSequenceList (@UserId nvarchar(450),@ClassificationPageSectionId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @ClassificationPageId int;
SELECT @ClassificationPageId =ClassificationPageId 
FROM ClassificationPageSections
WHERE ClassificationPageSectionID = @ClassificationPageSectionId;
DECLARE @MaxSequence int;
SELECT @MaxSequence = MAX(Sequence) + 1 
FROM ClassificationPageSections 
WHERE ClassificationPageSections.ClassificationPageID = @ClassificationPageId;

SELECT ClassificationPageSections.Sequence, Name 
FROM ClassificationPageSections 
JOIN ClassificationPageSectionLanguages
	ON ClassificationPageSections.ClassificationPageSectionID = ClassificationPageSectionLanguages.ClassificationPageSectionID
WHERE ClassificationPageSections.ClassificationPageID = @ClassificationPageId
	AND ClassificationPageSectionLanguages.LanguageID = @LanguageId 
UNION ALL
SELECT @MaxSequence, 'Place at the bottom' 
ORDER BY Sequence;
