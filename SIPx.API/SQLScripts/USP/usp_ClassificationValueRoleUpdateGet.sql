CREATE PROCEDURE [dbo].[usp_ClassificationValueRoleUpdateGet] (@UserId nvarchar(450), @ClassificationValueRoleId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValueRoles.RoleID
	,ClassificationValueRoles.ClassificationID
	,ClassificationValueRoles.ClassificationRelationTypeID
	,ClassificationValueRoles.ClassificationValueID
	,ClassificationValueRoles.ClassificationValueRoleID
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValueRoles.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValueRoles.ModifiedDate
FROM ClassificationValueRoles 
JOIN Persons Creator
	ON Creator.UserId = ClassificationValueRoles.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValueRoles.ModifierID
WHERE ClassificationValueRoles.ClassificationValueroleId = @ClassificationValueRoleID


