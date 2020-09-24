CREATE PROCEDURE usp_ClassificationsWithValues (@UserId nvarchar(450))
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
	Classifications.ClassificationId 
		, 'NumberId' +  trim(cast(Classifications.ClassificationId as varchar(5))) NumberId
		, 'DropDownId' +  trim(cast(Classifications.ClassificationId as varchar(5))) DropDownId
		, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name

FROM Classifications 
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = Classifications.ClassificationID

WHERE Classifications.ClassificationID IN (SELECT ClassificationID FROM ClassificationValues) 
	AND StatusID = 1
ORDER BY  ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) 
