CREATE PROCEDURE usp_ContentAdvancedSearch(
	@UserId nvarchar(450)
	, @Contains nvarchar(500)
	, @OrganizationId int
	, @ProjectId int
	, @ContentTypeId int
	, @ContentStatusId int
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


DECLARE ClassificationValues CURSOR 
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
SET @FROM = @FROM+ ' AND Contains(Contents.Fulltext, ''' + trim(@Contains)  + ''')' 
END


IF @OrganizationId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND OrganizationId = ' + trim(cast(@OrganizationId as varchar(10))) 
END

IF @ProjectId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND ProjectId  = ' + trim(cast(@ProjectId  as varchar(10))) 
END

IF @ContentTypeId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND ContentTypeId = ' + trim(cast(@ContentTypeId as varchar(10))) 
END

IF @ContentStatusId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND ContentStatusId = ' + trim(cast(@ContentStatusId as varchar(10))) 
END


IF @LanguageId IS NOT NULL
BEGIN
SET @WHERE = @WHERE + ' AND LanguageId = ' + trim(cast(@LanguageId as varchar(10))) 
END



DECLARE @ClassificationValueId int;
OPEN ClassificationValues
FETCH NEXT FROM ClassificationValues INTO @ClassificationValueId
WHILE @@FETCH_STATUS = 0
BEGIN 
SET @WHERE = @WHERE + ' AND ContentId IN (SELECT ContentId FROM ContentClassificationValues WHERE ClassificationValues = ' + trim(cast(@ClassificationValueId as varchar(10)))  + ') '
END
CLOSE MY_CURSOR
DEALLOCATE MY_CURSOR


SET @statement = TRIM(@FROM) + ' ' + TRIM(@WHERE)

EXECUTE sp_executesql @statement
