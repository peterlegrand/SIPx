CREATE PROCEDURE [dbo].[usp_UserMenuIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT UserMenus.UserMenuID
	, UserMenus.Name
	, UserMenus.Icon
	, UserMenus.UserPageIdLeft
	, ISNULL(leftPage.Name, 'No name for left page') LeftPageName
	, ISNULL(RightPage.Name, 'No name for right page') RightPageName
	, UserMenus.UserPageIdRight
	, UserMenus.Sequence
	, UserMenus.CreatorID
	, UserMenus.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, UserMenus.ModifierID
	, UserMenus.ModifiedDate
FROM UserMenus 
JOIN PageLanguages leftPage
	 ON leftPage.PageID = UserMenus.UserPageIdLeft
JOIN PageLanguages RightPage
	 ON RightPage.PageID = UserMenus.UserPageIdRight
JOIN Persons Creator
	ON Creator.UserId = UserMenus.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = UserMenus.ModifierID
WHERE UserMenus.UserId= @UserId
	AND leftPage.LanguageID = @LanguageId
	AND RightPage.LanguageID = @LanguageId
ORDER BY  Sequence