CREATE PROCEDURE usp_ProjectTypeReturnName (@UserId nvarchar(450), @ProjectTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
IF @ProjectTypeId = 0
BEGIN
SELECT ISNULL(UINameCustom.Customization ,UIName.Name) ProjectTypeName
FROM UITerms 
JOIN UITermLanguages UIName
	ON UIName.UITermId = UITerms.UITermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = UITerms.UITermID
WHERE UIName.LanguageId = @LanguageID
	AND UITerms.InternalName = 'No parent'
END
ELSE
BEGIN
SELECT  ISNULL(UserProjectTypeLanguage.Name,ISNULL(DefaultProjectTypeLanguage.Name,'No name for this role')) ProjectTypeName
FROM ProjectTypes 
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserProjectTypeLanguage
	ON UserProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
LEFT JOIN (SELECT ProjectTypeId, Name, Description, MenuName, MouseOver FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectTypeLanguage
	ON DefaultProjectTypeLanguage.ProjectTypeId = ProjectTypes.ProjectTypeID
WHERE ProjectTypes.ProjectTypeId = @ProjectTypeID
END