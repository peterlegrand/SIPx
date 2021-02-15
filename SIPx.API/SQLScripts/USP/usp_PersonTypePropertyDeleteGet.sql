CREATE PROCEDURE usp_PersonTypePropertyDeleteGet (@UserId nvarchar(450),@ObjectTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'PersonTypeProperty', 'Delete',1,'',@ObjectTypePropertyId,@UserId

SELECT PersonTypeProperties.PersonTypePropertyID ObjectTypePropertyID
	, PersonTypeProperties.PersonTypeID  ObjectTypeID
	, ISNULL(UserPersonTypeLanguage.Name,ISNULL(DefaultPersonTypeLanguage.Name,'No name for this Person type')) ObjectTypeName 
	, PersonTypeProperties.PropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, PersonTypeProperties.ObjectTypePropertyStatusId
	, ISNULL(CustomStatus.Customization,DefaultStatus.Name) ObjectTypePropertyStatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonTypeProperties.ModifiedDate
FROM PersonTypeProperties 
JOIN PersonTypes 
	ON PersonTypeProperties.PropertyID = PersonTypes.PersonTypeID
LEFT JOIN (SELECT PersonTypeId, Name FROM PersonTypeLanguages WHERE LanguageId = @LanguageID) UserPersonTypeLanguage
	ON UserPersonTypeLanguage.PersonTypeID= PersonTypes.PersonTypeID
LEFT JOIN (SELECT PersonTypeId, Name FROM PersonTypeLanguages JOIN Settings ON PersonTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPersonTypeLanguage
	ON DefaultPersonTypeLanguage.PersonTypeId = PersonTypes.PersonTypeID

JOIN Properties 
	ON PersonTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID


JOIN ObjectTypePropertyStatuses 
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusId = PersonTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages DefaultStatus
	ON DefaultStatus.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomStatus
	ON CustomStatus.UITermId = ObjectTypePropertyStatuses.NameTermID


JOIN Persons Creator
	ON Creator.UserId = PersonTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTypeProperties.ModifierID
WHERE PersonTypeProperties.PersonTypePropertyId = @ObjectTypePropertyID
AND DefaultStatus.LanguageId = @LanguageID
COMMIT TRANSACTION


