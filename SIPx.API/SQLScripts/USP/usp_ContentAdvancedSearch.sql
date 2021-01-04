CREATE PROCEDURE usp_ContentAdvancedSearch(
	@UserId nvarchar(450)
	, @Contains nvarchar(500)
	, @OrganizationId int
	, @ProjectId int
	, @ContentTypeId int
	, @ContentStatusId int
	, @SecurityLevelId int
	, @LanguageId int
	, @ClassificationValueTable AS udt_ContentAdvancedSearchClassificationValues READONLY)
AS
DECLARE @UserLanguageID int;
SELECT @UserLanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;

DECLARE @statement NVARCHAR(2200);
DECLARE @FROM NVARCHAR(2200);
DECLARE @WHERE NVARCHAR(2200);


DECLARE ClassificationValuesCursor CURSOR 
  LOCAL STATIC READ_ONLY FORWARD_ONLY
FOR 
SELECT DISTINCT ClassificationValueId 
FROM @ClassificationValueTable

SET @FROM = 'SELECT Contents.ContentID ' +
	' , Contents.Title ' +
	' , Contents.Description ' +
	' , ISNULL(OrganizationUserLanguage.Name,ISNULL(OrganizationDefaultLanguage.Name,''No name for this organization'')) OrganizationName ' +
	' , Contents.OrganizationID ' +
	' , Persons.FirstName + '' '' + Persons.LastName CreatorName ' +
	' , Persons.PersonID CreatorId ' +
	' , Contents.CreatedDate ' +
' FROM  ' +
	' Contents  ' +
' JOIN Persons  ' +
	' ON Persons.UserID = Contents.CreatorID ' +
' LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages WHERE LanguageId = ' + trim(cast(@UserLanguageID as varchar(10))) + ') OrganizationUserLanguage ' +
	' ON OrganizationUserLanguage.OrganizationID= Persons.DefaultOrganizationID ' +
' LEFT JOIN (SELECT OrganizationId, Name, Description, MenuName, MouseOver, OrganizationLanguageID FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) OrganizationDefaultLanguage ' +
	' ON OrganizationDefaultLanguage.OrganizationId = Persons.DefaultOrganizationID ' 

SET @WHERE = ' WHERE 1=1 '

IF @Contains IS NOT NULL AND @Contains <> ''
BEGIN
SET @WHERE = @WHERE + ' AND Contains(Contents.Fulltext, ''' + trim(@Contains)  + ''')' 
END


IF @OrganizationId IS NOT NULL AND @OrganizationId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND Contents.OrganizationId = ' + trim(cast(@OrganizationId as varchar(10))) 
END

IF @ProjectId IS NOT NULL AND @ProjectId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND ProjectId  = ' + trim(cast(@ProjectId  as varchar(10))) 
END

IF @SecurityLevelId IS NOT NULL AND @SecurityLevelId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND SecurityLevelId  <= ' + trim(cast(@SecurityLevelId  as varchar(10))) 
END

IF @ContentTypeId IS NOT NULL AND @ContentTypeId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND ContentTypeId = ' + trim(cast(@ContentTypeId as varchar(10))) 
END

IF @ContentStatusId IS NOT NULL AND @ContentStatusId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND ContentStatusId = ' + trim(cast(@ContentStatusId as varchar(10))) 
END


IF @LanguageId IS NOT NULL AND @LanguageId <> 0
BEGIN
SET @WHERE = @WHERE + ' AND LanguageId = ' + trim(cast(@LanguageId as varchar(10))) 
END



DECLARE @ClassificationValueId int;
OPEN ClassificationValuesCursor
FETCH NEXT FROM ClassificationValuesCursor INTO @ClassificationValueId
WHILE @@FETCH_STATUS = 0
BEGIN 
--SET @WHERE = @WHERE + '1'
SET @WHERE = @WHERE + ' AND ContentId IN (SELECT ContentId FROM ContentClassificationValues WHERE ClassificationValueId = ' + trim(cast(@ClassificationValueId as varchar(10)))  + ') '
FETCH NEXT FROM ClassificationValuesCursor INTO @ClassificationValueId
END
CLOSE ClassificationValuesCursor
DEALLOCATE ClassificationValuesCursor


SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)
--SELECT @statement
EXECUTE sp_executesql @statement
