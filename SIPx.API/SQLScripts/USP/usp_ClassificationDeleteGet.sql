CREATE PROCEDURE [dbo].[usp_ClassificationDeleteGet] (@UserId nvarchar(450),@ClassificationId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Classifications.ClassificationID
	, ISNULL(CustomStatus.Customization,DefaultStatus.Name) StatusName
	, Classifications.HasDropDown
	, ISNULL(UserClassificationLanguage.Name,ISNULL(DefaultClassificationLanguage.Name,'No name for this classification')) Name
	, ISNULL(UserClassificationLanguage.Description,ISNULL(DefaultClassificationLanguage.Description,'No description for this classification')) Description
	, ISNULL(UserClassificationLanguage.MenuName,ISNULL(DefaultClassificationLanguage.MenuName,'No menu name for this classification')) MenuName
	, ISNULL(UserClassificationLanguage.MouseOver,ISNULL(DefaultClassificationLanguage.MouseOver,'No drop Mouse over for this classification')) MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Classifications.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Classifications.ModifiedDate
FROM Classifications
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage
	ON UserClassificationLanguage.ClassificationId = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage
	ON DefaultClassificationLanguage.ClassificationId = Classifications.ClassificationID
JOIN Statuses
	ON Statuses.StatusID = Classifications.StatusID
JOIN UITermLanguages DefaultStatus
	ON DefaultStatus.UITermId = Statuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomStatus
	ON CustomStatus.UITermId = Statuses.NameTermID

JOIN ClassificationLanguages 
	ON Classifications.ClassificationId = ClassificationLanguages.ClassificationID
JOIN Persons Creator
	ON Creator.UserId = Classifications.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Classifications.ModifierID
WHERE ClassificationLanguages.LanguageId = @LanguageID
	AND Classifications.ClassificationId = @ClassificationID
	AND DefaultStatus.LanguageId = @LanguageID
