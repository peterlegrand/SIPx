CREATE PROCEDURE usp_ContentTypeCreateGetProcessTypes (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
ProcessTypes.ProcessTypeID
	, ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this ')) Name
	FROM ProcessTypes 
LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeLanguage
	ON UserProcessTypeLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID
LEFT JOIN (SELECT ProcessTypeId, Name, Description, MenuName, MouseOver FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeLanguage
	ON DefaultProcessTypeLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID

WHERE ProcessTypes.ProcessTypeID IN (select ProcessTypeId from ProcessTypeFields where processtypefields.ProcessTypeFieldTypeID = 24)
ORDER BY 
	ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this ')) 
	