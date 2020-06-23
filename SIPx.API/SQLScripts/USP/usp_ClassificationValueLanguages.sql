CREATE PROCEDURE [dbo].[usp_ClassificationValueLanguages] (@ClassificationValueID int) 
AS 
SELECT ClassificationValues.ClassificationValueID 
	, ClassificationValueLanguages.ClassificationValueLanguageID
	, ClassificationValueLanguages.LanguageID
	, ClassificationValueLanguages.Name
	, ClassificationValueLanguages.Description
	, ClassificationValueLanguages.MenuName
	, ClassificationValueLanguages.MouseOver
	, ClassificationValueLanguages.PageName
	, ClassificationValueLanguages.PageDescription
	, ClassificationValueLanguages.HeaderName
	, ClassificationValueLanguages.HeaderDescription
	, ClassificationValueLanguages.TopicName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValueLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValueLanguages.ModifiedDate
FROM ClassificationValues
JOIN ClassificationValueLanguages
	ON ClassificationValues.ClassificationValueID = ClassificationValueLanguages.ClassificationValueID
JOIN Persons Creator
	ON Creator.UserID = ClassificationValueLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationValueLanguages.ModifierID
WHERE ClassificationValues.ClassificationValueID = @ClassificationValueID



