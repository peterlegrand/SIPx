CREATE PROCEDURE [dbo].[usp_FrontClassificationValueIndexGetUsers] (@CurrentUserId nvarchar(450), @ClassificationValueId int) 
AS 
BEGIN
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @CurrentUserId 
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT ClassificationValueUsers.ClassificationValueUserID
	, ClassificationValueUsers.ClassificationRelationTypeID
	, ClassificationValueUsers.ClassificationValueID
	, ClassificationValueUsers.UserID
	, Persons.FirstName
	, Persons.LastName
	, Persons.PersonID
	, ISNULL(UserClassificationRelationTypeLanguage.Name,ISNULL(DefaultClassificationRelationTypeLanguage.Name,'No name for this relation type')) ClassificationRelationTypeName

FROM ClassificationValueUsers
JOIN Persons
	ON ClassificationValueUsers.UserID = Persons.UserID

LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages WHERE LanguageId = @LanguageID) UserClassificationRelationTypeLanguage
	ON UserClassificationRelationTypeLanguage.ClassificationRelationTypeID= ClassificationValueUsers.ClassificationRelationTypeID
LEFT JOIN (SELECT ClassificationRelationTypeId, Name FROM ClassificationRelationTypeLanguages JOIN Settings ON ClassificationRelationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationRelationTypeLanguage
	ON DefaultClassificationRelationTypeLanguage.ClassificationRelationTypeId = ClassificationValueUsers.ClassificationRelationTypeID
WHERE ClassificationValueUsers.ClassificationValueID = @ClassificationValueId
END