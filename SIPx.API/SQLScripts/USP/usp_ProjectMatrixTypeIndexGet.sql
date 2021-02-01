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

INSERT INTO ReadLogProjectMatrixTypeList (UserId, ReadLogDate, MVCUIScreenID)  VALUES( @UserId, Getdate(), @ScreenId)

SELECT ProjectMatrixTypes.ProjectMatrixTypeID
	, ISNULL(UserLanguage.ProjectMatrixTypeLanguageID,ISNULL(DefaultLanguage.ProjectMatrixTypeLanguageID,0)) ProjectMatrixTypeLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this project matrix type')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this project matrix type')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this project matrix type')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this project matrix type')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProjectMatrixTypes.CreatedDate
FROM ProjectMatrixTypes 
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver, ProjectMatrixTypeLanguageID FROM ProjectMatrixTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectMatrixTypeID= ProjectMatrixTypes.ProjectMatrixTypeID
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver, ProjectMatrixTypeLanguageID FROM ProjectMatrixTypeLanguages JOIN Settings ON ProjectMatrixTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectMatrixTypeId = ProjectMatrixTypes.ProjectMatrixTypeID
JOIN Persons Creator
	ON Creator.UserId = ProjectMatrixTypes.CreatorID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE LanguageTerm.LanguageID = @LanguageId
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this project matrix type')) 



	COMMIT TRANSACTION