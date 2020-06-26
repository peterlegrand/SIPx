CREATE PROCEDURE [dbo].[usp_ClassificationValue] (@UserID nvarchar(450), @ClassificationValueID int) 
AS 
DECLARE @LanguageID int;
SELECT @LanguageID = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeID = 1 ;
SELECT ClassificationValues.ClassificationValueID
	, ClassificationValues.ClassificationID
	, ISNULL(UserClassificationValueLanguage.Name,ISNULL(DefaultClassificationValueLanguage.Name,'No name for this value')) Name
	, ISNULL(UserClassificationValueLanguage.Description,ISNULL(DefaultClassificationValueLanguage.Description,'No description for this value')) Description
	, ISNULL(UserClassificationValueLanguage.MenuName,ISNULL(DefaultClassificationValueLanguage.MenuName,'No menu name for this value')) MenuName
	, ISNULL(UserClassificationValueLanguage.DropDownName,ISNULL(DefaultClassificationValueLanguage.DropDownName,'No drop downName for this value')) DropDownName
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
	, Creator.FirstName + ' ' + Creator.LastName Creator
	, ClassificationValues.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, ClassificationValues.ModifiedDate
FROM ClassificationValues 
LEFT JOIN (SELECT ClassificationValueID, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages WHERE LanguageID = @LanguageID) UserClassificationValueLanguage
	ON UserClassificationValueLanguage.ClassificationValueID = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueID, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultClassificationValueLanguage
	ON DefaultClassificationValueLanguage.ClassificationValueID = ClassificationValues.ClassificationValueID
LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages WHERE LanguageID = @LanguageID) UserParentLanguage
	ON UserParentLanguage.ClassificationValueID = ClassificationValues.ParentValueID
LEFT JOIN (SELECT ClassificationValueID, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultParentLanguage
	ON DefaultParentLanguage.ClassificationValueID = ClassificationValues.ParentValueID
JOIN Persons Creator
	ON Creator.UserID = ClassificationValues.CreatorID
JOIN Persons Modifier
	ON Modifier.UserID = ClassificationValues.ModifierID
WHERE ClassificationValues.ClassificationValueID = @ClassificationValueID
