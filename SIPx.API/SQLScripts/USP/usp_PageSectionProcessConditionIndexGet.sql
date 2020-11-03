CREATE PROCEDURE usp_PageSectionProcessConditionIndexGet (@UserId nvarchar(450), @PageSectionId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT PageSectionProcessConditions.PageSectionProcessConditionID
	, PageSectionProcessConditions.PageID
	, PageSectionProcessConditions.PageSectionID
	, ISNULL(UserPageSectionProcessConditionLanguage.Name,ISNULL(DefaultPageSectionProcessConditionLanguage.Name,'No name for this SectionProcessCondition')) Name
	, ISNULL(UserPageSectionProcessConditionLanguage.Description,ISNULL(DefaultPageSectionProcessConditionLanguage.Description,'No description for this SectionProcessCondition')) Description
	, ISNULL(UserPageSectionProcessConditionLanguage.MenuName,ISNULL(DefaultPageSectionProcessConditionLanguage.MenuName,'No menu name for this SectionProcessCondition')) MenuName
	, ISNULL(UserPageSectionProcessConditionLanguage.MouseOver,ISNULL(DefaultPageSectionProcessConditionLanguage.MouseOver,'No mouse over for this SectionProcessCondition')) MouseOver
	, ISNULL(UIPageSectionProcessConditionTypeNameCustom.Customization,UIPageSectionProcessConditionTypeName.Name) PageSectionProcessConditionTypeName
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, Creator.PersonID CreatorId
	, PageSectionProcessConditions.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, Modifier.PersonID ModifierId
	, PageSectionProcessConditions.ModifiedDate
FROM PageSectionProcessConditions 
LEFT JOIN (SELECT PageSectionProcessConditionId, Name, Description, MenuName, MouseOver FROM PageSectionProcessConditionLanguages WHERE LanguageId = @LanguageID) UserPageSectionProcessConditionLanguage
	ON UserPageSectionProcessConditionLanguage.PageSectionProcessConditionId = PageSectionProcessConditions.PageSectionProcessConditionID
LEFT JOIN (SELECT PageSectionProcessConditionId, Name, Description, MenuName, MouseOver FROM PageSectionProcessConditionLanguages JOIN Settings ON PageSectionProcessConditionLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPageSectionProcessConditionLanguage
	ON DefaultPageSectionProcessConditionLanguage.PageSectionProcessConditionId = PageSectionProcessConditions.PageSectionProcessConditionID
JOIN PageSectionProcessConditionTypes
	ON PageSectionProcessConditionTypes.PageSectionProcessConditionTypeId = PageSectionProcessConditions.PageSectionProcessConditionTypeID
JOIN UITermLanguages UIPageSectionProcessConditionTypeName
	ON UIPageSectionProcessConditionTypeName.UITermId = PageSectionProcessConditionTypes.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UIPageSectionProcessConditionTypeNameCustom
	ON UIPageSectionProcessConditionTypeNameCustom.UITermId = PageSectionProcessConditionTypes.NameTermID

--ProcessType
--LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID 
-- 	, ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this SectionProcessCondition')) ProcessTypeName
--FROM PageSectionProcessConditions 
--JOIN ProcessTypes 
--	ON PageSectionProcessConditions.PageSectionProcessConditionInt =  ProcessTypes.ProcessTypeID 
--LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeLanguage
--	ON UserProcessTypeLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID
--LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeLanguage
--	ON DefaultProcessTypeLanguage.ProcessTypeId = ProcessTypes.ProcessTypeID
--WHERE PageSectionProcessConditions.PageSectionProcessConditionTypeId =5 ) ProcessTypeCondition
--	ON ProcessTypeCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID

--USER Creator Modifier
LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID, UserName 
FROM AspNetUsers 
JOIN PageSectionProcessConditions
	ON AspNetUsers.Id = PageSectionProcessConditions.PageSectionProcessConditionString
WHERE PageSectionProcessConditions.PageSectionProcessConditionTypeId IN (1, 9,10)
) UserCondition
	ON UserCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID

--organization
--LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID 
-- 	, ISNULL(UserOrganizationLanguage.Name,ISNULL(DefaultOrganizationLanguage.Name,'No name for this SectionProcessCondition')) OrganizationName
--FROM PageSectionProcessConditions 
--JOIN Organizations 
--	ON PageSectionProcessConditions.PageSectionProcessConditionInt =  Organizations.OrganizationID 
--LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserOrganizationLanguage
--	ON UserOrganizationLanguage.OrganizationId = Organizations.OrganizationID
--LEFT JOIN (SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationLanguage
--	ON DefaultOrganizationLanguage.OrganizationId = Organizations.OrganizationID
--WHERE PageSectionProcessConditions.PageSectionProcessConditionTypeId =3) OrganizationCondition
--	ON OrganizationCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID

