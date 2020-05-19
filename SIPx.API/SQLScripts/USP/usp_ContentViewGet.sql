CREATE PROCEDURE [dbo].[usp_ContentViewGet] (@LanguageID Int, @ContentID Int = NULL)
AS 
BEGIN
SELECT 
	Content.ContentID
	, Content.ContentStatusID
	, ContentStatusLanguages.Name AS ContentStatusName
	, ContentStatusLanguages.Name AS ContentStatusDescription
	, ContentStatusLanguages.Name AS ContentStatusMenuName
	, ContentStatusLanguages.Name AS ContentStatusMouseOver
	, Content.CreatedDate
	, Content.ModifiedDate
	, TRIM(Creator.FirstName)+' '+TRIM(Creator.LastName) Creator
	, TRIM(Modifier.FirstName)+' '+TRIM(Modifier.LastName) Modifier
	, ISNULL(UserContentTypeLanguages.Name, ISNULL(DefaultContentTypeLanguages.Name, '')) ContentTypeName
	, ISNULL(UserContentTypeLanguages.Description, ISNULL(DefaultContentTypeLanguages.Description, '')) ContentTypeDescription
	, ISNULL(UserContentTypeLanguages.MenuName, ISNULL(DefaultContentTypeLanguages.MenuName, '')) ContentTypeMenuName
	, ISNULL(UserContentTypeLanguages.MouseOver, ISNULL(DefaultContentTypeLanguages.MouseOver, '')) ContentTypeMouseOver
	, CAST(CASE WHEN UserContentTypeLanguages.Name IS NULL AND DefaultContentTypeLanguages.Name IS NOT NULL THEN 1 ELSE 0 END AS bit) DefaultContentTypeLanguage
	, Languages.LanguageName
	, SecurityLevelLanguages.Name SecurityLevelName
	, SecurityLevelLanguages.Description SecurityLevelDescription
	, SecurityLevelLanguages.MenuName SecurityLevelMenuName
	, SecurityLevelLanguages.MouseOver SecurityLevelMouseOver
	, ISNULL(UserOrganizationLanguages.Name, ISNULL(DefaultOrganizationLanguages.Name, '')) OrganizationName
	, ISNULL(UserOrganizationLanguages.Description, ISNULL(DefaultOrganizationLanguages.Description, '')) OrganizationDescription
	, ISNULL(UserOrganizationLanguages.MenuName, ISNULL(DefaultOrganizationLanguages.MenuName, '')) OrganizationMenuName
	, ISNULL(UserOrganizationLanguages.MouseOver, ISNULL(DefaultOrganizationLanguages.MouseOver, '')) OrganizationMouseOver
	, CAST(CASE WHEN UserOrganizationLanguages.Name IS NULL AND DefaultOrganizationLanguages.Name IS NOT NULL THEN 1 ELSE 0 END AS bit) DefaultOrganizationLanguage
	, ISNULL(UserProjectLanguages.Name, ISNULL(DefaultProjectLanguages.Name, '')) ProjectName
	, ISNULL(UserProjectLanguages.Description, ISNULL(DefaultProjectLanguages.Description, '')) ProjectDescription
	, ISNULL(UserProjectLanguages.MenuName, ISNULL(DefaultProjectLanguages.MenuName, '')) ProjectMenuName
	, ISNULL(UserProjectLanguages.MouseOver, ISNULL(DefaultProjectLanguages.MouseOver, '')) ProjectMouseOver
	, CAST(CASE WHEN UserProjectLanguages.Name IS NULL AND DefaultProjectLanguages.Name IS NOT NULL THEN 1 ELSE 0 END AS bit) DefaultProjectLanguage
	, ISNULL(Processes.Name,'') ProcessName
	, ISNULL(Processes.StringValue,'') ProcessSubject

FROM Content
JOIN ContentStatusLanguages
	ON Content.ContentStatusID = ContentStatusLanguages.ContentStatusID
LEFT JOIN ContentTypeLanguages UserContentTypeLanguages
	ON Content.ContentTypeID = UserContentTypeLanguages.ContentTypeID
LEFT JOIN ContentTypeLanguages DefaultContentTypeLanguages
	ON Content.ContentTypeID = DefaultContentTypeLanguages.ContentTypeID
JOIN Languages
	ON Languages.LanguageID = Content.LanguageID
JOIN SecurityLevelLanguages
	ON SecurityLevelLanguages.SecurityLevelID = Content.SecurityLevelID 
LEFT JOIN (SELECT OrganizationLanguages.* FROM OrganizationLanguages WHERE OrganizationLanguages.LanguageID = @LanguageID) UserOrganizationLanguages
	ON Content.OrganizationID = UserOrganizationLanguages.OrganizationID
LEFT JOIN (SELECT OrganizationLanguages.* FROM OrganizationLanguages JOIN Settings ON Settings.IntValue = OrganizationLanguages.LanguageID) DefaultOrganizationLanguages
	ON Content.OrganizationID = DefaultOrganizationLanguages.OrganizationID
LEFT JOIN (SELECT ProjectLanguages.* FROM ProjectLanguages WHERE ProjectLanguages.LanguageID = @LanguageID) UserProjectLanguages
	ON Content.ProjectID = UserProjectLanguages.ProjectID
LEFT JOIN (SELECT ProjectLanguages.* FROM ProjectLanguages JOIN Settings ON Settings.IntValue = ProjectLanguages.LanguageID) DefaultProjectLanguages
	ON Content.ProjectID = DefaultProjectLanguages.ProjectID
LEFT JOIN (SELECT Processes.ProcessID, ProcessTemplateLanguages.Name, ProcessFields.StringValue
FROM Processes 
JOIN ProcessTemplateLanguages 
	ON Processes.ProcessTemplateID = ProcessTemplateLanguages.ProcessTemplateID
JOIN ProcessFields
	ON ProcessFields.ProcessID = Processes.ProcessID
JOIN ProcessTemplateFields
	ON ProcessFields.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldID
	AND ProcessTemplateFields.ProcessTemplateID = ProcessTemplateLanguages.ProcessTemplateID
WHERE ProcessTemplateLanguages.LanguageID = @LanguageID
	AND ProcessTemplateFields.ProcessTemplateFieldTypeID = 1) AS Processes
	ON Content.ProcessID = Processes.ProcessID
JOIN AspNetUsers Creator
	ON Creator.Id = Content.CreatorID
JOIN AspNetUsers Modifier
	ON Modifier.Id = Content.ModifierID
WHERE ContentStatusLanguages.LanguageID = @LanguageID
	AND SecurityLevelLanguages.LanguageID = @LanguageID