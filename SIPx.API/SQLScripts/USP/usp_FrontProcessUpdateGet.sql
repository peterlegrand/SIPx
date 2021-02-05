CREATE PROCEDURE usp_FrontProcessUpdateGet (@UserId nvarchar(450), @ProcessId int) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Processes.ProcessID
	, Processes.ProcessTypeStageID 
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this template')) TemplateName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Processes.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Processes.ModifiedDate
FROM Processes 
LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver, ProcessTypeLanguageID FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTypeID= Processes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver, ProcessTypeLanguageID FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTypeId = Processes.ProcessTypeID
JOIN Persons Creator
	ON Creator.UserId = Processes.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Processes.ModifierID
WHERE Processes.ProcessID = @ProcessID
