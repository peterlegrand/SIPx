CREATE PROCEDURE usp_UserMenuDeleteGet (@UserID nvarchar(450), @UserMenuId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE UserId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserMenus.UserMenuId
	, ISNULL(UserLeftType.Customization,ISNULL(DefaultLeftType.Name,'No name ')) LeftTypeName
	, ISNULL(UserRightType.Customization,ISNULL(DefaultRightType.Name,'No name ')) RightTypeName
	, ISNULL(UserLeftPage.Name,ISNULL(DefaultLeftPage.Name,'No left page name')) LeftPageName
	, ISNULL(UserRightPage.Name,ISNULL(DefaultRightPage.Name,'No right page name')) RightPageName
	, ISNULL(UserIcon.Customization,ISNULL(DefaultIcon.Name,'No icon name')) IconName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, UserMenus.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, UserMenus.ModifiedDate
FROM UserMenus

JOIN UserMenuTypes LeftType
	ON LeftType.UserMenuTypeID = UserMenus.UserMenuTypeIDLeft
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UserLeftType
	ON UserLeftType.UITermId = LeftType.NameTermID
JOIN UITermLanguages DefaultLeftType
	ON DefaultLeftType.UITermId = LeftType.NameTermID

JOIN UserMenuTypes RightType
	ON RightType.UserMenuTypeID = UserMenus.UserMenuTypeIDRight
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UserRightType
	ON UserRightType.UITermId = RightType.NameTermID
JOIN UITermLanguages DefaultRightType
	ON DefaultRightType.UITermId = LeftType.NameTermID

JOIN Icons 
	ON ICons.IconID = UserMenus.IconID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UserIcon
	ON UserIcon.UITermId = Icons.NameTermID
JOIN UITermLanguages DefaultIcon
	ON DefaultIcon.UITermId = Icons.NameTermID


JOIN Pages LeftPage
	ON LeftPage.PageID = UserMenus.UserPageIdLeft
LEFT JOIN (SELECT PageId, Name FROM PageLanguages WHERE LanguageId = @LanguageID) UserLeftPage
	ON UserLeftPage.PageID= LeftPage.PageID
LEFT JOIN (SELECT PageId, Name FROM PageLanguages JOIN Settings ON PageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLeftPage
	ON DefaultLeftPage.PageId = LeftPage.PageID
JOIN Pages RightPage
	ON RightPage.PageID = UserMenus.UserPageIdRight
LEFT JOIN (SELECT PageId, Name FROM PageLanguages WHERE LanguageId = @LanguageID) UserRightPage
	ON UserRightPage.PageID= RightPage.PageID
LEFT JOIN (SELECT PageId, Name FROM PageLanguages JOIN Settings ON PageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultRightPage
	ON DefaultRightPage.PageId = RightPage.PageID
JOIN Persons Creator
	ON Creator.UserId = UserMenus.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = UserMenus.ModifierID

WHERE DefaultLeftType.LanguageId = @LanguageID
	AND DefaultRightType.LanguageId = @LanguageID
	AND UserMenuId = @UserMenuId
	AND DefaultIcon.LanguageID = @LanguageId