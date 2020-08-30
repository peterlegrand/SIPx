CREATE PROCEDURE [dbo].[usp_ContentClassificationValueIndexGet] (@UserId nvarchar(450), @ContentID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ContentClassificationValues.ContentClassificationValueID
	, ContentClassificationValues.ClassificationID
	, ContentClassificationValues.ClassificationValueID
	, ISNULL(ClassificationLanguages.Name, 'No classification name') ClassificationName
	, ISNULL(ClassificationValueLanguages.Name, 'No classification value name') ClassificationValueName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ContentClassificationValues.CreatedDate
	, Creator.PersonID CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ContentClassificationValues.ModifiedDate
	, Modifier.PersonID ModifierId
FROM ContentClassificationValues
JOIN ClassificationValueLanguages
	ON ContentClassificationValues.ClassificationValueID = ClassificationValueLanguages.ClassificationValueID
JOIN ClassificationLanguages
	ON ClassificationLanguages.ClassificationID = ContentClassificationValues.ClassificationID
JOIN Persons Creator
	ON Creator.UserId = ContentClassificationValues.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ContentClassificationValues.ModifierID
WHERE ContentClassificationValues.ContentID = @ContentID
	AND ClassificationValueLanguages.LanguageID = @LanguageId
	AND ClassificationLanguages.LanguageID = @LanguageId
ORDER BY ISNULL(ClassificationLanguages.Name, 'No classification name')
