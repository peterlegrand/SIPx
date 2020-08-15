CREATE PROCEDURE [dbo].[usp_UserPageIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Pages.PageID
	, ISNULL(UserPageLanguage.Name,ISNULL(DefaultPageLanguage.Name,'No name for this role')) Name
	, ISNULL(UserPageLanguage.Description,ISNULL(DefaultPageLanguage.Description,'No description for this role')) Description
	, ISNULL(UserPageLanguage.MenuName,ISNULL(DefaultPageLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserPageLanguage.MouseOver,ISNULL(DefaultPageLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UserPageLanguage.TitleName,ISNULL(DefaultPageLanguage.TitleName,'No title name for this role')) TitleName
	, ISNULL(UserPageLanguage.TitleDescription,ISNULL(DefaultPageLanguage.TitleDescription,'No title description for this role')) TitleDescription
	, ISNULL(UIStatusNameCustom.Customization,UIStatusName.Name) StatusName
	, Pages.ShowTitleName
	, Pages.ShowTitleDescription
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Pages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Pages.ModifiedDate
FROM Pages 
LEFT JOIN (SELECT PageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageLanguages WHERE LanguageId = @LanguageID) UserPageLanguage
	ON UserPageLanguage.PageId = Pages.PageID
LEFT JOIN (SELECT PageId, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageLanguages JOIN Settings ON PageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageLanguage
	ON DefaultPageLanguage.PageId = Pages.PageID
JOIN Statuses 
	ON Statuses.StatusId = Pages.StatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermId = Statuses.NameTermID
JOIN Persons Creator
	ON Creator.UserId = Pages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Pages.ModifierID
WHERE UIStatusName.LanguageId = @LanguageID
	AND Pages.UserID = @UserId
ORDER BY ISNULL(UserPageLanguage.Name,ISNULL(DefaultPageLanguage.Name,'No name for this role')) 


