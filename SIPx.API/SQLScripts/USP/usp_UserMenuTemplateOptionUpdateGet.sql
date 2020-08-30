CREATE PROCEDURE [dbo].[usp_UserMenuTemplateOptionUpdateGet] (@UserId nvarchar(450), @UserMenuTemplateOptionID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserMenuTemplateOptions.UserMenuTemplateOptionID
	, UserMenuTemplateOptions.UserMenuTemplateId
	, ISNULL(UserLanguage.UserMenuTemplateOptionLanguageID,ISNULL(DefaultLanguage.UserMenuTemplateOptionLanguageID,0)) UserMenuTemplateOptionLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'')) MouseOver
	, UserMenuTemplateOptions.IconID
	, UserMenuTemplateOptions.Sequence
	, UserMenuTemplateOptions.UserMenuTypeIDLeft
	, UserMenuTemplateOptions.UserMenuTypeIDRight
	, UserMenuTemplateOptions.UserPageIdLeft
	, UserMenuTemplateOptions.UserPageIdRight
	, UserMenuTemplateOptions.UserPageIdLeft
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, UserMenuTemplateOptions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, UserMenuTemplateOptions.ModifiedDate
FROM UserMenuTemplateOptions 
LEFT JOIN (SELECT UserMenuTemplateOptionId, Name, Description, MenuName, MouseOver, UserMenuTemplateOptionLanguageID FROM UserMenuTemplateOptionLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.UserMenuTemplateOptionID= UserMenuTemplateOptions.UserMenuTemplateOptionID
LEFT JOIN (SELECT UserMenuTemplateOptionId, Name, Description, MenuName, MouseOver, UserMenuTemplateOptionLanguageID FROM UserMenuTemplateOptionLanguages JOIN Settings ON UserMenuTemplateOptionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.UserMenuTemplateOptionId = UserMenuTemplateOptions.UserMenuTemplateOptionID
JOIN Persons Creator
	ON Creator.UserId = UserMenuTemplateOptions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = UserMenuTemplateOptions.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE LanguageTerm.LanguageID = @LanguageId AND UserMenuTemplateOptions.UserMenuTemplateOptionId = @UserMenuTemplateOptionID
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this user menu template option')) 


