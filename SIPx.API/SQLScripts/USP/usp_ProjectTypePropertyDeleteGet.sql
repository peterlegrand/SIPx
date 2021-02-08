CREATE PROCEDURE usp_ProjectTypePropertyDeleteGet (@UserId nvarchar(450),@ProjectTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'ProjectTypeProperty', 'Delete',1,'',@ProjectTypePropertyId,@UserId

SELECT ProjectTypeProperties.ProjectTypePropertyID
	, ProjectTypeProperties.ProjectTypeID 
	, ISNULL(UserProjectTypeLanguage.Name,ISNULL(DefaultProjectTypeLanguage.Name,'No name for this project type')) ProjectTypeName
	, ProjectTypeProperties.PropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, ProjectTypeProperties.ObjectTypePropertyStatusId
	, ISNULL(CustomStatus.Customization,DefaultStatus.Name) StatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProjectTypeProperties.ModifiedDate
FROM ProjectTypeProperties 
JOIN ProjectTypes 
	ON ProjectTypeProperties.PropertyID = ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserProjectTypeLanguage
	ON UserProjectTypeLanguage.ProjectTypeID= ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectTypeLanguage
	ON DefaultProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID

JOIN Properties 
	ON ProjectTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID


JOIN ObjectTypePropertyStatuses 
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusId = ProjectTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages DefaultStatus
	ON DefaultStatus.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomStatus
	ON CustomStatus.UITermId = ObjectTypePropertyStatuses.NameTermID


JOIN Persons Creator
	ON Creator.UserId = ProjectTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectTypeProperties.ModifierID
WHERE ProjectTypeProperties.ProjectTypePropertyId = @ProjectTypePropertyID
AND DefaultStatus.LanguageId = @LanguageID
COMMIT TRANSACTION


