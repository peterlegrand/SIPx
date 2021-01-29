CREATE PROCEDURE usp_ProjectMatrixTypeList (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProjectMatrixTypes.ProjectMatrixTypeID
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this project matrix type')) Name
FROM ProjectMatrixTypes 
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver FROM ProjectMatrixTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProjectMatrixTypeID= ProjectMatrixTypes.ProjectMatrixTypeID
LEFT JOIN (SELECT ProjectMatrixTypeId, Name, Description, MenuName, MouseOver FROM ProjectMatrixTypeLanguages JOIN Settings ON ProjectMatrixTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProjectMatrixTypeId = ProjectMatrixTypes.ProjectMatrixTypeID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this project matrix type')) 
