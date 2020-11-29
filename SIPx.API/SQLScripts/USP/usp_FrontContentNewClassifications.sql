CREATE PROCEDURE usp_FrontContentNewClassifications ( @UserId nvarchar(450),@ContentTypeId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

SELECT 
	ContentTypeClassifications.ClassificationID
, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this content type')) ClassificationName
, 'ControlButton' + cast(ContentTypeClassifications.ClassificationID as varchar(5)) ControlButton
, 'ControlDialog' + cast(ContentTypeClassifications.ClassificationID  as varchar(5)) ControlDialog
, '#ControlButton' + cast(ContentTypeClassifications.ClassificationID  as varchar(5)) ControlTarget
, 'ControlOverlayClick' + cast(ContentTypeClassifications.ClassificationID as varchar(5)) ControlOverlayClick
FROM ContentTypeClassifications 
JOIN Classifications
	ON ContentTypeClassifications.ClassificationID = Classifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserLanguage
	ON UserLanguage.ClassificationID= ContentTypeClassifications.ClassificationID
LEFT JOIN (SELECT ClassificationId, Name, Description, MenuName, MouseOver, ClassificationLanguageID FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage
	ON DefaultLanguage.ClassificationId = ContentTypeClassifications.ClassificationID
	
WHERE ContentTypeClassifications.ContentTypeClassificationStatusID IN (2,3)
	AND ContentTypeID = @ContentTypeId
ORDER BY Classifications.DropDownSequence