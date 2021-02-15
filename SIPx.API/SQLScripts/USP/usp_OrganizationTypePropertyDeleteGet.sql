CREATE PROCEDURE usp_OrganizationTypePropertyDeleteGet (@UserId nvarchar(450),@ObjectTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'OrganizationTypeProperty', 'Delete',1,'',@ObjectTypePropertyId,@UserId

SELECT OrganizationTypeProperties.OrganizationTypePropertyID
	, OrganizationTypeProperties.OrganizationTypeID 
	, ISNULL(UserOrganizationTypeLanguage.Name,ISNULL(DefaultOrganizationTypeLanguage.Name,'No name for this Organization type')) OrganizationTypeName
	, OrganizationTypeProperties.PropertyID
	, ISNULL(UserPropertyLanguage.Name,ISNULL(DefaultPropertyLanguage.Name,'No name for this property')) PropertyName
	, OrganizationTypeProperties.ObjectTypePropertyStatusId
	, ISNULL(CustomStatus.Customization,DefaultStatus.Name) StatusName
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, OrganizationTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, OrganizationTypeProperties.ModifiedDate
FROM OrganizationTypeProperties 
JOIN OrganizationTypes 
	ON OrganizationTypeProperties.PropertyID = OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserOrganizationTypeLanguage
	ON UserOrganizationTypeLanguage.OrganizationTypeID= OrganizationTypes.OrganizationTypeID
LEFT JOIN (SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultOrganizationTypeLanguage
	ON DefaultOrganizationTypeLanguage.OrganizationTypeId = OrganizationTypes.OrganizationTypeID

JOIN Properties 
	ON OrganizationTypeProperties.PropertyID = Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages WHERE LanguageId = @LanguageID) UserPropertyLanguage
	ON UserPropertyLanguage.PropertyID= Properties.PropertyID
LEFT JOIN (SELECT PropertyId, Name FROM PropertyLanguages JOIN Settings ON PropertyLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPropertyLanguage
	ON DefaultPropertyLanguage.PropertyId = Properties.PropertyID


JOIN ObjectTypePropertyStatuses 
	ON ObjectTypePropertyStatuses.ObjectTypePropertyStatusId = OrganizationTypeProperties.ObjectTypePropertyStatusId
JOIN UITermLanguages DefaultStatus
	ON DefaultStatus.UITermId = ObjectTypePropertyStatuses.NameTermID
LEFT JOIN (SELECT UITermId, Customization FROM UITermLanguageCustomizations  WHERE LanguageId = @LanguageID) CustomStatus
	ON CustomStatus.UITermId = ObjectTypePropertyStatuses.NameTermID


JOIN Persons Creator
	ON Creator.UserId = OrganizationTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = OrganizationTypeProperties.ModifierID
WHERE OrganizationTypeProperties.OrganizationTypePropertyId = @ObjectTypePropertyID
AND DefaultStatus.LanguageId = @LanguageID
COMMIT TRANSACTION


