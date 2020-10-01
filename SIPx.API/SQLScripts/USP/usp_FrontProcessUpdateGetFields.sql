CREATE PROCEDURE usp_FrontProcessUpdateGetFields (@UserId nvarchar(450), @ProcessId int) 
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT
	ProcessFields.ProcessID
	, ProcessFields.ProcessFieldID
	, ProcessFields.ProcessTemplateID
	, ProcessFields.ProcessTemplateFieldID
	, ProcessFields.StringValue
	, ProcessFields.IntValue
	, ProcessFields.DateTimeValue
	, ProcessTemplateFields.ProcessTemplateFieldTypeID
	, ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID
	, ProcessTemplateStageFields.ValueUpdateTypeID
	, ProcessTemplateStageFields.StringValue DefaultStringValue
	, ProcessTemplateStageFields.IntValue DefaultIntValue
	, ProcessTemplateStageFields.DateTimeValue DefaultDateTimeValue
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this field')) FieldName
	, 'Control1ID' + TRIM(CAST(Processfields.ProcessFieldId as nvarchar(10))) Control1 
	, 'Control2ID' + TRIM(CAST(Processfields.ProcessFieldId as nvarchar(10))) Control2 
	, 'Control3ID' + TRIM(CAST(Processfields.ProcessFieldId as nvarchar(10))) Control3 
	, 'Control4ID' + TRIM(CAST(Processfields.ProcessFieldId as nvarchar(10))) Control4 
	, 'Control5ID' + TRIM(CAST(Processfields.ProcessFieldId as nvarchar(10))) Control5 
	, 'Control6ID' + TRIM(CAST(Processfields.ProcessFieldId as nvarchar(10))) Control6 
	, ISNULL(UserField.UserName ,'') UserName
	, ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,'No name for this organization')) OrganizationName
	, ISNULL(ProjectUserLanguage.Name,ISNULL(ProjectDefaultLanguage.Name,'No name for this Project')) ProjectName
	, ISNULL(ClassificationUserLanguage.Name,ISNULL(ClassificationDefaultLanguage.Name,'No name for this Classification')) ClassificationName
	, ISNULL(ClassificationValueUserLanguage.Name,ISNULL(ClassificationValueDefaultLanguage.Name,'No name for this ClassificationValue')) ClassificationValueName
	, ISNULL(FieldLanguage.LanguageName,'') LanguageName
	, ISNULL(FieldCountry.CountryName,'') CountryName
	, ISNULL(FieldSecurityLevel.SecurityLevelName,'') SecurityLevelName
	, ISNULL(Contents.Title,'') ContentTitle
	, ISNULL(PersonField.PersonName ,'') PersonName
FROM ProcessFields
JOIN Processes	
	ON Processes.ProcessID = ProcessFields.ProcessID
JOIN ProcessTemplateFields
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
JOIN ProcessTemplateStageFields
	ON Processes.ProcessTemplateStageID = ProcessTemplateStageFields.ProcessTemplateStageID
		AND ProcessFields.ProcessTemplateFieldID = ProcessTemplateStageFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver, ProcessTemplateFieldLanguageID FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ProcessTemplateFieldID= ProcessFields.ProcessTemplateFieldID
LEFT JOIN (SELECT ProcessTemplateFieldId, Name, Description, MenuName, MouseOver, ProcessTemplateFieldLanguageID FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ProcessTemplateFieldId = ProcessFields.ProcessTemplateFieldID
LEFT JOIN (SELECT UserId, FirstName + ' ' + LastName UserName FROM Persons) UserField
	ON UserField.UserID = ProcessFields.StringValue
LEFT JOIN (SELECT PersonId, FirstName + ' ' + LastName PersonName FROM Persons) PersonField
	ON PersonField.PersonID= ProcessFields.IntValue


LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = @LanguageID) OrganizationUserLanguage
	ON OrganizationUserLanguage.OrganizationID= ProcessFields.IntValue
LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage
	ON OrganizationDefaultLanguage.OrganizationId = ProcessFields.IntValue

LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages WHERE LanguageId = @LanguageID) ProjectUserLanguage
	ON ProjectUserLanguage.ProjectID= ProcessFields.IntValue
LEFT JOIN (SELECT ProjectId, Name, Description, MenuName, MouseOver, ProjectLanguageID FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ProjectDefaultLanguage
	ON ProjectDefaultLanguage.ProjectId = ProcessFields.IntValue

LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages WHERE LanguageId = @LanguageID) ClassificationUserLanguage
	ON ClassificationUserLanguage.ClassificationID= ProcessFields.IntValue
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ClassificationDefaultLanguage
	ON ClassificationDefaultLanguage.ClassificationId = ProcessFields.IntValue


LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) ClassificationValueUserLanguage
	ON ClassificationValueUserLanguage.ClassificationValueID= ProcessFields.IntValue
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, ClassificationValueLanguageID FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) ClassificationValueDefaultLanguage
	ON ClassificationValueDefaultLanguage.ClassificationValueId = ProcessFields.IntValue

LEFT JOIN (SELECT Languages.LanguageId 
			, ISNULL(UINameCustom.Customization,UIName.Name) LanguageName
		FROM Languages
		JOIN UITermLanguages UIName
			ON UIName.UITermId = Languages.NameTermID
		LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
			ON UINameCustom.UITermId = Languages.NameTermID
		WHERE UIName.LanguageId = @LanguageID ) FieldLanguage
	ON FieldLanguage.LanguageID = ProcessFields.IntValue

LEFT JOIN (SELECT Countries.CountryId 
			, ISNULL(UINameCustom.Customization,UIName.Name) CountryName
		FROM Countries
		JOIN UITermLanguages UIName
			ON UIName.UITermId = Countries.NameTermID
		LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
			ON UINameCustom.UITermId = Countries.NameTermID
		WHERE UIName.LanguageId = @LanguageID) FieldCountry
	ON FieldCountry.CountryID = ProcessFields.IntValue

LEFT JOIN (SELECT SecurityLevels.SecurityLevelId 
			, ISNULL(UINameCustom.Customization,UIName.Name) SecurityLevelName
		FROM SecurityLevels
		JOIN UITermLanguages UIName
			ON UIName.UITermId = SecurityLevels.NameTermID
		LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
			ON UINameCustom.UITermId = SecurityLevels.NameTermID
		WHERE UIName.LanguageId = @LanguageID) FieldSecurityLevel
	ON FieldSecurityLevel.SecurityLevelID = ProcessFields.IntValue


LEFT JOIN Contents 
	ON Contents.ContentID = ProcessFields.IntValue

WHERE ProcessFields.ProcessID = @ProcessId
ORDER BY ProcessTemplateStageFields.Sequence