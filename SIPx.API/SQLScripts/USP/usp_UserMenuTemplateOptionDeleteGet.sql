CREATE PROCEDURE [dbo].[usp_UserMenuTemplateOptionDeleteGet] (@UserId nvarchar(450), @UserMenuTemplateOptionID int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserMenuTemplateOptions.UserMenuTemplateOptionID
	, ISNULL(UserLanguage.UserMenuTemplateOptionLanguageID,ISNULL(DefaultLanguage.UserMenuTemplateOptionLanguageID,0)) UserMenuTemplateOptionLanguageID
	, @LanguageId LanguageId
	, LanguageTerm.Name LanguageName
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this user menu template option')) Name
	, ISNULL(UserLanguage.Description,ISNULL(DefaultLanguage.Description,'No description for this user menu template option')) Description
	, ISNULL(UserLanguage.MenuName,ISNULL(DefaultLanguage.MenuName,'No menu name for this user menu template option')) MenuName
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this user menu template option')) MouseOver
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
JOIN UserMenuTypes TypesLeft
	ON UserMenuTemplateOptions.UserMenuTypeIDLeft = TypesLeft.UserMenuTypeID
JOIN UITermLanguages LeftTypeDefaultName
	ON LeftTypeDefaultName.UITermId = TypesLeft.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) LeftTypeCustomName
	ON LeftTypeCustomName.UITermId = TypesLeft.NameTermID

JOIN UserMenuTypes TypesRight
	ON UserMenuTemplateOptions.UserMenuTypeIDRight = TypesRight.UserMenuTypeID
JOIN UITermLanguages RightTypeDefaultName
	ON RightTypeDefaultName.UITermId = TypesRight.NameTermID
Right JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) RightTypeCustomName
	ON RightTypeCustomName.UITermId = TypesRight.NameTermID


JOIN Persons Creator
	ON Creator.UserId = UserMenuTemplateOptions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = UserMenuTemplateOptions.ModifierID
JOIN Languages
	ON Languages.LanguageID = @LanguageId
JOIN UITermLanguages LanguageTerm
	ON Languages.NameTermID = LanguageTerm.UITermID
WHERE LanguageTerm.LanguageID = @LanguageId AND UserMenuTemplateOptions.UserMenuTemplateOptionId = @UserMenuTemplateOptionID


