CREATE PROCEDURE [dbo].[usp_ProcessTemplateUpdateGet] (@UserId nvarchar(450), @ProcessTemplateId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
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
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTemplates.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTemplates.ModifiedDate
FROM ProcessTemplates 
JOIN ProcessTemplateGroups
	ON ProcessTemplates.ProcessTemplateGroupId =  ProcessTemplateGroups.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateLanguage
	ON UserProcessTemplateLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateLanguage
	ON DefaultProcessTemplateLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateGroupId, Name FROM ProcessTemplateGroupLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateGroupLanguage
	ON UserProcessTemplateGroupLanguage.ProcessTemplateGroupId = ProcessTemplates.ProcessTemplateGroupID
LEFT JOIN (SELECT ProcessTemplateGroupId, Name  FROM ProcessTemplateGroupLanguages JOIN Settings ON ProcessTemplateGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateGroupLanguage
	ON DefaultProcessTemplateGroupLanguage.ProcessTemplateGroupId = ProcessTemplates.ProcessTemplateGroupID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplates.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplates.ModifierID
WHERE ProcessTemplates.ProcessTemplateId = @ProcessTemplateID
