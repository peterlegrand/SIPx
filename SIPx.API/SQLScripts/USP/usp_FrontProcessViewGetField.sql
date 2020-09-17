CREATE PROCEDURE usp_FrontProcessViewGetField (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @StageId int
SELECT @StageId = Processes.ProcessTemplateStageID FROM Processes WHERE Processes.ProcessID = @ProcessId;

SELECT ProcessFields.ProcessID
	, ProcessFields.ProcessFieldID
	, ProcessFields.ProcessTemplateID
	, ProcessFields.ProcessTemplateFieldID
	, Processes.ProcessTemplateStageID
	, ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID 
	, ProcessTemplateFields.ProcessTemplateFieldTypeID
	, ProcessTemplateStages.ProcessTemplateStageTypeID

	, ISNULL(TemplateFieldUserLanguage.ProcessTemplateFieldName,ISNULL(TemplateFieldDefaultLanguage.ProcessTemplateFieldName,'No name for this template')) ProcessTemplateFieldName
	, ISNULL(TemplateStageTypeUserLanguage.ProcessTemplateStageTypeName,ISNULL(TemplateStageTypeDefaultLanguage.ProcessTemplateStageTypeName,'No name for this template')) ProcessTemplateStageTypeName
	, ProcessTemplateStageTypes.Color StageTypeColor
	, StageTypeIcon.FileName StageTypeIcon
	, ProcessTemplates.Color ProcessTemplateColor
	, ProcessTemplateIcon.FileName ProcessTemplateIcon

	, ISNULL(ProcessFields.IntValue,0) IntValue
	, ISNULL(ProcessFields.StringValue,'') StringValue
	, ISNULL(ProcessFields.DateTimeValue,'1-1-1') DateTimeValue 

	, ProcessTemplateStageFields.Sequence
	, 'ProcessField' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlProcessFieldId
	, 'ProcessId' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlProcessId
	, 'Control' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId
	, 'Controla' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId1
	, 'Controlb' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId2
	, 'Controlc' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId3
	, 'Controld' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId4
	, 'Controle' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId5
	, 'Controlf' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId6
	, 'Controlg' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId7
	, 'Controlh' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId8
	, 'Controli' + cast(ProcessFields.ProcessFieldID as varchar(10)) ControlId9
	, ISNULL(PrimarySecondaryUser.PrimarySecondaryUserType,0) PrimarySecondaryUserType
	, ISNULL(PrimarySecondaryUser.PrimarySecondaryUserName,'') PrimarySecondaryUserName
	, ISNULL(PrimarySecondaryPerson.PrimarySecondaryPersonType,0) PrimarySecondaryPersonType
	, ISNULL(PrimarySecondaryPerson.PrimarySecondaryPersonName,'') PrimarySecondaryPersonName
	, ISNULL(PrimarySecondaryProject.PrimarySecondaryProject,0) PrimarySecondaryProjectType
	, ISNULL(PrimarySecondaryProject.PrimarySecondaryProjectName,'') PrimarySecondaryProjectName
	, ISNULL(PrimarySecondaryOrganization.PrimarySecondaryOrganization,0) PrimarySecondaryOrganizationType
	, ISNULL(PrimarySecondaryOrganization.PrimarySecondaryOrganizationName,'') PrimarySecondaryOrganizationName
	, ISNULL(PrimarySecondaryClassification.PrimarySecondaryClassification,0) PrimarySecondaryClassificationType
	, ISNULL(PrimarySecondaryClassification.PrimarySecondaryClassificationName,'') PrimarySecondaryClassificationName
	, ISNULL(PrimarySecondaryClassificationValue.PrimarySecondaryClassificationValue,0) PrimarySecondaryClassificationValueType
	, ISNULL(PrimarySecondaryClassificationValue.PrimarySecondaryClassificationValueName,'') PrimarySecondaryClassificationValueName
	, ISNULL(PrimarySecondaryRole.PrimarySecondaryRole,0) PrimarySecondaryRoleType
	, ISNULL(PrimarySecondaryRole.PrimarySecondaryRoleName,'') PrimarySecondaryRoleName
	, ISNULL(PrimarySecondaryContent.PrimarySecondaryContent,0) PrimarySecondaryContentType
	, ISNULL(PrimarySecondaryContent.PrimarySecondaryContentTitle,'') PrimarySecondaryContentTitle
	, ISNULL(PrimarySecondaryLanguage.PrimarySecondaryLanguage,0) PrimarySecondaryLanguageType
	, ISNULL(PrimarySecondaryLanguage.PrimarySecondaryLanguageName,'') PrimarySecondaryLanguageName
	, ISNULL(PrimarySecondaryCountry.PrimarySecondaryCountry,0) PrimarySecondaryCountryType
	, ISNULL(PrimarySecondaryCountry.PrimarySecondaryCountryName,'') PrimarySecondaryCountryName
	, ISNULL(PrimarySecondarySecurityLevel.PrimarySecondarySecurityLevel,0) PrimarySecondarySecurityLevelType
	, ISNULL(PrimarySecondarySecurityLevel.PrimarySecondarySecurityLevelName,'') PrimarySecondarySecurityLevelName
FROM ProcessFields
JOIN Processes
	ON Processes.ProcessID = ProcessFields.ProcessID
JOIN ProcessTemplates 
	ON ProcessTemplates.ProcessTemplateId = Processes.ProcessTemplateId
JOIN ProcessTemplateFields
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID

--ProcessTemplateFieldName
LEFT JOIN (
		SELECT ProcessTemplateFieldId, Name ProcessTemplateFieldName
		FROM ProcessTemplateFieldLanguages 
		WHERE LanguageId = @LanguageID) TemplateFieldUserLanguage
	ON TemplateFieldUserLanguage.ProcessTemplateFieldID= ProcessTemplateFields.ProcessTemplateFieldID
LEFT JOIN (
		SELECT ProcessTemplateFieldId, Name ProcessTemplateFieldName
		FROM ProcessTemplateFieldLanguages 
		JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue 
		WHERE Settings.SettingId = 1) TemplateFieldDefaultLanguage
	ON TemplateFieldDefaultLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID

--primary and secondary User
LEFT JOIN (
		SELECT Processfields.ProcessFieldID
			, CONCAT(FirstName, ' ' ,LastName) PrimarySecondaryUserName  
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryUserType
		FROM AspNetUsers 
		JOIN Persons ON Persons.UserID = AspNetUsers.Id 
		JOIN ProcessFields ON ProcessFields.StringValue = AspNetUsers.id 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (12,13)) PrimarySecondaryUser 
	ON PrimarySecondaryUser.ProcessFieldID = ProcessFields.ProcessFieldID

--primary and secondary person
LEFT JOIN (
		SELECT Processfields.ProcessFieldID
			, CONCAT(FirstName, ' ' ,LastName) PrimarySecondaryPersonName  
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryPersonType
		FROM Persons  
		JOIN ProcessFields ON ProcessFields.IntValue = Persons.PersonID
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (36,37)) PrimarySecondaryPerson 
	ON PrimarySecondaryPerson.ProcessFieldID = ProcessFields.ProcessFieldID

----Primary and secondary organization
--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM OrganizationLanguages 
--		JOIN ProcessFields ON ProcessFields.IntValue = OrganizationLanguages.OrganizationID 
--		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
--		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (14,15)		
--		AND LanguageId = @LanguageID ) PrimarySecondaryOrganizationUserLanguage
--	ON PrimarySecondaryOrganizationUserLanguage.ProcessFieldID= ProcessFields.IntValue

