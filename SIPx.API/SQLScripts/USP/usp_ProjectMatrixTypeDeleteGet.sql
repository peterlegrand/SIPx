CREATE PROCEDURE usp_ProjectMatrixTypeDeleteGet (@UserId nvarchar(450),@ProjectMatrixTypeId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProjectMatrixTypes.ProjectMatrixTypeID
	, ISNULL(UserProjectMatrixTypeLanguage.Name,ISNULL(DefaultProjectMatrixTypeLanguage.Name,'No name for this ProjectMatrixType')) Name
	, ISNULL(UserProjectMatrixTypeLanguage.Description,ISNULL(DefaultProjectMatrixTypeLanguage.Description,'No description for this ProjectMatrixType')) Description
	, ISNULL(UserProjectMatrixTypeLanguage.MenuName,ISNULL(DefaultProjectMatrixTypeLanguage.MenuName,'No menu name for this ProjectMatrixType')) MenuName
	, ISNULL(UserProjectMatrixTypeLanguage.MouseOver,ISNULL(DefaultProjectMatrixTypeLanguage.MouseOver,'No drop Mouse over for this ProjectMatrixType')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectMatrixTypes.CreatedDate
FROM ProjectMatrixTypes
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver FROM ProjectMatrixTypeLanguages WHERE LanguageId = @LanguageID) UserProjectMatrixTypeLanguage
	ON UserProjectMatrixTypeLanguage.ProjectMatrixTypeId = ProjectMatrixTypes.ProjectMatrixTypeID
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver FROM ProjectMatrixTypeLanguages JOIN Settings ON ProjectMatrixTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectMatrixTypeLanguage
	ON DefaultProjectMatrixTypeLanguage.ProjectMatrixTypeId = ProjectMatrixTypes.ProjectMatrixTypeID
JOIN Persons Creator
	ON Creator.UserId = ProjectMatrixTypes.CreatorID
WHERE  ProjectMatrixTypes.ProjectMatrixTypeId = @ProjectMatrixTypeID
