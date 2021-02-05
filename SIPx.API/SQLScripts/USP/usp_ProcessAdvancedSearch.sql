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
	, @ProcessTypeStageTypeId int)
AS
DECLARE @UserLanguageID int;
SELECT @UserLanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

DECLARE @statement NVARCHAR(max);
DECLARE @FROM NVARCHAR(max);
DECLARE @WHERE NVARCHAR(max);

SET @FROM = 'SELECT Processes.ProcessID ' +
	' , SubjectField.StringValue Subject ' +
	' , ISNULL(TemplateUserLanguage.Name,ISNULL(TemplateDefaultLanguage.Name,''No name for this template'')) ProcessTypeName ' +
	' , ISNULL(StageUserLanguage.Name,ISNULL(StageDefaultLanguage.Name,''No name for this stage'')) ProcessTypeStageName ' +
	' , trim(''/images/icons/'' + ProcessTypeIcon.FileName) ProcessTypeIcon ' +
	' , ProcessTypeStageTypes.Color ProcessTypeStageTypeColor ' +
	' , Creator.FirstName + '' '' + Creator.LastName CreatorName ' +
	' , Creator.PersonID CreatorID ' +
	' , Processes.CreatedDate ' +
' FROM  ' +
	' Processes ' +
' JOIN Processfields SubjectField ' +
	' ON Processes.ProcessID = SubjectField.ProcessID ' +
' JOIN ProcessTypeFields SubjectTemplate ' +

	' ON SubjectTemplate.ProcessTypeFieldID = SubjectField.ProcessTypeFieldID ' +
' JOIN ProcessTypes  ' +
	' ON ProcessTypes.ProcessTypeID = Processes.ProcessTypeID ' +
' JOIN Icons ProcessTypeIcon ' +
	' ON ProcessTypeIcon.IconId = ProcessTypes.IconID ' +
' JOIN processtypestages  ' +
	' ON processtypestages.ProcessTypeStageID = Processes.ProcessTypeStageID ' +
' JOIN ProcessTypeStageTypes  ' +
	' ON ProcessTypeStageTypes.ProcessTypeStageTypeID = processtypestages.ProcessTypeStageTypeID  ' +
' LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = ' + trim(cast(@UserLanguageID as varchar(10))) + ') TemplateUserLanguage ' +
	' ON TemplateUserLanguage.ProcessTypeID= Processes.ProcessTypeID ' +
' LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) TemplateDefaultLanguage ' +
	' ON TemplateDefaultLanguage.ProcessTypeId = Processes.ProcessTypeID ' +

' LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages WHERE LanguageId = ' + trim(cast(@UserLanguageID as varchar(10))) + ') StageUserLanguage ' +
	' ON StageUserLanguage.ProcessTypeStageID= Processes.ProcessTypeStageID ' +
' LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) StageDefaultLanguage ' +
	' ON StageDefaultLanguage.ProcessTypeStageId = Processes.ProcessTypeStageID ' +
' JOIN Persons Creator ' +
	' ON Creator.UserId = Processes.CreatorID'
SET @WHERE = ' WHERE SubjectTemplate.ProcessTypeFieldTypeId =1 '

IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @WHERE = @WHERE + ' AND ( Processes.ProcessId IN (SELECT ProcessId FROM PRocessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldID WHERE Freetext(StringValue , ''' + TRIM(@Contains) + ''') ' +
	 'AND ProcessTypeFieldTypeID IN ( 1, 2, 32)) )'
 
END



IF @Number IS NOT NULL AND @Number <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@Number as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId = 3 ) '
END

IF @DateFrom IS NOT NULL AND @DateFrom <> '1-1-1'
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.DateTimevalue = CAST(''' + trim(cast(@DateFrom as varchar(26))) + ''' AS Date) AND ProcessTypeFields.ProcessTypeFieldTypeId = 4 ) '
END

IF @DateFrom IS NOT NULL AND @DateFrom <> '1-1-1'
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.DateTimevalue = CAST(''' + trim(cast(@DateFrom as varchar(26))) + ''' AS DateTime) AND ProcessTypeFields.ProcessTypeFieldTypeId = 5 ) '
END


IF @DateFrom IS NOT NULL AND @DateFrom <> '1-1-1'
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.DateTimevalue >= CAST(''' + trim(cast(@DateFrom as varchar(26))) + ''' AS Date) AND ProcessTypeFields.ProcessTypeFieldTypeId = 6 ) '
END

IF @DateTo IS NOT NULL AND @DateTo <> '1-1-1'
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.DateTimevalue <= CAST(''' + trim(cast(@DateTo as varchar(26))) + ''' AS Date) AND ProcessTypeFields.ProcessTypeFieldTypeId = 7 ) '
END


IF @DateFrom IS NOT NULL AND @DateFrom <> '1-1-1'
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.DateTimevalue >= CAST(''' + trim(cast(@DateFrom as varchar(26))) + ''' AS Datetime) AND ProcessTypeFields.ProcessTypeFieldTypeId = 8 ) '
END

IF @DateTo IS NOT NULL AND @DateTo <> '1-1-1'
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.DateTimevalue <= CAST(''' + trim(cast(@DateTo as varchar(26))) + ''' AS Datetime) AND ProcessTypeFields.ProcessTypeFieldTypeId = 9 ) '
END


IF @SelectedUserId IS NOT NULL AND @SelectedUserId <> ''
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.stringValue = ''' + @SelectedUserId + ''' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 12 ,13)) '
END


IF @OrganizationId IS NOT NULL AND @OrganizationId <>0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@OrganizationId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 14 ,15)) '
END


IF @ProjectId IS NOT NULL AND @ProjectId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ProjectId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 16 ,17)) '
END


IF @LanguageId IS NOT NULL AND @LanguageId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@LanguageId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 18 ,19)) '
END



IF @ClassificationId IS NOT NULL AND @ClassificationId <> 0 
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ClassificationId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 20 ,21)) '
END



IF @ClassificationValueId IS NOT NULL AND @ClassificationValueId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ClassificationValueId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 22 ,23)) '
END



IF @ContentId IS NOT NULL AND @ContentId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@ContentId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 24 ,25)) '
END



IF @CountryId IS NOT NULL AND @CountryId<> 0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@CountryId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 26 ,27)) '
END



IF @SecurityLevelId IS NOT NULL AND @SecurityLevelId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@SecurityLevelId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 28 ,29)) '
END


IF @RoleId IS NOT NULL AND @RoleId <> ''
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.stringValue = ''' + @RoleId + ''' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 30 ,31)) '
END


IF @PersonId IS NOT NULL AND @PersonId<>0
BEGIN
SET @WHERE = @WHERE + ' AND Processes.ProcessId  in (SELECT ProcessFields.ProcessId FROM ProcessFields JOIN ProcessTypeFields ON ProcessFields.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId WHERE ProcessFields.intvalue = ' + trim(cast(@PersonId as varchar(10))) + ' AND ProcessTypeFields.ProcessTypeFieldTypeId IN ( 36 ,37)) '
END



IF @ProcessTypeStageTypeId IS NOT NULL AND @ProcessTypeStageTypeId <> 0
BEGIN
--SET @FROM = @FROM + ' JOIN ProcessTypeStages ON Processes.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageId '
SET @WHERE = @WHERE + ' AND ProcessTypeStages.ProcessTypeStageTypeId = ' + trim(cast(@ProcessTypeStageTypeId as varchar(10)))
END


SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)
--SELECT @statement
EXECUTE sp_executesql @statement
