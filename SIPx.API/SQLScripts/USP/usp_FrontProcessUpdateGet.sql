CREATE PROCEDURE usp_FrontProcessUpdateGet (@UserId nvarchar(450), @ProcessId int) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Processes.ProcessID
	, Processes.ProcessTemplateStageID 
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this template')) TemplateName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Processes.ModifiedDate
FROM Processes 
LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver, ProcessTemplateLanguageID FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTemplateID= Processes.ProcessTemplateID
LEFT JOIN (SELECT ProcessTemplateId, Name, Description, MenuName, MouseOver, ProcessTemplateLanguageID FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTemplateId = Processes.ProcessTemplateID
JOIN Persons Creator
	ON Creator.UserId = Processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Processes.ModifierID
WHERE Processes.ProcessID = @ProcessID
