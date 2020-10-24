CREATE PROCEDURE usp_PageSectionContentConditionIndexGet (@UserId nvarchar(450), @PageSectionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionContentConditions.PageSectionContentConditionID
	, ISNULL(UserPageSectionContentConditionLanguage.Name,ISNULL(DefaultPageSectionContentConditionLanguage.Name,'No name for this SectionContentCondition')) Name
	, ISNULL(UserPageSectionContentConditionLanguage.Description,ISNULL(DefaultPageSectionContentConditionLanguage.Description,'No description for this SectionContentCondition')) Description
	, ISNULL(UserPageSectionContentConditionLanguage.MenuName,ISNULL(DefaultPageSectionContentConditionLanguage.MenuName,'No menu name for this SectionContentCondition')) MenuName
	, ISNULL(UserPageSectionContentConditionLanguage.MouseOver,ISNULL(DefaultPageSectionContentConditionLanguage.MouseOver,'No mouse over for this SectionContentCondition')) MouseOver
	, ISNULL(UIPageSectionContentConditionTypeNameCustom.Customization,UIPageSectionContentConditionTypeName.Name) PageSectionContentConditionTypeName
	, ISNULL(ContentTypeName, IsNull(SecurityLevelName,isnull(OrganizationName, isnull(ProjectName,isnull(LanguageName, isnull(ContentStatusName, isnull(ClassificationValueName, Isnull(username,'')))))))) PageSectionContentConditionName
	--, ISNULL(ContentTypeCondition.ContentTypeName, '') ContentTypeName
	--, ISNULL(SecurityLevelCondition.SecurityLevelName,'') SecurityLevelName
	--, ISNULL(OrganizationCondition.OrganizationName,'') OrganizationName
	--, ISNULL(ProjectCondition.ProjectName,'') ProjectName
	--, ISNULL(LanguageCondition.LanguageName,'') LanguageName
	--, ISNULL(ContentStatusCondition.ContentStatusName,'') ContentStatusName
	, ISNULL(ClassificationValueCondition.ClassificationName,'') ClassificationName
--	, ISNULL(ClassificationValueCondition.ClassificationValueName,'') ClassificationValueName
--	, ISNULL(UserCondition.UserName,'') UserName
, PageSectionContentConditions.PageSectionContentConditionDate
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Creator.PersonID CreatorId
	, PageSectionContentConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Modifier.PersonID ModifierId
	, PageSectionContentConditions.ModifiedDate
FROM PageSectionContentConditions 
LEFT JOIN (SELECT PageSectionContentConditionId, Name, Description, MenuName, MouseOver FROM PageSectionContentConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionContentConditionLanguage
	ON UserPageSectionContentConditionLanguage.PageSectionContentConditionId = PageSectionContentConditions.PageSectionContentConditionID
LEFT JOIN (SELECT PageSectionContentConditionId, Name, Description, MenuName, MouseOver FROM PageSectionContentConditionLanguages JOIN Settings ON PageSectionContentConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionContentConditionLanguage
	ON DefaultPageSectionContentConditionLanguage.PageSectionContentConditionId = PageSectionContentConditions.PageSectionContentConditionID
JOIN PageSectionContentConditionTypes
	ON PageSectionContentConditionTypes.PageSectionContentConditionTypeId = PageSectionContentConditions.PageSectionContentConditionTypeID
JOIN UITermLanguages UIPageSectionContentConditionTypeName
	ON UIPageSectionContentConditionTypeName.UITermId = PageSectionContentConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionContentConditionTypeNameCustom
	ON UIPageSectionContentConditionTypeNameCustom.UITermId = PageSectionContentConditionTypes.NameTermID

--ContentType
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID 
 	, ISNULL(UserContentTypeLanguage.Name,ISNULL(DefaultContentTypeLanguage.Name,'No name for this SectionContentCondition')) ContentTypeName
FROM PageSectionContentConditions 
JOIN ContentTypes 
	ON PageSectionContentConditions.PageSectionContentConditionInt =  ContentTypes.ContentTypeID 
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserContentTypeLanguage
	ON UserContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
LEFT JOIN (SELECT ContentTypeId, Name FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultContentTypeLanguage
	ON DefaultContentTypeLanguage.ContentTypeId = ContentTypes.ContentTypeID
WHERE PageSectionContentConditions.PageSectionContentConditionTypeId =5 ) ContentTypeCondition
	ON ContentTypeCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID

--USER Creator Modifier
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID, UserName 
FROM AspNetUsers 
JOIN PageSectionContentConditions
	ON AspNetUsers.Id = PageSectionContentConditions.PageSectionContentConditionString
WHERE PageSectionContentConditions.PageSectionContentConditionTypeId IN (1, 9,10)
) UserCondition
	ON UserCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID

--organization
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID 
 	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this SectionContentCondition')) OrganizationName
FROM PageSectionContentConditions 
JOIN Organizations 
	ON PageSectionContentConditions.PageSectionContentConditionInt =  Organizations.OrganizationID 
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
	ON UserOrganizationLanguage.OrganizationId = Organizations.OrganizationID
LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
	ON DefaultOrganizationLanguage.OrganizationId = Organizations.OrganizationID
WHERE PageSectionContentConditions.PageSectionContentConditionTypeId =3) OrganizationCondition
	ON OrganizationCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID

--Project
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID 
 	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this SectionContentCondition')) ProjectName
FROM PageSectionContentConditions 
JOIN Projects 
	ON PageSectionContentConditions.PageSectionContentConditionInt =  Projects.ProjectID 
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
	ON UserProjectLanguage.ProjectId = Projects.ProjectID
LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
	ON DefaultProjectLanguage.ProjectId = Projects.ProjectID
WHERE PageSectionContentConditions.PageSectionContentConditionTypeId =4) ProjectCondition
	ON ProjectCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID

