CREATE PROCEDURE usp_ProjectTypeMatrixIndexGet (@UserId nvarchar(450), @ProjectTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProjectTypeMatrixes.ProjectTypeMatrixID
	, ISNULL(UserLanguage.ProjectTypeMatrixLanguageID,ISNULL(DefaultLanguage.ProjectTypeMatrixLanguageID,0)) ProjectTypeLanguageID
	, @LanguageId LanguageId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this project type matrix')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this project type matrix')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this project type matrix')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this project type matrix')) MouseOver

	, ISNULL(UserTypeLanguage.Name,ISNULL(DefaultTypeLanguage.Name,'No name for this Project matrix type')) ProjectMatrixTypeName
	, 'To' Direction

	, ISNULL(UserToLanguage.Name,ISNULL(DefaultToLanguage.Name,'No name for this TO project type')) ToProjectTypeName

	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypeMatrixes.CreatedDate

FROM ProjectTypeMatrixes 
LEFT JOIN (SELECT ProjectTypeMatrixId, Name, Description, MenuName, MouseOver, ProjectTypeMatrixLanguageID FROM ProjectTypeMatrixLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectTypeMatrixID= ProjectTypeMatrixes.ProjectTypeMatrixID
LEFT JOIN (SELECT ProjectTypeMatrixId, Name, Description, MenuName, MouseOver, ProjectTypeMatrixLanguageID FROM ProjectTypeMatrixLanguages JOIN Settings ON ProjectTypeMatrixLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectTypeMatrixId = ProjectTypeMatrixes.ProjectTypeMatrixID

LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserToLanguage
	ON UserToLanguage.ProjectTypeID= ProjectTypeMatrixes.ToProjectTypeId
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultToLanguage
	ON DefaultToLanguage.ProjectTypeId = ProjectTypeMatrixes.ToProjectTypeId

JOIN Persons Creator
	ON Creator.UserId = ProjectTypeMatrixes.CreatorID
JOIN ProjectMatrixTypes
	ON ProjectMatrixTypes.ProjectMatrixTypeId = ProjectTypeMatrixes.ProjectMatrixTypeId
LEFT JOIN (SELECT ProjectMatrixTypeId, Name FROM ProjectMatrixTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage
	ON UserTypeLanguage.ProjectMatrixTypeID= ProjectTypeMatrixes.ProjectMatrixTypeID
LEFT JOIN (SELECT ProjectMatrixTypeId, Name FROM ProjectMatrixTypeLanguages JOIN Settings ON ProjectMatrixTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage
	ON DefaultTypeLanguage.ProjectMatrixTypeId = ProjectTypeMatrixes.ProjectMatrixTypeID
WHERE ProjectTypeMatrixes.FromProjectTypeId = @ProjectTypeId

UNION ALL

SELECT ProjectTypeMatrixes.ProjectTypeMatrixID
	, ISNULL(UserLanguage.ProjectTypeMatrixLanguageID,ISNULL(DefaultLanguage.ProjectTypeMatrixLanguageID,0)) ProjectTypeLanguageID
	, @LanguageId LanguageId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this project type matrix')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this project type matrix')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this project type matrix')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this project type matrix')) MouseOver

	, ISNULL(UserTypeLanguage.Name,ISNULL(DefaultTypeLanguage.Name,'No name for this Project matrix type')) ProjectMatrixTypeName
	, 'From' Direction
	, ISNULL(UserFromLanguage.Name,ISNULL(DefaultFromLanguage.Name,'No name for this TO project type')) FromProjectTypeName

	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectTypeMatrixes.CreatedDate

FROM ProjectTypeMatrixes 
LEFT JOIN (SELECT ProjectTypeMatrixId, Name, Description, MenuName, MouseOver, ProjectTypeMatrixLanguageID FROM ProjectTypeMatrixLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectTypeMatrixID= ProjectTypeMatrixes.ProjectTypeMatrixID
LEFT JOIN (SELECT ProjectTypeMatrixId, Name, Description, MenuName, MouseOver, ProjectTypeMatrixLanguageID FROM ProjectTypeMatrixLanguages JOIN Settings ON ProjectTypeMatrixLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectTypeMatrixId = ProjectTypeMatrixes.ProjectTypeMatrixID

LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserFromLanguage
	ON UserFromLanguage.ProjectTypeID= ProjectTypeMatrixes.FromProjectTypeId
LEFT JOIN (SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultFromLanguage
	ON DefaultFromLanguage.ProjectTypeId = ProjectTypeMatrixes.FromProjectTypeId

JOIN Persons Creator
	ON Creator.UserId = ProjectTypeMatrixes.CreatorID
JOIN ProjectMatrixTypes
	ON ProjectMatrixTypes.ProjectMatrixTypeId = ProjectTypeMatrixes.ProjectMatrixTypeId
LEFT JOIN (SELECT ProjectMatrixTypeId, Name FROM ProjectMatrixTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage
	ON UserTypeLanguage.ProjectMatrixTypeID= ProjectTypeMatrixes.ProjectMatrixTypeID
LEFT JOIN (SELECT ProjectMatrixTypeId, Name FROM ProjectMatrixTypeLanguages JOIN Settings ON ProjectMatrixTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage
	ON DefaultTypeLanguage.ProjectMatrixTypeId = ProjectTypeMatrixes.ProjectMatrixTypeID
WHERE ProjectTypeMatrixes.ToProjectTypeId = @ProjectTypeId
	AND ProjectTypeMatrixes.FromProjectTypeId <> @ProjectTypeId


