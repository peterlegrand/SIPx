CREATE PROCEDURE usp_ProjectTypePropertyUpdateGet (@UserId nvarchar(450),@ObjectTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'ProjectTypeProperty', 'Edit',1,'',@ObjectTypePropertyId,@UserId

SELECT ProjectTypeProperties.ProjectTypePropertyID ObjectTypePropertyID
	, ProjectTypeProperties.ProjectTypeID  ObjectTypeID
	, ISNULL(UserProjectTypeLanguage.Name,ISNULL(DefaultProjectTypeLanguage.Name,'No name for this Project type')) ObjectTypeName
	, ProjectTypeProperties.PropertyID
	, ProjectTypeProperties.ObjectTypePropertyStatusId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProjectTypeProperties.ModifiedDate
FROM ProjectTypeProperties 
JOIN ProjectTypes 
	ON ProjectTypeProperties.ProjectTypeID = ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserProjectTypeLanguage
	ON UserProjectTypeLanguage.ProjectTypeID= ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectTypeLanguage
	ON DefaultProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID

JOIN Persons Creator
	ON Creator.UserId = ProjectTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectTypeProperties.ModifierID
WHERE ProjectTypeProperties.ProjectTypePropertyId = @ObjectTypePropertyId

COMMIT TRANSACTION


