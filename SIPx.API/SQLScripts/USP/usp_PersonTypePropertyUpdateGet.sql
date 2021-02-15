CREATE PROCEDURE usp_PersonTypePropertyUpdateGet (@UserId nvarchar(450),@ObjectTypePropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'PersonTypeProperty', 'Edit',1,'',@ObjectTypePropertyId,@UserId

SELECT PersonTypeProperties.PersonTypePropertyID ObjectTypePropertyID
	, PersonTypeProperties.PersonTypeID ObjectTypeId
	, ISNULL(UserPersonTypeLanguage.Name,ISNULL(DefaultPersonTypeLanguage.Name,'No name for this Person type')) ObjectTypeName
	, PersonTypeProperties.PropertyID
	, PersonTypeProperties.ObjectTypePropertyStatusId
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, PersonTypeProperties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, PersonTypeProperties.ModifiedDate
FROM PersonTypeProperties 
JOIN PersonTypes 
	ON PersonTypeProperties.PersonTypeID = PersonTypes.PersonTypeID
LEFT JOIN (SELECT PersonTypeId, Name FROM PersonTypeLanguages WHERE LanguageId = @LanguageID) UserPersonTypeLanguage
	ON UserPersonTypeLanguage.PersonTypeID= PersonTypes.PersonTypeID
LEFT JOIN (SELECT PersonTypeId, Name FROM PersonTypeLanguages JOIN Settings ON PersonTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultPersonTypeLanguage
	ON DefaultPersonTypeLanguage.PersonTypeId = PersonTypes.PersonTypeID

JOIN Persons Creator
	ON Creator.UserId = PersonTypeProperties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = PersonTypeProperties.ModifierID
WHERE PersonTypeProperties.PersonTypePropertyId = @ObjectTypePropertyId

COMMIT TRANSACTION