--Securitylevel
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID 
 	, ISNULL(UINameCustom.Customization ,ISNULL(UIName.Name,'No name for this Security Level')) SecurityLevelName
FROM PageSectionContentConditions 
JOIN SecurityLevels
	ON PageSectionContentConditions.PageSectionContentConditionInt = SecurityLevels.SecurityLevelID
JOIN UITermLanguages UIName
	ON UIName.UITermId = SecurityLevels.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = SecurityLevels.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionContentConditions.PageSectionContentConditionTypeId =8 ) SecurityLevelCondition
	ON SecurityLevelCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID 

--ContentStatus
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID 
 	, ISNULL(UINameCustom.Customization,ISNULL(UIName.Name,'No name for this Security Level')) ContentStatusName
FROM PageSectionContentConditions 
JOIN ContentStatuses
	ON PageSectionContentConditions.PageSectionContentConditionInt = ContentStatuses.ContentStatusID
JOIN UITermLanguages UIName
	ON UIName.UITermId = ContentStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = ContentStatuses.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionContentConditions.PageSectionContentConditionTypeId =6) ContentStatusCondition
	ON ContentStatusCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID 


--Language
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID 
 	, ISNULL(UINameCustom.Customization,ISNULL(UIName.Name,'No name for this Security Level')) LanguageName
FROM PageSectionContentConditions 
JOIN Languages
	ON PageSectionContentConditions.PageSectionContentConditionInt = Languages.LanguageID
JOIN UITermLanguages UIName
	ON UIName.UITermId = Languages.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
	ON UINameCustom.UITermId = Languages.NameTermID
WHERE UIName.LanguageId = @LanguageID AND PageSectionContentConditions.PageSectionContentConditionTypeId =7) LanguageCondition
	ON LanguageCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID 


--ClassificationValue
LEFT JOIN (SELECT PageSectionContentConditions.PageSectionContentConditionID 
 	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this SectionContentCondition')) ClassificationValueName
 	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this SectionContentCondition')) ClassificationName
FROM PageSectionContentConditions 
JOIN ClassificationValues 
	ON PageSectionContentConditions.PageSectionContentConditionInt =  ClassificationValues.ClassificationValueID 
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID
WHERE PageSectionContentConditions.PageSectionContentConditionTypeId =11) ClassificationValueCondition
	ON ClassificationValueCondition.PageSectionContentConditionID = PageSectionContentConditions.PageSectionContentConditionID



JOIN Persons Creator
	ON Creator.UserId = PageSectionContentConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionContentConditions.ModifierID
WHERE PageSectionContentConditions.PageSectionId = @PageSectionId
	AND UIPageSectionContentConditionTypeName.LanguageId = @LanguageID

ORDER BY ISNULL(UserPageSectionContentConditionLanguage.Name,ISNULL(DefaultPageSectionContentConditionLanguage.Name,'No name for this SectionContentCondition'))


