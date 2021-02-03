CREATE PROCEDURE usp_ProjectReturnName (@UserId nvarchar(450), @ProjectId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
IF @ProjectId = 0
BEGIN
SELECT ISNULL(UINameCustom.Customization ,UIName.Name) ProjectName
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
SELECT  ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this role')) ProjectName
FROM Projects 
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectId = Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Projects.ProjectID
WHERE Projects.ProjectId = @ProjectID
END