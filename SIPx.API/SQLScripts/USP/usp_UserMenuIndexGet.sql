CREATE PROCEDURE [dbo].[usp_UserMenuIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserMenus.UserMenuID
	, UserMenus.Name
		, ISNULL(UIDefaultIconName.Customization,UIIconName.Name) IconName
, UserMenus.UserPageIdLeft
	, ISNULL(leftPage.Name, 'No name for left page') LeftPageName
	, ISNULL(RightPage.Name, 'No name for right page') RightPageName
	, ISNULL( LeftUserLanguageName.Customization, LeftLanguageName.Name) LeftMenuTypeName
	, ISNULL( RightUserLanguageName.Customization, RightLanguageName.Name) RightMenuTypeName
	, UserMenus.UserPageIdRight
	, UserMenus.Sequence
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, UserMenus.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierId
	, UserMenus.ModifiedDate
FROM UserMenus 
JOIN Icons
	ON Icons.IconId = UserMenus.iconid
JOIN UITermLanguages UIIconName
	ON UIIconName.UITermId = Icons.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIDefaultIconName
	ON UIDefaultIconName.UITermId = Icons.NameTermID

JOIN PageLanguages leftPage
	 ON leftPage.PageID = UserMenus.UserPageIdLeft
JOIN PageLanguages RightPage
	 ON RightPage.PageID = UserMenus.UserPageIdRight
JOIN UserMenuTypes LeftMenuType
	ON LeftMenuType.UserMenuTypeID = UserMenus .UserMenuTypeIDLeft
JOIN UITermLanguages LeftLanguageName
	ON LeftMenuType.NameTermId = LeftLanguageName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  LeftUserLanguageName
	ON LeftMenuType.NameTermId = LeftUserLanguageName.UITermId  
JOIN UserMenuTypes RightMenuType
	ON RightMenuType.UserMenuTypeID = UserMenus .UserMenuTypeIDRight
JOIN UITermLanguages RightLanguageName
	ON RightMenuType.NameTermId = RightLanguageName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  RightUserLanguageName
	ON RightMenuType.NameTermId = RightUserLanguageName.UITermId  
JOIN Persons Creator
	ON Creator.UserId = UserMenus.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = UserMenus.ModifierID
WHERE UserMenus.UserId= @UserId
	AND leftPage.LanguageID = @LanguageId
	AND RightPage.LanguageID = @LanguageId
	AND LeftLanguageName.LanguageID = @LanguageId
	AND RightLanguageName.LanguageID = @LanguageId
	AND UIIconName.LanguageId = @LanguageID
ORDER BY  Sequence