CREATE PROCEDURE [dbo].[usp_ClassificationValueUserIndexGet] (@UserId nvarchar(450), @ClassificationID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValueUsers.ClassificationValueUserID
	, Persons.UserID
	, Persons.FirstName
	, Persons.LastName
	, OrganizationLanguages.Name OrganizationName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationValueUsers.CreatedDate
	, ClassificationValueUsers.CreatorID
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationValueUsers.ModifiedDate
	, ClassificationValueUsers.ModifierID
FROM ClassificationValueUsers
JOIN Persons
	ON ClassificationValueUsers.UserID = Persons.UserID
JOIN OrganizationLanguages
	ON Persons.DefaultOrganizationID = OrganizationLanguages.OrganizationID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueUsers.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueUsers.ModifierID
WHERE ClassificationValueUsers.ClassificationID = @ClassificationID
	AND OrganizationLanguages.LanguageID = @LanguageId
ORDER BY Persons.FirstName
	, Persons.LastName
