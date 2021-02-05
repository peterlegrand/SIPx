CREATE PROCEDURE usp_FrontProcessViewGetFields (@UserId nvarchar(450), @ProcessId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
DECLARE @StageId int
SELECT @StageId = Processes.ProcessTypeStageID FROM Processes WHERE Processes.ProcessID = @ProcessId;

SELECT ProcessFields.ProcessID
	, ProcessFields.ProcessFieldID
	, ProcessFields.ProcessTypeID
	, ProcessFields.ProcessTypeFieldID
	, Processes.ProcessTypeStageID
	, ProcessTypeStageFields.ProcessTypeStageFieldStatusID 
	, ISNULL(TemplateFieldUserLanguage.ProcessTypeFieldName,ISNULL(TemplateFieldDefaultLanguage.ProcessTypeFieldName,'No name for this template')) ProcessTypeFieldName

	, ISNULL(ProcessFields.IntValue,0) IntValue
	, ISNULL(ProcessFields.StringValue,'') StringValue
	, ISNULL(ProcessFields.DateTimeValue,'1-1-1') DateTimeValue 
	, ISNULL(PrimarySecondaryProjectName,'') PrimarySecondaryProjectName
	, ISNULL(PrimarySecondaryProject,0) PrimarySecondaryProject

	, ProcessTypeStageFields.Sequence
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
	, ISNULL(PrimarySecondaryPerson.PrimarySecondaryPersonType,0) PrimarySecondaryPersonType
	, ISNULL(PrimarySecondaryPerson.PrimarySecondaryPersonName,'') PrimarySecondaryPersonName
	, ISNULL(PrimarySecondaryProject.PrimarySecondaryProject,0) PrimarySecondaryProjectType
	, ISNULL(PrimarySecondaryProject.PrimarySecondaryProjectName,'') PrimarySecondaryProjectName
	, ProcessTypeFields.ProcessTypeFieldTypeID
FROM ProcessFields
JOIN Processes
	ON Processes.ProcessID = ProcessFields.ProcessID
JOIN ProcessTypeFields
	ON ProcessFields.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID

--ProcessTypeFieldName
LEFT JOIN (
		SELECT ProcessTypeFieldId, Name ProcessTypeFieldName
		FROM ProcessTypeFieldLanguages 
		WHERE LanguageId = @LanguageID) TemplateFieldUserLanguage
	ON TemplateFieldUserLanguage.ProcessTypeFieldID= ProcessTypeFields.ProcessTypeFieldID
LEFT JOIN (
		SELECT ProcessTypeFieldId, Name ProcessTypeFieldName
		FROM ProcessTypeFieldLanguages 
		JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue 
		WHERE Settings.SettingId = 1) TemplateFieldDefaultLanguage
	ON TemplateFieldDefaultLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID

--primary and secondary User
LEFT JOIN (
		SELECT Processfields.ProcessFieldID
			, CONCAT(FirstName, ' ' ,LastName) PrimarySecondaryPersonName  
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryPersonType
		FROM AspNetUsers 
		JOIN Persons ON Persons.UserID = AspNetUsers.Id 
		JOIN ProcessFields ON ProcessFields.StringValue = AspNetUsers.id 
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (12,13)) PrimarySecondaryUser 
	ON PrimarySecondaryUser.ProcessFieldID = ProcessFields.ProcessFieldID

--primary and secondary person
LEFT JOIN (
		SELECT Processfields.ProcessFieldID
			, CONCAT(FirstName, ' ' ,LastName) PrimarySecondaryPersonName  
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryPersonType
		FROM Persons  
		JOIN ProcessFields ON ProcessFields.IntValue = Persons.PersonID
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (36,37)) PrimarySecondaryPerson 
	ON PrimarySecondaryPerson.ProcessFieldID = ProcessFields.ProcessFieldID

----Primary and secondary organization
--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM OrganizationLanguages 
--		JOIN ProcessFields ON ProcessFields.IntValue = OrganizationLanguages.OrganizationID 
--		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
--		WHERE Processtypefields.ProcessTypeFieldTypeID IN (14,15)		
--		AND LanguageId = @LanguageID ) PrimarySecondaryOrganizationUserLanguage
--	ON PrimarySecondaryOrganizationUserLanguage.ProcessFieldID= ProcessFields.IntValue

--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM OrganizationLanguages 
--		JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue  
--		JOIN ProcessFields ON ProcessFields.IntValue = OrganizationLanguages.OrganizationID 
--		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
--		WHERE Processtypefields.ProcessTypeFieldTypeID IN (14,15)		
--		AND Settings.SettingId = 1) PrimarySecondaryOrganizationDefaultLanguage
--	ON PrimarySecondaryOrganizationDefaultLanguage.ProcessFieldID = ProcessFields.ProcessFieldID

----Primary and secondary Project
--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM ProjectLanguages 
--		JOIN ProcessFields ON ProcessFields.IntValue = ProjectLanguages.ProjectID 
--		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
--		WHERE Processtypefields.ProcessTypeFieldTypeID IN (14,15)		
--		AND LanguageId = @LanguageID ) PrimarySecondaryProjectUserLanguage
--	ON PrimarySecondaryProjectUserLanguage.ProcessFieldID= ProcessFields.IntValue