--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM OrganizationLanguages 
--		JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue  
--		JOIN ProcessFields ON ProcessFields.IntValue = OrganizationLanguages.OrganizationID 
--		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
--		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (14,15)		
--		AND Settings.SettingId = 1) PrimarySecondaryOrganizationDefaultLanguage
--	ON PrimarySecondaryOrganizationDefaultLanguage.ProcessFieldID = ProcessFields.ProcessFieldID

----Primary and secondary Project
--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM ProjectLanguages 
--		JOIN ProcessFields ON ProcessFields.IntValue = ProjectLanguages.ProjectID 
--		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
--		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (14,15)		
--		AND LanguageId = @LanguageID ) PrimarySecondaryProjectUserLanguage
--	ON PrimarySecondaryProjectUserLanguage.ProcessFieldID= ProcessFields.IntValue

--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM ProjectLanguages 
--		JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue  
--		JOIN ProcessFields ON ProcessFields.IntValue = ProjectLanguages.ProjectID 
--		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
--		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (14,15)		
--		AND Settings.SettingId = 1) PrimarySecondaryProjectDefaultLanguage
--	ON PrimarySecondaryProjectDefaultLanguage.ProcessFieldID = ProcessFields.ProcessFieldID

--Project
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(ProjectUser.Name,ISNULL(ProjectDefault.Name,'No name for this project')) PrimarySecondaryProjectName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryProject
		FROM Projects
		LEFT JOIN (
				SELECT ProjectId, Name 
				FROM ProjectLanguages 
				JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue 
				WHERE Settings.SettingId = 1) ProjectDefault
			ON ProjectDefault.ProjectID = Projects.ProjectID
		LEFT JOIN (
				SELECT ProjectId, Name 
				FROM ProjectLanguages 
				WHERE ProjectLanguages.LanguageID = @LanguageId) ProjectUser
			ON ProjectUser.ProjectID = projects.ProjectID
		JOIN ProcessFields ON ProcessFields.IntValue = Projects.ProjectID 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (16,17)		
		) PrimarySecondaryProject
	ON PrimarySecondaryProject.ProcessFieldID = ProcessFields.ProcessFieldID

