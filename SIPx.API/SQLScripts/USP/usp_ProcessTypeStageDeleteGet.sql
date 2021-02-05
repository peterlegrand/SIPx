CREATE PROCEDURE [dbo].[usp_ProcessTypeStageDeleteGet] (@UserId nvarchar(450), @ProcessTypeStageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeStages.ProcessTypeStageID
	, ProcessTypeStages.ProcessTypeID
	, ISNULL(UserProcessTypeStageLanguage.Name,ISNULL(DefaultProcessTypeStageLanguage.Name,'No name for this stage')) Name
	, ISNULL(UserProcessTypeStageLanguage.Description,ISNULL(DefaultProcessTypeStageLanguage.Description,'No description for this stage')) Description
	, ISNULL(UserProcessTypeStageLanguage.MenuName,ISNULL(DefaultProcessTypeStageLanguage.MenuName,'No menu name for this stage')) MenuName
	, ISNULL(UserProcessTypeStageLanguage.MouseOver,ISNULL(DefaultProcessTypeStageLanguage.MouseOver,'No mouse over for this stage')) MouseOver
	, ISNULL(UserProcessTypeStageTypeLanguage.Name,ISNULL(DefaultProcessTypeStageTypeLanguage.Name,'No name for this stage type')) TypeName
	, ProcessTypeStages.InToDo
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeStages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeStages.ModifiedDate
FROM ProcessTypeStages 
LEFT JOIN (SELECT ProcessTypeStageId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageLanguage
	ON UserProcessTypeStageLanguage.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageID
LEFT JOIN (SELECT ProcessTypeStageId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageLanguage
	ON DefaultProcessTypeStageLanguage.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageID
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageTypeLanguage
	ON UserProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStages.ProcessTypeStageTypeID
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageTypeLanguage
	ON DefaultProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStages.ProcessTypeStageTypeID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeStages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeStages.ModifierID
WHERE ProcessTypeStages.ProcessTypeStageId = @ProcessTypeStageId


