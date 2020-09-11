CREATE PROCEDURE usp_PageDeleteGet (@UserID nvarchar(450), @PageId int)
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
	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this organization')) OrganizationName
	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this Project')) ProjectName
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this Classification')) ClassificationName
	, ISNULL(UserPersonLanguage.Name,'No name for this person') PersonName
	, Pages.ShowTitleName
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
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationId = Pages.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Pages.OrganizationID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectId = Pages.ProjectID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Pages.ProjectID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Pages.ClassificationID
LEFT JOIN (SELECT UserId, FirstName + ' ' + LastName Name FROM Persons ) UserPersonLanguage
	ON UserPersonLanguage.UserId = Pages.UserID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Pages.ClassificationID
JOIN Persons Creator
	ON Creator.UserId = Pages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Pages.ModifierID
WHERE Pages.PageID = @PageId