--Organization
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(OrganizationUser.Name,ISNULL(OrganizationDefault.Name,'No name for this Organization')) PrimarySecondaryOrganizationName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryOrganization
		FROM Organizations
		LEFT JOIN (
				SELECT OrganizationId, Name 
				FROM OrganizationLanguages 
				JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue 
				WHERE Settings.SettingId = 1) OrganizationDefault
			ON OrganizationDefault.OrganizationID = Organizations.OrganizationID
		LEFT JOIN (
				SELECT OrganizationId, Name 
				FROM OrganizationLanguages 
				WHERE OrganizationLanguages.LanguageID = @LanguageId) OrganizationUser
			ON OrganizationUser.OrganizationID = Organizations.OrganizationID
		JOIN ProcessFields ON ProcessFields.IntValue = Organizations.OrganizationID 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (14,15)		
		) PrimarySecondaryOrganization
	ON PrimarySecondaryOrganization.ProcessFieldID = ProcessFields.ProcessFieldID



--Classification
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(ClassificationUser.Name,ISNULL(ClassificationDefault.Name,'No name for this Classification')) PrimarySecondaryClassificationName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryClassification
		FROM Classifications
		LEFT JOIN (
				SELECT ClassificationId, Name 
				FROM ClassificationLanguages 
				JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue 
				WHERE Settings.SettingId = 1) ClassificationDefault
			ON ClassificationDefault.ClassificationID = Classifications.ClassificationID
		LEFT JOIN (
				SELECT ClassificationId, Name 
				FROM ClassificationLanguages 
				WHERE ClassificationLanguages.LanguageID = @LanguageId) ClassificationUser
			ON ClassificationUser.ClassificationID = Classifications.ClassificationID
		JOIN ProcessFields ON ProcessFields.IntValue = Classifications.ClassificationID 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (20,21)		
		) PrimarySecondaryClassification
	ON PrimarySecondaryClassification.ProcessFieldID = ProcessFields.ProcessFieldID




--ClassificationValue
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(ClassificationValueUser.Name,ISNULL(ClassificationValueDefault.Name,'No name for this ClassificationValue')) PrimarySecondaryClassificationValueName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryClassificationValue
		FROM ClassificationValues
		LEFT JOIN (
				SELECT ClassificationValueId, Name 
				FROM ClassificationValueLanguages 
				JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue 
				WHERE Settings.SettingId = 1) ClassificationValueDefault
			ON ClassificationValueDefault.ClassificationValueID = ClassificationValues.ClassificationValueID
		LEFT JOIN (
				SELECT ClassificationValueId, Name 
				FROM ClassificationValueLanguages 
				WHERE ClassificationValueLanguages.LanguageID = @LanguageId) ClassificationValueUser
			ON ClassificationValueUser.ClassificationValueID = ClassificationValues.ClassificationValueID
		JOIN ProcessFields ON ProcessFields.IntValue = ClassificationValues.ClassificationValueID 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (22,23)		
		) PrimarySecondaryClassificationValue
	ON PrimarySecondaryClassificationValue.ProcessFieldID = ProcessFields.ProcessFieldID



--Role
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(RoleUser.Name,ISNULL(RoleDefault.Name,'No name for this role')) PrimarySecondaryRoleName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryRole
		FROM AspNetRoles
		LEFT JOIN (
				SELECT RoleLanguages.RoleID, Name 
				FROM RoleLanguages 
				JOIN Settings ON RoleLanguages.LanguageId = Settings.IntValue 
				WHERE Settings.SettingId = 1) RoleDefault
			ON RoleDefault.RoleID = AspNetRoles.Id
		LEFT JOIN (
				SELECT RoleID, Name 
				FROM RoleLanguages 
				WHERE RoleLanguages.LanguageID = @LanguageId) RoleUser
			ON RoleUser.RoleID = AspNetRoles.Id
		JOIN ProcessFields ON ProcessFields.StringValue= AspNetRoles.Id
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (30,31)		
		) PrimarySecondaryRole
	ON PrimarySecondaryRole.ProcessFieldID = ProcessFields.ProcessFieldID

	--PETER TODO Organization role, Project role, The user has a specific relation to the user field

