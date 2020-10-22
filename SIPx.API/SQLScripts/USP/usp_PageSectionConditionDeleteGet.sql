CREATE PROCEDURE usp_PageSectionConditionDeleteGet (@UserId nvarchar(450), @PageSectionConditionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionConditions.PageSectionConditionID
	, ISNULL(UserPageSectionConditionLanguage.Name,ISNULL(DefaultPageSectionConditionLanguage.Name,'No name for this SectionCondition')) Name
	, ISNULL(UserPageSectionConditionLanguage.Description,ISNULL(DefaultPageSectionConditionLanguage.Description,'No description for this SectionCondition')) Description
	, ISNULL(UserPageSectionConditionLanguage.MenuName,ISNULL(DefaultPageSectionConditionLanguage.MenuName,'No menu name for this SectionCondition')) MenuName
	, ISNULL(UserPageSectionConditionLanguage.MouseOver,ISNULL(DefaultPageSectionConditionLanguage.MouseOver,'No mouse over for this SectionCondition')) MouseOver
	, ISNULL(UIPageSectionConditionTypeNameCustom.Customization,UIPageSectionConditionTypeName.Name) PageSectionConditionTypeName
	, ISNULL(ContentTypeName, IsNull(SecurityLevelName,isnull(OrganizationName, isnull(ProjectName,isnull(LanguageName, isnull(ContentStatusName, isnull(ClassificationValueName, Isnull(username,'')))))))) PageSectionConditionName
	--, ISNULL(ContentTypeCondition.ContentTypeName, '') ContentTypeName
	--, ISNULL(SecurityLevelCondition.SecurityLevelName,'') SecurityLevelName
	--, ISNULL(OrganizationCondition.OrganizationName,'') OrganizationName
	--, ISNULL(ProjectCondition.ProjectName,'') ProjectName
	--, ISNULL(LanguageCondition.LanguageName,'') LanguageName
	--, ISNULL(ContentStatusCondition.ContentStatusName,'') ContentStatusName
	, ISNULL(ClassificationValueCondition.ClassificationName,'') ClassificationName
--	, ISNULL(ClassificationValueCondition.ClassificationValueName,'') ClassificationValueName
--	, ISNULL(UserCondition.UserName,'') UserName
, PageSectionConditions.PageSectionConditionDate
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Creator.PersonID CreatorId
	, PageSectionConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Modifier.PersonID ModifierId
	, PageSectionConditions.ModifiedDate
FROM PageSectionConditions 
LEFT JOIN (SELECT PageSectionConditionId, Name, Description, MenuName, MouseOver FROM PageSectionConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionConditionLanguage
	ON UserPageSectionConditionLanguage.PageSectionConditionId = PageSectionConditions.PageSectionConditionID
LEFT JOIN (SELECT PageSectionConditionId, Name, Description, MenuName, MouseOver FROM PageSectionConditionLanguages JOIN Settings ON PageSectionConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionConditionLanguage
	ON DefaultPageSectionConditionLanguage.PageSectionConditionId = PageSectionConditions.PageSectionConditionID
JOIN PageSectionConditionTypes
	ON PageSectionConditionTypes.PageSectionConditionTypeId = PageSectionConditions.PageSectionConditionTypeID
JOIN UITermLanguages UIPageSectionConditionTypeName
	ON UIPageSectionConditionTypeName.UITermId = PageSectionConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionConditionTypeNameCustom
	ON UIPageSectionConditionTypeNameCustom.UITermId = PageSectionConditionTypes.NameTermID

--ContentType
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID 
 	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this SectionCondition')) ContentTypeName
FROM PageSectionConditions 
JOIN ContentTypes 
	ON PageSectionConditions.PageSectionConditionInt =  ContentTypes.ContentTypeID 
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
WHERE PageSectionConditions.PageSectionConditionTypeId =5 ) ContentTypeCondition
	ON ContentTypeCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID

--USER Creator Modifier
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID, UserName 
FROM AspNetUsers 
JOIN PageSectionConditions
	ON AspNetUsers.Id = PageSectionConditions.PageSectionConditionString
WHERE PageSectionConditions.PageSectionConditionTypeId IN (1, 9,10)
) UserCondition
	ON UserCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID

--organization
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID 
 	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this SectionCondition')) OrganizationName
FROM PageSectionConditions 
JOIN Organizations 
	ON PageSectionConditions.PageSectionConditionInt =  Organizations.OrganizationID 
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationId = Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Organizations.OrganizationID
WHERE PageSectionConditions.PageSectionConditionTypeId =3) OrganizationCondition
	ON OrganizationCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID

--Project
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID 
 	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this SectionCondition')) ProjectName
FROM PageSectionConditions 
JOIN Projects 
	ON PageSectionConditions.PageSectionConditionInt =  Projects.ProjectID 
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectId = Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Projects.ProjectID
WHERE PageSectionConditions.PageSectionConditionTypeId =4) ProjectCondition
	ON ProjectCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID

--Securitylevel
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID 
 	, ISNULL(UINameCustom.Customization ,ISNULL(UIName.Name,'No name for this Security Level')) SecurityLevelName
FROM PageSectionConditions 
JOIN SecurityLevels
	ON PageSectionConditions.PageSectionConditionInt = SecurityLevels.SecurityLevelID
JOIN UITermLanguages UIName
	ON UIName.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = SecurityLevels.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionConditions.PageSectionConditionTypeId =8 ) SecurityLevelCondition
	ON SecurityLevelCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID 

--ContentStatus
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID 
 	, ISNULL(UINameCustom.Customization,ISNULL(UIName.Name,'No name for this Security Level')) ContentStatusName
FROM PageSectionConditions 
JOIN ContentStatuses
	ON PageSectionConditions.PageSectionConditionInt = ContentStatuses.ContentStatusID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ContentStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionConditions.PageSectionConditionTypeId =6) ContentStatusCondition
	ON ContentStatusCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID 


--Language
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID 
 	, ISNULL(UINameCustom.Customization,ISNULL(UIName.Name,'No name for this Security Level')) LanguageName
FROM PageSectionConditions 
JOIN Languages
	ON PageSectionConditions.PageSectionConditionInt = Languages.LanguageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Languages.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionConditions.PageSectionConditionTypeId =7) LanguageCondition
	ON LanguageCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID 


--ClassificationValue
LEFT JOIN (SELECT PageSectionConditions.PageSectionConditionID 
 	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this SectionCondition')) ClassificationValueName
 	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this SectionCondition')) ClassificationName
FROM PageSectionConditions 
JOIN ClassificationValues 
	ON PageSectionConditions.PageSectionConditionInt =  ClassificationValues.ClassificationValueID 
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID
WHERE PageSectionConditions.PageSectionConditionTypeId =11) ClassificationValueCondition
	ON ClassificationValueCondition.PageSectionConditionID = PageSectionConditions.PageSectionConditionID



JOIN Persons Creator
	ON Creator.UserId = PageSectionConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionConditions.ModifierID
WHERE PageSectionConditions.PageSectionConditionId = @PageSectionConditionId
	AND UIPageSectionConditionTypeName.LanguageId = @LanguageID



