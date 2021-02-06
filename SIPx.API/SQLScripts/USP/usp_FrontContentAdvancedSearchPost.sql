CREATE PROCEDURE usp_FrontContentAdvancedSearchPost (
	@UserId nvarchar(450) 
	, @Title nvarchar(50) =''
	, @Description nvarchar(50) =''
	, @Text nvarchar(50) =''
	, @OrganizationId int
	, @ProjectId int
	, @ParentContentId int
	, @SelectedLanguageId int
	, @SelectedSecurityLevelId int
	, @ContentStatusId int
	, @ContentTypeId int
	, @CreatedFromDate datetime
	, @CreatedToDate datetime
	, @PersonId int
	, @ClassificationValueTable AS udt_FrontContentAdvancedSearchPostClassificationValues READONLY)
AS

DECLARE @SecurityLevelId int;
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT Contents.ContentID
	, Contents.Title
	, ContentVersions.Description
	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this content type')) ContentTypeName
FROM Contents
JOIN ContentVersions
	ON Contents.ActiveVersionId = ContentVersions.ContentVersionId
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeID= Contents.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = Contents.ContentTypeID
WHERE (Contents.Title LIKE '%' + @Title + '%' OR @Title = '' OR @Title IS NULL )
	AND (ContentVersions.Description LIKE '%' + @Description + '%' OR @Description = '' OR @Description IS NULL )
	AND (ContentVersions.Description LIKE '%' + @Text + '%' OR Contents.Title LIKE '%' + @Text + '%' OR @Text = '' OR @Text IS NULL )
	AND(Contents.OrganizationId = @OrganizationId OR @OrganizationId  = 0 )
	AND (Contents.ProjectId = @ProjectId OR @ProjectId = 0 )
	AND(Contents.ParentContentId= @ParentContentId OR @ParentContentId = 0 )
	AND(Contents.LanguageID= @SelectedLanguageId OR @SelectedLanguageId= 0 )
	AND Contents.SecurityLevelID>= @SelectedSecurityLevelId 
	AND Contents.SecurityLevelID<= @SecurityLevelId 
	AND(Contents.ContentStatusID= @ContentStatusID OR @ContentStatusID = 0 )
	AND(Contents.ContentTypeID= @ContentTypeID OR @ContentTypeID = 0 )
	AND Contents.CreatedDate >= @CreatedFromDate
	AND Contents.CreatedDate <= @CreatedToDate
	AND (Contents.CreatorID IN (SELECT UserId FROM Persons WHERE PersonId = @PersonId) OR @PersonId = 0)
ORDER BY Contents.Title			