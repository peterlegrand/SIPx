CREATE PROCEDURE [dbo].[usp_ProcessTypeGroupUpdateGetSequence] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeGroups.Sequence
	, ISNULL(UserProcessTypeGroupLanguage.Name,ISNULL(DefaultProcessTypeGroupLanguage.Name,'No name for this group')) Name
FROM ProcessTypeGroups
LEFT JOIN (SELECT ProcessTypeGroupId, Name, Description, MenuName, MouseOver FROM ProcessTypeGroupLanguages WHERE LanguageId = @LanguageID) UserProcessTypeGroupLanguage
	ON UserProcessTypeGroupLanguage.ProcessTypeGroupId = ProcessTypeGroups.ProcessTypeGroupID
LEFT JOIN (SELECT ProcessTypeGroupId, Name, Description, MenuName, MouseOver FROM ProcessTypeGroupLanguages JOIN Settings ON ProcessTypeGroupLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeGroupLanguage
	ON DefaultProcessTypeGroupLanguage.ProcessTypeGroupId = ProcessTypeGroups.ProcessTypeGroupID
ORDER BY ProcessTypeGroups.Sequence
