CREATE PROCEDURE [dbo].[usp_UserMenuTemplateOptionCreateGetSequence] (@UserId nvarchar(450), @ClassificationId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserMenuTemplateOptions.Sequence
	, ISNULL(UserUserMenuTemplateOptionLanguage.Name,ISNULL(DefaultUserMenuTemplateOptionLanguage.Name,'No name for this level')) Name
FROM UserMenuTemplateOptions 
LEFT JOIN (SELECT UserMenuTemplateOptionId, Name, Description, MenuName, MouseOver FROM UserMenuTemplateOptionLanguages WHERE LanguageId = @LanguageID) UserUserMenuTemplateOptionLanguage
	ON UserUserMenuTemplateOptionLanguage.UserMenuTemplateOptionId = UserMenuTemplateOptions.UserMenuTemplateOptionID
LEFT JOIN (SELECT UserMenuTemplateOptionId, Name, Description, MenuName, MouseOver FROM UserMenuTemplateOptionLanguages JOIN Settings ON UserMenuTemplateOptionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultUserMenuTemplateOptionLanguage
	ON DefaultUserMenuTemplateOptionLanguage.UserMenuTemplateOptionId = UserMenuTemplateOptions.UserMenuTemplateOptionID
WHERE UserMenuTemplateOptions.UserMenuTemplateID = @ClassificationId
ORDER BY  ISNULL(UserUserMenuTemplateOptionLanguage.Name,ISNULL(DefaultUserMenuTemplateOptionLanguage.Name,'No name for this level'))