--LEFT JOIN (
--		SELECT ProcessFields.ProcessFieldID
--			, Name 
--		FROM ProjectLanguages 
--		JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue  
--		JOIN ProcessFields ON ProcessFields.IntValue = ProjectLanguages.ProjectID 
--		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
--		WHERE Processtypefields.ProcessTypeFieldTypeID IN (14,15)		
--		AND Settings.SettingId = 1) PrimarySecondaryProjectDefaultLanguage
--	ON PrimarySecondaryProjectDefaultLanguage.ProcessFieldID = ProcessFields.ProcessFieldID

--Project
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(ProjectUser.Name,ISNULL(ProjectDefault.Name,'No name for this project')) PrimarySecondaryProjectName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryProject
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
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (16,17)		
		) PrimarySecondaryProject
	ON PrimarySecondaryProject.ProcessFieldID = ProcessFields.ProcessFieldID

--Organization
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(OrganizationUser.Name,ISNULL(OrganizationDefault.Name,'No name for this Organization')) PrimarySecondaryOrganizationName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryOrganization
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
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (14,15)		
		) PrimarySecondaryOrganization
	ON PrimarySecondaryOrganization.ProcessFieldID = ProcessFields.ProcessFieldID



--Classification
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(ClassificationUser.Name,ISNULL(ClassificationDefault.Name,'No name for this Classification')) PrimarySecondaryClassificationName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryClassification
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
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (20,21)		
		) PrimarySecondaryClassification
	ON PrimarySecondaryClassification.ProcessFieldID = ProcessFields.ProcessFieldID




--ClassificationValue
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(ClassificationValueUser.Name,ISNULL(ClassificationValueDefault.Name,'No name for this ClassificationValue')) PrimarySecondaryClassificationValueName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryClassificationValue
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
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (22,23)		
		) PrimarySecondaryClassificationValue
	ON PrimarySecondaryClassificationValue.ProcessFieldID = ProcessFields.ProcessFieldID



--Role
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(RoleUser.Name,ISNULL(RoleDefault.Name,'No name for this role')) PrimarySecondaryRoleName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryClassificationValue
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
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (30,31)		
		) PrimarySecondaryRole
	ON PrimarySecondaryRole.ProcessFieldID = ProcessFields.ProcessFieldID

	--PETER TODO Organization role, Project role, The user has a specific relation to the user field

--Content
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(Contents.Title,'No title for this content') PrimarySecondaryContentTitle
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryContent
		FROM Contents 
		JOIN ProcessFields ON ProcessFields.IntValue = Contents.ContentID
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (24,25)		
		) PrimarySecondaryContent
	ON PrimarySecondaryContent.ProcessFieldID = ProcessFields.ProcessFieldID



--Language
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(LanguageCustom.Name,ISNULL(LanguageDefault.Name,'No name for this langauge')) PrimarySecondaryLanguageName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryLanguage
		FROM Languages
JOIN UITermLanguages LanguageDefault
	ON LanguageDefault.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization Name FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) LanguageCustom
	ON LanguageCustom.UITermId = Languages.NameTermID
		JOIN ProcessFields ON ProcessFields.IntValue = Languages.LanguageID 
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (18,19)		
		) PrimarySecondaryLanguage
	ON PrimarySecondaryLanguage.ProcessFieldID = ProcessFields.ProcessFieldID



--Country
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(CountryCustom.Name,ISNULL(CountryDefault.Name,'No name for this langauge')) PrimarySecondaryCountryName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondaryCountry
		FROM Countries
JOIN UITermLanguages CountryDefault
	ON CountryDefault.UITermId = Countries.NameTermID
LEFT JOIN (SELECT UITermId, Customization Name FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageId) CountryCustom
	ON CountryCustom.UITermId = Countries.NameTermID
		JOIN ProcessFields ON ProcessFields.IntValue = Countries.CountryID 
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (26,27)		
		) PrimarySecondaryCountry
	ON PrimarySecondaryCountry.ProcessFieldID = ProcessFields.ProcessFieldID



--SecurityLevel
LEFT JOIN (
		SELECT ProcessFields.ProcessFieldID
			, ISNULL(SecurityLevelCustom.Name,ISNULL(SecurityLevelDefault.Name,'No name for this langauge')) PrimarySecondarySecurityLevelName
			, Processtypefields.ProcessTypeFieldTypeID PrimarySecondarySecurityLevel
		FROM SecurityLevels
JOIN UITermLanguages SecurityLevelDefault
	ON SecurityLevelDefault.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization Name FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageId) SecurityLevelCustom
	ON SecurityLevelCustom.UITermId = SecurityLevels.NameTermID
		JOIN ProcessFields ON ProcessFields.IntValue = SecurityLevels.SecurityLevelID 
		JOIN Processtypefields ON processfields.ProcessTypeFieldID = Processtypefields.ProcessTypeFieldID 
		WHERE Processtypefields.ProcessTypeFieldTypeID IN (26,27)		
		) PrimarySecondarySecurityLevel
	ON PrimarySecondarySecurityLevel.ProcessFieldID = ProcessFields.ProcessFieldID





JOIN ProcessTypeStageFields
	ON ProcessTypeStageFields.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID
	AND Processes.ProcessTypeStageID = ProcessTypeStageFields.ProcessTypeStageID
WHERE ProcessTypeStageFields.ProcessTypeStageFieldStatusID <> 1
	AND ProcessFields.ProcessID = @ProcessId
	AND ProcessTypeFields.ProcessTypeFieldTypeID NOT IN (10, 11)
ORDER BY ProcessTypeStageFields.Sequence

