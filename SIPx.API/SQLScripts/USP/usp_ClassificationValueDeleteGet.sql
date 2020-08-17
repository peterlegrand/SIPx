CREATE PROCEDURE [dbo].[usp_ClassificationValueDeleteGet] (@UserId nvarchar(450), @ClassificationValueId int) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT ClassificationValues.ClassificationValueID
	, ClassificationValues.ClassificationID
	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this value')) Name
	, ISNULL(UserClassificationValueLanguage.Description,ISNULL(DefaultClassificationValueLanguage.Description,'No description for this value')) Description
	, ISNULL(UserClassificationValueLanguage.MenuName,ISNULL(DefaultClassificationValueLanguage.MenuName,'No menu name for this value')) MenuName
	, ISNULL(UserClassificationValueLanguage.MouseOver,ISNULL(DefaultClassificationValueLanguage.MouseOver,'No drop Mouse over for this value')) MouseOver
	, ISNULL(UserClassificationValueLanguage.DropDownName,ISNULL(DefaultClassificationValueLanguage.DropDownName,'No drop down name for this value')) DropDownName
	, ISNULL(UserClassificationValueLanguage.PageName,ISNULL(DefaultClassificationValueLanguage.PageName,'No page name for this value')) PageName
	, ISNULL(UserClassificationValueLanguage.PageDescription,ISNULL(DefaultClassificationValueLanguage.PageDescription,'No page description for this value')) PageDescription
	, ISNULL(UserClassificationValueLanguage.HeaderName,ISNULL(DefaultClassificationValueLanguage.HeaderName,'No header name for this value')) HeaderName
	, ISNULL(UserClassificationValueLanguage.HeaderDescription,ISNULL(DefaultClassificationValueLanguage.HeaderDescription,'No header description for this value')) HeaderDescription
	, ISNULL(UserClassificationValueLanguage.TopicName,ISNULL(DefaultClassificationValueLanguage.TopicName,'No topic name for this value')) TopicName
	, ClassificationValues.ParentValueID
	, ISNULL(UserParentLanguage.Name,ISNULL(DefaultParentLanguage.Name,'No parent name for this value')) ParentName
	, ClassificationValues.DateFrom
	, ClassificationValues.DateTo
--	, Location
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, ClassificationValues.CreatorID
	, ClassificationValues.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, ClassificationValues.ModifierID
	, ClassificationValues.ModifiedDate
FROM ClassificationValues 
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserParentLanguage
	ON UserParentLanguage.ClassificationValueId = ClassificationValues.ParentValueID
LEFT JOIN (SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultParentLanguage
	ON DefaultParentLanguage.ClassificationValueId = ClassificationValues.ParentValueID
JOIN Persons Creator
	ON Creator.UserId = ClassificationValues.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = ClassificationValues.ModifierID
WHERE ClassificationValues.ClassificationValueId = @ClassificationValueID
