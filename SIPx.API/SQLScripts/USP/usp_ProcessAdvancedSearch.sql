CREATE PROCEDURE usp_ProcessAdvancedSearch( 
	@UserId nvarchar(450)
	, @Contains nvarchar(500)
	, @Number int
	, @DateFrom datetime
	, @DateTo datetime
	, @SelectedUserId nvarchar(450)
	, @OrganizationId int 
	, @ProjectId int
	, @LanguageId int
	, @ClassificationId int
	, @ClassificationValueId int
	, @ContentId int
	, @CountryId int
	, @SecurityLevelId int
	, @RoleId nvarchar(450)
	, @PersonId int
	, @ProcessTemplateStageTypeId int)
AS
DECLARE @UserLanguageID int;
SELECT @UserLanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

DECLARE @statement NVARCHAR(2200);
DECLARE @FROM NVARCHAR(2200);
DECLARE @WHERE NVARCHAR(2200);

SET @FROM = 'SELECT Processes.ProcessID ' +
	' , SubjectField.StringValue Subject ' +
	' , ISNULL(TemplateUserLanguage.Name,ISNULL(TemplateDefaultLanguage.Name,''No name for this template'')) ProcessTemplateName ' +
	' , ISNULL(StageUserLanguage.Name,ISNULL(StageDefaultLanguage.Name,''No name for this stage'')) ProcessTemplateStageName ' +
	' , trim(''/images/icons/'' + ProcessTemplateIcon.FileName) ProcessTemplateIcon ' +
	' , ProcessTemplateStageTypes.Color ProcessTemplateStageTypeColor ' +
	' , Creator.FirstName + '' '' + Creator.LastName CreatorName ' +
	' , Creator.PersonID CreatorID ' +
	' , Processes.CreatedDate ' +
' FROM  ' +
	' Processes ' +
' JOIN Processfields SubjectField ' +
	' ON Processes.ProcessID = SubjectField.ProcessID ' +
' JOIN ProcessTemplateFields SubjectTemplate ' +

	' ON SubjectTemplate.ProcessTemplateFieldID = SubjectField.ProcessTemplateFieldID ' +
' JOIN ProcessTemplates  ' +
	' ON ProcessTemplates.ProcessTemplateID = Processes.ProcessTemplateID ' +
' JOIN Icons ProcessTemplateIcon ' +
	' ON ProcessTemplateIcon.IconId = ProcessTemplates.IconID ' +
' JOIN processtemplatestages  ' +
	' ON processtemplatestages.ProcessTemplateStageID = Processes.ProcessTemplateStageID ' +
' JOIN ProcessTemplateStageTypes  ' +
	' ON ProcessTemplateStageTypes.ProcessTemplateStageTypeID = processtemplatestages.ProcessTemplateStageTypeID  ' +
' LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = ' + trim(cast(@UserLanguageID as varchar(10))) + ') TemplateUserLanguage ' +
	' ON TemplateUserLanguage.ProcessTemplateID= Processes.ProcessTemplateID ' +
' LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) TemplateDefaultLanguage ' +
	' ON TemplateDefaultLanguage.ProcessTemplateId = Processes.ProcessTemplateID ' +

' LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages WHERE LanguageId = ' + trim(cast(@UserLanguageID as varchar(10))) + ') StageUserLanguage ' +
	' ON StageUserLanguage.ProcessTemplateStageID= Processes.ProcessTemplateStageID ' +
' LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageDefaultLanguage ' +
	' ON StageDefaultLanguage.ProcessTemplateStageId = Processes.ProcessTemplateStageID ' +
' JOIN Persons Creator ' +
	' ON Creator.UserId = Processes.CreatorID'
SET @WHERE = ' WHERE 1=1 '

IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @WHERE = @WHERE + ' AND ( Processes.ProcessId IN (SELECT ProcessId FROM PRocessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID WHERE Freetext(StringValue , ''' + TRIM(@Contains) + ''') ' +
	 'AND ProcessTemplateFieldTypeID IN ( 1, 2, 32)) )'
 
END



IF @Number IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@Number as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 3 ) '
END

IF @DateFrom IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.DateTimevalue = CAST(' + trim(cast(@DateFrom as varchar(26))) + ' AS Date) AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 4 ) '
END

IF @DateFrom IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.DateTimevalue = CAST(' + trim(cast(@DateFrom as varchar(26))) + ' AS DateTime) AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 5 ) '
END


IF @DateFrom IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.DateTimevalue >= CAST(' + trim(cast(@DateFrom as varchar(26))) + ' AS Date) AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 6 ) '
END

IF @DateFrom IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.DateTimevalue <= CAST(' + trim(cast(@DateTo as varchar(26))) + ' AS Date) AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 7 ) '
END


IF @DateFrom IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.DateTimevalue >= CAST(' + trim(cast(@DateFrom as varchar(26))) + ' AS Datetime) AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 8 ) '
END

IF @DateFrom IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.DateTimevalue <= CAST(' + trim(cast(@DateTo as varchar(26))) + ' AS Datetime) AND ProcessTemplateFields.ProcessTemplateFieldTypeId = 9 ) '
END


IF @SelectedUserId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.stringValue = ''' + @SelectedUserId + ''' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 12 ,13)) '
END


IF @OrganizationId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@OrganizationId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 14 ,15)) '
END


IF @ProjectId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ProjectId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 16 ,17)) '
END


IF @LanguageId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@LanguageId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 18 ,19)) '
END



IF @ClassificationId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ClassificationId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 20 ,21)) '
END



IF @ClassificationValueId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ClassificationValueId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 22 ,23)) '
END



IF @ContentId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ContentId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 24 ,25)) '
END



IF @CountryId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@CountryId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 26 ,27)) '
END



IF @SecurityLevelId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@SecurityLevelId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 28 ,29)) '
END


IF @RoleId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.stringValue = ''' + @RoleId + ''' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 30 ,31)) '
END


IF @PersonId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTemplateFields ON ProcessFields.ProcessTemplateFieldId = ProcessTemplateField.ProcessTemplateFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@PersonId as varchar(10))) + ' AND ProcessTemplateFields.ProcessTemplateFieldTypeId IN ( 36 ,37)) '
END



IF @ProcessTemplateStageTypeId IS NOT NULL
BEGIN
SET @FROM = @FROM + ' JOIN ProcessTemplateStages ON Processes.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageId '
SET @WHERE = @WHERE + ' AND ProcessTemplateStages.ProcessTemplateStageTypeId = ' + trim(cast(@ProcessTemplateStageTypeId as varchar(10)))
END


SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)

EXECUTE sp_executesql @statement
