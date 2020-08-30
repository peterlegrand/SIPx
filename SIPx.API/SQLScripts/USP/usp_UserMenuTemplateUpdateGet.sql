CREATE PROCEDURE [dbo].[usp_UserMenuTemplateUpdateGet] (@UserId nvarchar(450), @UserMenuTemplateID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserMenuTemplates.UserMenuTemplateID
	, ISNULL(UserLanguage.UserMenuTemplateLanguageID,ISNULL(DefaultLanguage.UserMenuTemplateLanguageID,0)) UserMenuTemplateLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this UserMenuTemplate')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this UserMenuTemplate')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this UserMenuTemplate')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this UserMenuTemplate')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, UserMenuTemplates.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, UserMenuTemplates.ModifiedDate
FROM UserMenuTemplates 
LEFT JOIN (SELECT UserMenuTemplateId, Name, Description, MenuName, MouseOver, UserMenuTemplateLanguageID FROM UserMenuTemplateLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.UserMenuTemplateID= UserMenuTemplates.UserMenuTemplateID
LEFT JOIN (SELECT UserMenuTemplateId, Name, Description, MenuName, MouseOver, UserMenuTemplateLanguageID FROM UserMenuTemplateLanguages JOIN Settings ON UserMenuTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.UserMenuTemplateId = UserMenuTemplates.UserMenuTemplateID
JOIN Persons Creator
	ON Creator.UserId = UserMenuTemplates.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = UserMenuTemplates.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE LanguageTerm.LanguageID = @LanguageId
	AND UserMenuTemplates.UserMenuTemplateId = @UserMenuTemplateID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this UserMenuTemplate')) 


