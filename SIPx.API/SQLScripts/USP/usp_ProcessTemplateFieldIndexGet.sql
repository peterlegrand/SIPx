CREATE PROCEDURE [dbo].[usp_ProcessTemplateFieldIndexGet] (@UserId nvarchar(450), @ProcessTemplateId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTemplateFields.ProcessTemplateFieldID
	, ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTemplateFieldLanguage.Description,ISNULL(DefaultProcessTemplateFieldLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTemplateFieldLanguage.MenuName,ISNULL(DefaultProcessTemplateFieldLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTemplateFieldLanguage.MouseOver,ISNULL(DefaultProcessTemplateFieldLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) ProcessTemplateFieldTypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTemplateFields.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTemplateFields.ModifiedDate
FROM ProcessTemplateFields 
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage
	ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage
	ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID
JOIN ProcessTemplateFieldTypes 
	ON ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId = ProcessTemplateFields.ProcessTemplateFieldTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermId = ProcessTemplateFieldTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermId =ProcessTemplateFieldTypes.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTemplateFields.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTemplateFields.ModifierID
WHERE ProcessTemplateFields.ProcessTemplateId = @ProcessTemplateID
	AND UITypeName.LanguageId = @LanguageID
ORDER BY ISNULL(UITypeNameCustom.Customization,UITypeName.Name), ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this role'))