----Project
--LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID 
-- 	, ISNULL(UserProjectLanguage.Name,ISNULL(DefaultProjectLanguage.Name,'No name for this SectionProcessCondition')) ProjectName
--FROM PageSectionProcessConditions 
--JOIN Projects 
--	ON PageSectionProcessConditions.PageSectionProcessConditionInt =  Projects.ProjectID 
--LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserProjectLanguage
--	ON UserProjectLanguage.ProjectId = Projects.ProjectID
--LEFT JOIN (SELECT ProjectId, Name FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProjectLanguage
--	ON DefaultProjectLanguage.ProjectId = Projects.ProjectID
--WHERE PageSectionProcessConditions.PageSectionProcessConditionTypeId =4) ProjectCondition
--	ON ProjectCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID

----Securitylevel
--LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID 
-- 	, ISNULL(UINameCustom.Customization ,ISNULL(UIName.Name,'No name for this Security Level')) SecurityLevelName
--FROM PageSectionProcessConditions 
--JOIN SecurityLevels
--	ON PageSectionProcessConditions.PageSectionProcessConditionInt = SecurityLevels.SecurityLevelID
--JOIN UITermLanguages UIName
--	ON UIName.UITermId = SecurityLevels.NameTermID
--LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
--	ON UINameCustom.UITermId = SecurityLevels.NameTermID
--WHERE UIName.LanguageId = @LanguageID AND PageSectionProcessConditions.PageSectionProcessConditionTypeId =8 ) SecurityLevelCondition
--	ON SecurityLevelCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID 

----ProcessStatus
--LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID 
-- 	, ISNULL(UINameCustom.Customization,ISNULL(UIName.Name,'No name for this Security Level')) ProcessStatusName
--FROM PageSectionProcessConditions 
--JOIN ProcessStatuses
--	ON PageSectionProcessConditions.PageSectionProcessConditionInt = ProcessStatuses.ProcessStatusID
--JOIN UITermLanguages UIName
--	ON UIName.UITermId = ProcessStatuses.NameTermID
--LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
--	ON UINameCustom.UITermId = ProcessStatuses.NameTermID
--WHERE UIName.LanguageId = @LanguageID AND PageSectionProcessConditions.PageSectionProcessConditionTypeId =6) ProcessStatusCondition
--	ON ProcessStatusCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID 


----Language
--LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID 
-- 	, ISNULL(UINameCustom.Customization,ISNULL(UIName.Name,'No name for this Security Level')) LanguageName
--FROM PageSectionProcessConditions 
--JOIN Languages
--	ON PageSectionProcessConditions.PageSectionProcessConditionInt = Languages.LanguageID
--JOIN UITermLanguages UIName
--	ON UIName.UITermId = Languages.NameTermID
--LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) UINameCustom
--	ON UINameCustom.UITermId = Languages.NameTermID
--WHERE UIName.LanguageId = @LanguageID AND PageSectionProcessConditions.PageSectionProcessConditionTypeId =7) LanguageCondition
--	ON LanguageCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID 


----ClassificationValue
--LEFT JOIN (SELECT PageSectionProcessConditions.PageSectionProcessConditionID 
-- 	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this SectionProcessCondition')) ClassificationValueName
-- 	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this SectionProcessCondition')) ClassificationName
--FROM PageSectionProcessConditions 
--JOIN ClassificationValues 
--	ON PageSectionProcessConditions.PageSectionProcessConditionInt =  ClassificationValues.ClassificationValueID 
--LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
--	ON UserClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
--LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
--	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
--LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
--	ON UserClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID
--LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
--	ON DefaultClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID
--WHERE PageSectionProcessConditions.PageSectionProcessConditionTypeId =11) ClassificationValueCondition
--	ON ClassificationValueCondition.PageSectionProcessConditionID = PageSectionProcessConditions.PageSectionProcessConditionID



JOIN Persons Creator
	ON Creator.UserId = PageSectionProcessConditions.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PageSectionProcessConditions.ModifierID
WHERE PageSectionProcessConditions.PageSectionId = @PageSectionId
	AND UIPageSectionProcessConditionTypeName.LanguageId = @LanguageID

ORDER BY ISNULL(UserPageSectionProcessConditionLanguage.Name,ISNULL(DefaultPageSectionProcessConditionLanguage.Name,'No name for this SectionProcessCondition'))


