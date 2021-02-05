CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypeUpdateGet] (@UserId nvarchar(450), @ProcessTypeStageTypeId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeStageTypes.ProcessTypeStageTypeID
	, ISNULL(UserProcessTypeStageTypeLanguage.Name,ISNULL(DefaultProcessTypeStageTypeLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeStageTypeLanguage.Description,ISNULL(DefaultProcessTypeStageTypeLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeStageTypeLanguage.MenuName,ISNULL(DefaultProcessTypeStageTypeLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeStageTypeLanguage.MouseOver,ISNULL(DefaultProcessTypeStageTypeLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, IconID
	, Color
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeStageTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeStageTypes.ModifiedDate
FROM ProcessTypeStageTypes 
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageTypeLanguage
	ON UserProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStageTypes.ProcessTypeStageTypeID
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageTypeLanguage
	ON DefaultProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStageTypes.ProcessTypeStageTypeID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeStageTypes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeStageTypes.ModifierID
WHERE ProcessTypeStageTypes.ProcessTypeStageTypeId = @ProcessTypeStageTypeID
