CREATE PROCEDURE usp_UserPageDeleteGet (@UserID nvarchar(450), @PageId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE UserId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Pages.PageId
	, ISNULL(UserPageLanguage.Name,ISNULL(DefaultPageLanguage.Name,'No name for this role')) Name
	, ISNULL(UserPageLanguage.Description,ISNULL(DefaultPageLanguage.Description,'No description for this role')) Description
	, ISNULL(UserPageLanguage.MenuName,ISNULL(DefaultPageLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserPageLanguage.MouseOver,ISNULL(DefaultPageLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserPageLanguage.TitleName,ISNULL(DefaultPageLanguage.TitleName,'No title name for this role')) TitleName
	, ISNULL(UserPageLanguage.TitleDescription,ISNULL(DefaultPageLanguage.TitleDescription,'No title description for this role')) TitleDescription

	,Pages.ShowTitleName
	, Pages.ShowTitleDescription
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Pages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Pages.ModifiedDate
FROM Pages

LEFT JOIN (SELECT PageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageLanguages WHERE LanguageId = @LanguageID) UserPageLanguage
	ON UserPageLanguage.PageId = Pages.PageID
LEFT JOIN (SELECT PageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageLanguages JOIN Settings ON PageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageLanguage
	ON DefaultPageLanguage.PageId = Pages.PageID
JOIN Persons Creator
	ON Creator.UserId = Pages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Pages.ModifierID
	WHERE @UserID = Pages.UserID AND Pages.PageID = @PageId