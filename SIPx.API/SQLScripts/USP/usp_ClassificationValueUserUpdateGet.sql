CREATE PROCEDURE [dbo].[usp_ClassificationValueUserUpdateGet] (@UserId nvarchar(450), @ClassificationValueUserId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValueUsers.ClassificationValueUserID
	, ClassificationValueUsers.ClassificationID
	, ClassificationValueUsers.ClassificationValueID
	, ClassificationValueUsers.UserID UserOfClassificationValueId
	, ClassificationValueUsers.ClassificationRelationTypeID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationValueUsers.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationValueUsers.ModifiedDate
FROM ClassificationValueUsers 
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueUsers.ModifierID
WHERE ClassificationValueUsers.ClassificationValueUserId = @ClassificationValueUserID
