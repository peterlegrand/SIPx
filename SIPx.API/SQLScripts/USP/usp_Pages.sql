CREATE PROCEDURE [dbo].[usp_Pages] (@UserID nvarchar(450)) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
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
LEFT JOIN (SELECT PageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageLanguages WHERE LanguageID = @LanguageID) UserPageLanguage
	ON UserPageLanguage.PageID = Pages.PageID
LEFT JOIN (SELECT PageID, Name, Description, MenuName, MouseOver, TitleName, TitleDescription FROM PageLanguages JOIN Settings ON PageLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultPageLanguage
	ON DefaultPageLanguage.PageID = Pages.PageID
JOIN Statuses 
	ON Statuses.StatusID = Pages.StatusID
JOIN UITermLanguages UIStatusName
	ON UIStatusName.UITermID = Statuses.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UIStatusNameCustom
	ON UIStatusNameCustom.UITermID = Statuses.NameTermID
JOIN Persons Creator
	ON Creator.UserID = Pages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = Pages.ModifierID
WHERE UIStatusName.LanguageID = @LanguageID
ORDER BY ISNULL(UserPageLanguage.Name,ISNULL(DefaultPageLanguage.Name,'No name for this role')) 


