CREATE PROCEDURE [dbo].[usp_ProcessTypeFieldLanguageUpdateGet] (@UserId nvarchar(450), @ProcessTypeFieldLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ProcessTypeFieldLanguage' AND Action = 'LanguageUpdate';
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ReadLogProcessTypeFieldLanguageCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @ProcessTypeFieldLanguageId, @UserId, Getdate(), @ScreenId)

SELECT ProcessTypeFieldLanguages.ProcessTypeFieldLanguageID
	, ProcessTypeFieldLanguages.LanguageID
	, ProcessTypeFieldLanguages.Name
	, ProcessTypeFieldLanguages.Description
	, ProcessTypeFieldLanguages.MenuName
	, ProcessTypeFieldLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeFieldLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeFieldLanguages.ModifiedDate
FROM ProcessTypeFields
JOIN ProcessTypeFieldLanguages
	ON ProcessTypeFields.ProcessTypeFieldId = ProcessTypeFieldLanguages.ProcessTypeFieldID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeFieldLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFieldLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFieldLanguages.ModifierID
WHERE ProcessTypeFieldLanguages.ProcessTypeFieldLanguageId = @ProcessTypeFieldLanguageID
	AND UILanguageName.LanguageId = @LanguageID
COMMIT TRANSACTION