CREATE PROCEDURE usp_PropertyUpdateGet (@UserId nvarchar(450),@PropertyId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Properties.PropertyID
	, Properties.PropertyTypeID 
	, PropertyLanguages.Name
	, PropertyLanguages.Description
	, PropertyLanguages.MenuName
	, PropertyLanguages.MouseOver
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Properties.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Properties.ModifiedDate
FROM Properties 
JOIN PropertyLanguages 
	ON Properties.PropertyId = PropertyLanguages.PropertyID
JOIN Persons Creator
	ON Creator.UserId = Properties.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Properties.ModifierID
WHERE PropertyLanguages.LanguageId = @LanguageID
	AND Properties.PropertyId = @PropertyID
