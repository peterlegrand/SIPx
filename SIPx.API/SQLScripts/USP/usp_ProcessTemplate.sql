CREATE PROCEDURE [dbo].[usp_ProcessTemplate] (@UserID nvarchar(450), @ProcessTemplateID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ProcessTemplates.ProcessTemplateID
	, ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this ')) Name
	, ISNULL(UserProcessTemplateLanguage.Description,ISNULL(DefaultProcessTemplateLanguage.Description,'No description for this ')) Description
	, ISNULL(UserProcessTemplateLanguage.MenuName,ISNULL(DefaultProcessTemplateLanguage.MenuName,'No menu name for this ')) MenuName
	, ISNULL(UserProcessTemplateLanguage.MouseOver,ISNULL(DefaultProcessTemplateLanguage.MouseOver,'No mouse over for this ')) MouseOver
	, ISNULL(UserProcessTemplateGroupLanguage.Name,ISNULL(DefaultProcessTemplateGroupLanguage.Name,'No name for this  type')) GroupName
	, ProcessTemplates.ShowInPersonalCalendar
	, ProcessTemplates.ShowInEventCalendar
	, ProcessTemplates.ProcessMultiMax
	, ProcessTemplates.Sequence
	, ProcessTemplates.IsPersonal
	, ProcessTemplates.ShowInNew
	, ProcessTemplates.ShowInSearch
	, ProcessTemplates.ShowInReports
	, ProcessTemplates.HideEverywhere
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplates.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplates.ModifiedDate
FROM ProcessTemplates 
JOIN ProcessTemplateGroups
	ON ProcessTemplates.ProcessTemplateGroupID =  ProcessTemplateGroups.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateID, Name, Description, MenuName, MouseOver FROM ProcessTemplateLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateID = ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateID, Name, Description, MenuName, MouseOver FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateLanguage
	ON DefaultProcessTemplateLanguage.ProcessTemplateID = ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateGroupID, Name FROM ProcessTemplateGroupLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateGroupLanguage
	ON UserProcessTemplateGroupLanguage.ProcessTemplateGroupID = ProcessTemplates.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateGroupID, Name  FROM ProcessTemplateGroupLanguages JOIN Settings ON ProcessTemplateGroupLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateGroupLanguage
	ON DefaultProcessTemplateGroupLanguage.ProcessTemplateGroupID = ProcessTemplates.ProcessTemplateGroupID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplates.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplates.ModifierID
WHERE ProcessTemplates.ProcessTemplateID = @ProcessTemplateID
