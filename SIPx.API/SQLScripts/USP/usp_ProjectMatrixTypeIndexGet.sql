CREATE PROCEDURE usp_ProjectMatrixTypeIndexGet (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ProjectMatrixType' AND Action = 'Index';
SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ReadLogProjectMatrixTypeList (UserId, ChangeLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT ProjectMatrixTypes.ProjectMatrixTypeID
	, ISNULL(UserLanguage.ProjectMatrixTypeLanguageID,ISNULL(DefaultLanguage.ProjectMatrixTypeLanguageID,0)) ProjectMatrixTypeLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ProjectMatrixType')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this ProjectMatrixType')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this ProjectMatrixType')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this ProjectMatrixType')) MouseOver
	, ISNULL(UINameCustom.Customization ,UIName.Name) StatusName
	, CASE WHEN ProjectMatrixTypes.DefaultPageId IS NULL THEN ISNULL(UserProjectMatrixTypePageLanguage.Name,ISNULL(DefaultProjectMatrixTypePageLanguage.Name,'No name for the default page')) ELSE 'There is no default page' END DefaultPageName
	, ProjectMatrixTypes.DefaultPageID
	, ProjectMatrixTypes.HasDropDown 
	, ProjectMatrixTypes.DropDownSequence
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectMatrixTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProjectMatrixTypes.ModifiedDate
FROM ProjectMatrixTypes 
JOIN Statuses 
	ON Statuses.StatusId = ProjectMatrixTypes.StatusID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver, ProjectMatrixTypeLanguageID FROM ProjectMatrixTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectMatrixTypeID= ProjectMatrixTypes.ProjectMatrixTypeID
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver, ProjectMatrixTypeLanguageID FROM ProjectMatrixTypeLanguages JOIN Settings ON ProjectMatrixTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectMatrixTypeId = ProjectMatrixTypes.ProjectMatrixTypeID
LEFT JOIN (SELECT ProjectMatrixTypePageId, Name FROM ProjectMatrixTypePageLanguages WHERE LanguageId = @LanguageID) UserProjectMatrixTypePageLanguage
	ON UserProjectMatrixTypePageLanguage.ProjectMatrixTypePageId = ProjectMatrixTypes.DefaultPageID
LEFT JOIN (SELECT ProjectMatrixTypePageId, Name FROM ProjectMatrixTypePageLanguages  JOIN Settings ON ProjectMatrixTypePageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectMatrixTypePageLanguage
	ON DefaultProjectMatrixTypePageLanguage.ProjectMatrixTypePageId = ProjectMatrixTypes.DefaultPageID
JOIN Persons Creator
	ON Creator.UserId = ProjectMatrixTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProjectMatrixTypes.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE UIName.LanguageId = @LanguageID
	AND LanguageTerm.LanguageID = @LanguageId
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this ProjectMatrixType')) 



	COMMIT TRANSACTION