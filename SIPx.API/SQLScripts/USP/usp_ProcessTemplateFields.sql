CREATE PROCEDURE [dbo].[usp_ProcessTemplateFields] (@UserID nvarchar(450), @ProcessTemplateID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ProcessTemplateFields.ProcessTemplateFieldID
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFieldLanguage.Description,ISNULL(DefaultProcessTemplateFieldLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFieldLanguage.MenuName,ISNULL(DefaultProcessTemplateFieldLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFieldLanguage.MouseOver,ISNULL(DefaultProcessTemplateFieldLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) TypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFields.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFields.ModifiedDate
FROM ProcessTemplateFields 
LEFT JOIN (SELECT ProcessTemplateFieldID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages WHERE LanguageID = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldID, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
JOIN ProcessTemplateFieldTypes 
	ON ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID = ProcessTemplateFields.ProcessTemplateFieldTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermID = ProcessTemplateFieldTypes.NameTermID
LEFT JOIN (SELECT UITermID, Customization FROM UITermLanguageCustomizations  WHERE LanguageID = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermID =ProcessTemplateFieldTypes.NameTermID
JOIN Persons Creator
	ON Creator.UserID = ProcessTemplateFields.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ProcessTemplateFields.ModifierID
WHERE ProcessTemplateFields.ProcessTemplateID = @ProcessTemplateID
	AND UITypeName.LanguageID = @LanguageID
ORDER BY ISNULL(UITypeNameCustom.Customization,UITypeName.Name), ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this role'))

