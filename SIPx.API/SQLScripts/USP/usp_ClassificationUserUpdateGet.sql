CREATE PROCEDURE [dbo].[usp_ClassificationUserUpdateGet] (@UserId nvarchar(450), @ClassificationUserId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationUsers.ClassificationUserID
	, ClassificationUsers.ClassificationID
	, ClassificationUsers.ClassificationRelationTypeID
	,ClassificationUsers.UserID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ClassificationUsers.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ClassificationUsers.ModifiedDate
FROM ClassificationUsers 
JOIN Persons Creator
	ON Creator.UserId = ClassificationUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationUsers.ModifierID
WHERE ClassificationUsers.ClassificationUserId = @ClassificationUserID


