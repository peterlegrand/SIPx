CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypes] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeStageTypes.ProcessTypeStageTypeID
	, ISNULL(UserProcessTypeStageTypeLanguage.Name,ISNULL(DefaultProcessTypeStageTypeLanguage.Name,'No name for this relation type')) Name
	, ISNULL(UserProcessTypeStageTypeLanguage.Description,ISNULL(DefaultProcessTypeStageTypeLanguage.Description,'No description for this relation type')) Description
	, ISNULL(UserProcessTypeStageTypeLanguage.MenuName,ISNULL(DefaultProcessTypeStageTypeLanguage.MenuName,'No menu name for this relation type')) MenuName
	, ISNULL(UserProcessTypeStageTypeLanguage.MouseOver,ISNULL(DefaultProcessTypeStageTypeLanguage.MouseOver,'No mouse over for this relation type')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeStageTypes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
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
ORDER BY ISNULL(UserProcessTypeStageTypeLanguage.Name,ISNULL(DefaultProcessTypeStageTypeLanguage.Name,'No name for this relation type'))