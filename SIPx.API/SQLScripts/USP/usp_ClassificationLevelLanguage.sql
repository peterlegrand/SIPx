CREATE PROCEDURE [dbo].[usp_ClassificationLevelLanguage] (@ClassificationLevelLanguageID int) 
AS 
SELECT ClassificationLevels.ClassificationLevelID 
	, ClassificationLevelLanguages.ClassificationLevelLanguageID
	, ClassificationLevelLanguages.LanguageID
	, ClassificationLevelLanguages.Name
	, ClassificationLevelLanguages.Description
	, ClassificationLevelLanguages.MenuName
	, ClassificationLevelLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationLevelLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationLevelLanguages.ModifiedDate
FROM ClassificationLevels
JOIN ClassificationLevelLanguages
	ON ClassificationLevels.ClassificationLevelID = ClassificationLevelLanguages.ClassificationLevelID
JOIN Persons Creator
	ON Creator.UserID = ClassificationLevelLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationLevelLanguages.ModifierID
WHERE ClassificationLevelLanguages.ClassificationLevelLanguageID = @ClassificationLevelLanguageID



