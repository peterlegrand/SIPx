CREATE PROCEDURE [dbo].[usp_ProcessTypeStageLanguageUpdateGet] (@UserId nvarchar(450), @ProcessTypeStageLanguageId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'ProcessTypeStageLanguage' AND Action = 'LanguageUpdate';
SET XACT_ABORT ON;
BEGIN TRANSACTION
INSERT INTO ReadLogProcessTypeStageLanguageCUD (RecordId , UserId, ReadLogDate, MVCUIScreenID)  VALUES( @ProcessTypeStageLanguageId, @UserId, Getdate(), @ScreenId)

SELECT ProcessTypeStageLanguages.ProcessTypeStageLanguageID
	, ProcessTypeStageLanguages.LanguageID
	, ProcessTypeStageLanguages.Name
	, ProcessTypeStageLanguages.Description
	, ProcessTypeStageLanguages.MenuName
	, ProcessTypeStageLanguages.MouseOver
	, ISNULL(UILanguageNameCustom.Customization,UILanguageName.Name) LanguageName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, ProcessTypeStageLanguages.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, ProcessTypeStageLanguages.ModifiedDate
FROM ProcessTypeStages
JOIN ProcessTypeStageLanguages
	ON ProcessTypeStages.ProcessTypeStageId = ProcessTypeStageLanguages.ProcessTypeStageID
JOIN Languages 
	ON Languages.LanguageId = ProcessTypeStageLanguages.LanguageID
JOIN UITermLanguages UILanguageName
	ON UILanguageName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UILanguageNameCustom
	ON UILanguageNameCustom.UITermId = Languages.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeStageLanguages.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeStageLanguages.ModifierID
WHERE ProcessTypeStageLanguages.ProcessTypeStageLanguageId = @ProcessTypeStageLanguageID
	AND UILanguageName.LanguageId = @LanguageID
COMMIT TRANSACTION