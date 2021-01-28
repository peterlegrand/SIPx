CREATE PROCEDURE usp_ProjectTypeMatrixUpdateGet (@UserId nvarchar(450), @ProjectTypeMatrixId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProjectTypeMatrixes.ProjectTypeMatrixID
	, ISNULL(UserProjectTypeLanguage.Name,ISNULL(DefaultProjectTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProjectTypeLanguage.Description,ISNULL(DefaultProjectTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProjectTypeLanguage.MenuName,ISNULL(DefaultProjectTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProjectTypeLanguage.MouseOver,ISNULL(DefaultProjectTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserToLanguage.Name,ISNULL(DefaultToLanguage.Name,'No name for this TO project type')) ToProjectTypeName
	, ISNULL(UserFromLanguage.Name,ISNULL(DefaultFromLanguage.Name,'No name for this TO project type')) FromProjectTypeName
	, ProjectTypeMatrixes.FromProjectTypeId
	, ProjectTypeMatrixes.ToProjectTypeId
	, ProjectTypeMatrixes.ProjectMatrixTypeId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypeMatrixes.CreatedDate
FROM ProjectTypeMatrixes 
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserProjectTypeLanguage
	ON UserProjectTypeLanguage.ProjectTypeId = ProjectTypeMatrixes.ProjectTypeMatrixID
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectTypeLanguage
	ON DefaultProjectTypeLanguage.ProjectTypeId = ProjectTypeMatrixes.ProjectTypeMatrixID

LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserFromLanguage
	ON UserFromLanguage.ProjectTypeID= ProjectTypeMatrixes.FromProjectTypeId
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultFromLanguage
	ON DefaultFromLanguage.ProjectTypeId = ProjectTypeMatrixes.FromProjectTypeId

LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserToLanguage
	ON UserToLanguage.ProjectTypeID= ProjectTypeMatrixes.ToProjectTypeId
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultToLanguage
	ON DefaultToLanguage.ProjectTypeId = ProjectTypeMatrixes.ToProjectTypeId


JOIN Persons Creator
	ON Creator.UserId = ProjectTypeMatrixes.CreatorID
WHERE ProjectTypeMatrixes.ProjectTypeMatrixId = @ProjectTypeMatrixID
