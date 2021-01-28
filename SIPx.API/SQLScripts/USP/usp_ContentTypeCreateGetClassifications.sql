CREATE PROCEDURE usp_ContentTypeCreateGetClassifications (@UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
SELECT Classifications.ClassificationId
	, 1 ObjectTypeClassificationStatusId
	, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name
	, ISNULL(UserLanguage.MouseOver,ISNULL(DefaultLanguage.MouseOver,'No mouse over for this classification')) MouseOver
	, concat( 'ControlA' , Classifications.ClassificationID) ControlA
	, concat( 'ControlB' , Classifications.ClassificationID) ControlB
	, concat( 'ControlC' , Classifications.ClassificationID) ControlC
FROM Classifications 
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = Classifications.ClassificationID
ORDER BY ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this Classification')) 