--Content
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(Contents.Title,'No title for this content') PrimarySecondaryContentTitle
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryContent
		FROM Contents 
		JOIN ProcessFields ON ProcessFields.IntValue = Contents.ContentID
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (24,25)		
		) PrimarySecondaryContent
	ON PrimarySecondaryContent.ProcessFieldID = ProcessFields.ProcessFieldID



--Language
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(LanguageCustom.Name,ISNULL(LanguageDefault.Name,'No name for this langauge')) PrimarySecondaryLanguageName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryLanguage
		FROM Languages
JOIN UITermLanguages LanguageDefault
	ON LanguageDefault.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization Name FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) LanguageCustom
	ON LanguageCustom.UITermId = Languages.NameTermID
		JOIN ProcessFields ON ProcessFields.IntValue = Languages.LanguageID 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (18,19)		
		) PrimarySecondaryLanguage
	ON PrimarySecondaryLanguage.ProcessFieldID = ProcessFields.ProcessFieldID



--Country
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(CountryCustom.Name,ISNULL(CountryDefault.Name,'No name for this langauge')) PrimarySecondaryCountryName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondaryCountry
		FROM Countries
JOIN UITermLanguages CountryDefault
	ON CountryDefault.UITermId = Countries.NameTermID
LEFT JOIN (SELECT UITermId, Customization Name FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageId) CountryCustom
	ON CountryCustom.UITermId = Countries.NameTermID
		JOIN ProcessFields ON ProcessFields.IntValue = Countries.CountryID 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (26,27)		
		) PrimarySecondaryCountry
	ON PrimarySecondaryCountry.ProcessFieldID = ProcessFields.ProcessFieldID



--SecurityLevel
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(SecurityLevelCustom.Name,ISNULL(SecurityLevelDefault.Name,'No name for this langauge')) PrimarySecondarySecurityLevelName
			, Processtemplatefields.ProcessTemplateFieldTypeID PrimarySecondarySecurityLevel
		FROM SecurityLevels
JOIN UITermLanguages SecurityLevelDefault
	ON SecurityLevelDefault.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization Name FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageId) SecurityLevelCustom
	ON SecurityLevelCustom.UITermId = SecurityLevels.NameTermID
		JOIN ProcessFields ON ProcessFields.IntValue = SecurityLevels.SecurityLevelID 
		JOIN Processtemplatefields ON processfields.ProcessTemplateFieldID = Processtemplatefields.ProcessTemplateFieldID 
		WHERE Processtemplatefields.ProcessTemplateFieldTypeID IN (26,27)		
		) PrimarySecondarySecurityLevel
	ON PrimarySecondarySecurityLevel.ProcessFieldID = ProcessFields.ProcessFieldID





JOIN ProcessTemplateStageFields
	ON ProcessTemplateStageFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
	AND Processes.ProcessTemplateStageID = ProcessTemplateStageFields.ProcessTemplateStageID
JOIN ProcessTemplateStages 
	ON Processes.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID
JOIN ProcessTemplateStageTypes	
	ON ProcessTemplateStages.ProcessTemplateStageTypeID = ProcessTemplateStageTypes.ProcessTemplateStageTypeID
JOIN Icons StageTypeIcon	
	ON ProcessTemplateStageTypes.IconID = StageTypeIcon.IconId
LEFT JOIN (
		SELECT ProcessTemplateStageTypeId, Name ProcessTemplateStageTypeName
		FROM ProcessTemplateStageTypeLanguages 
		WHERE LanguageId = @LanguageID) TemplateStageTypeUserLanguage
	ON TemplateStageTypeUserLanguage.ProcessTemplateStageTypeID= ProcessTemplateStages.ProcessTemplateStageTypeID
LEFT JOIN (
		SELECT ProcessTemplateStageTypeId, Name ProcessTemplateStageTypeName
		FROM ProcessTemplateStageTypeLanguages 
		JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue 
		WHERE Settings.SettingId = 1) TemplateStageTypeDefaultLanguage
	ON TemplateStageTypeDefaultLanguage.ProcessTemplateStageTypeId = ProcessTemplateStages.ProcessTemplateStageTypeID
 JOIN Icons ProcessTemplateIcon
	ON ProcessTemplateIcon.IconId = ProcessTemplates.IconID
WHERE ProcessTemplateStageFields.ProcessTemplateStageFieldStatusID <> 1
	AND ProcessFields.ProcessID = @ProcessId
	AND ProcessTemplateFields.ProcessTemplateFieldTypeID NOT IN (10, 11)
ORDER BY ProcessTemplateStageFields.Sequence

