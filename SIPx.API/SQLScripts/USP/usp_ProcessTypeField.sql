CREATE PROCEDURE [dbo].[usp_ProcessTypeField] (@UserId nvarchar(450), @ProcessTypeFieldId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ProcessTypeFields.ProcessTypeFieldID
	, ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this role')) Name
	, ISNULL(UserProcessTypeFieldLanguage.Description,ISNULL(DefaultProcessTypeFieldLanguage.Description,'No description for this role')) Description
	, ISNULL(UserProcessTypeFieldLanguage.MenuName,ISNULL(DefaultProcessTypeFieldLanguage.MenuName,'No menu name for this role')) MenuName
	, ISNULL(UserProcessTypeFieldLanguage.MouseOver,ISNULL(DefaultProcessTypeFieldLanguage.MouseOver,'No mouse over for this role')) MouseOver
	, ISNULL(UITypeNameCustom.Customization,UITypeName.Name) TypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ProcessTypeFields.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ProcessTypeFields.ModifiedDate
FROM ProcessTypeFields 
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage
	ON UserProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (SELECT ProcessTypeFieldId, Name, Description, MenuName, MouseOver FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage
	ON DefaultProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID
JOIN ProcessTypeFieldTypes 
	ON ProcessTypeFieldTypes.ProcessTypeFieldTypeId = ProcessTypeFields.ProcessTypeFieldTypeID
JOIN UITermLanguages UITypeName
	ON UITypeName.UITermId = ProcessTypeFieldTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UITypeNameCustom
	ON UITypeNameCustom.UITermId =ProcessTypeFieldTypes.NameTermID
JOIN Persons Creator
	ON Creator.UserId = ProcessTypeFields.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ProcessTypeFields.ModifierID
WHERE ProcessTypeFields.ProcessTypeFieldId = @ProcessTypeFieldID
	AND UITypeName.LanguageId = @LanguageID


