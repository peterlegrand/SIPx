CREATE PROCEDURE [dbo].[usp_TelecomTypeIndexGet] (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT 
	TelecomTypes.TelecomTypeID
	, ISNULL( UserLanguageName.Customization, LanguageName.Name) Name
	, ISNULL( UserLanguageDescription.Customization, LanguageDescription.Name) Description
	, ISNULL( UserLanguageMenuName.Customization, LanguageMenuName.Name) MenuName
	, ISNULL( UserLanguageMouseOver.Customization, LanguageMouseOver.Name) MouseOver
	, Active
	, Modifier.FirstName + ' ' + Modifier.LastName Modifier
	, TelecomTypes.ModifiedDate
FROM TelecomTypes 
JOIN UITermLanguages LanguageName
	ON TelecomTypes.NameTermId = LanguageName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageName
	ON TelecomTypes.NameTermId = UserLanguageName.UITermId  
JOIN UITermLanguages LanguageDescription
	ON TelecomTypes.NameTermId = LanguageDescription.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageDescription
	ON TelecomTypes.NameTermId = UserLanguageDescription.UITermId  
JOIN UITermLanguages LanguageMenuName
	ON TelecomTypes.NameTermId = LanguageMenuName.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageMenuName
	ON TelecomTypes.NameTermId = UserLanguageMenuName.UITermId  
JOIN UITermLanguages LanguageMouseOver
	ON TelecomTypes.NameTermId = LanguageMouseOver.UITermId  
LEFT JOIN (SELECT * FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserLanguageMouseOver
	ON TelecomTypes.NameTermId = UserLanguageMouseOver.UITermId  
JOIN Persons Modifier
	ON Modifier.UserId = TelecomTypes.ModifierID
WHERE LanguageName.LanguageId =@LanguageId 
	AND LanguageDescription.LanguageId =@LanguageId 	
	AND LanguageMenuName.LanguageId =@LanguageId 	
	AND LanguageMouseOver.LanguageId =@LanguageId 	
ORDER BY  	ISNULL( UserLanguageName.Customization, LanguageName.Name) 
