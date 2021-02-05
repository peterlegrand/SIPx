CREATE PROCEDURE [dbo].[usp_ProcessTypeStageTypeList] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeStageTypes.ProcessTypeStageTypeID
	, ISNULL(UserProcessTypeStageTypeLanguage.Name,ISNULL(DefaultProcessTypeStageTypeLanguage.Name,'No name for this stage type')) Name
FROM ProcessTypeStageTypes
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageTypeLanguage
	ON UserProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStageTypes.ProcessTypeStageTypeID
LEFT JOIN (SELECT ProcessTypeStageTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageTypeLanguage
	ON DefaultProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStageTypes.ProcessTypeStageTypeID
ORDER BY ISNULL(UserProcessTypeStageTypeLanguage.Name,ISNULL(DefaultProcessTypeStageTypeLanguage.Name,'No name for this stage type'))
