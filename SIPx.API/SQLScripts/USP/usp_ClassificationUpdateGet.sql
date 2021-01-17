CREATE PROCEDURE usp_ClassificationUpdateGet (@UserId nvarchar(450),@ClassificationId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @ScreenId int;
SELECT @ScreenId = MVCUIScreenID FROM MVCUIScreens WHERE Controller = 'Classification' AND Action = 'Create';

SET XACT_ABORT ON;
BEGIN TRANSACTION

INSERT INTO ChangeLogClassificationCUD (RecordId , UserId, ChangeLogDate, MVCUIScreenID)  VALUES( @ClassificationId, @UserId, Getdate(), @ScreenId)

SELECT Classifications.ClassificationID
	, Classifications.StatusId 
	, Classifications.DefaultPageID
	, Classifications.HasDropDown
	, Classifications.DropDownSequence
	, ClassificationLanguages.ClassificationLanguageID
	, ClassificationLanguages.Name
	, ClassificationLanguages.Description
	, ClassificationLanguages.MenuName
	, ClassificationLanguages.MouseOver
	, Classifications.Color
	, Classifications.IconID
	, Creator.FirstName + ' ' + Creator.LastName CreatorName
	, Creator.PersonID CreatorID
	, Classifications.CreatedDate
	, Modifier.FirstName + ' ' + Modifier.LastName ModifierName
	, Modifier.PersonID ModifierID
	, Classifications.ModifiedDate
FROM Classifications 
JOIN ClassificationLanguages 
	ON Classifications.ClassificationId = ClassificationLanguages.ClassificationID
JOIN Persons Creator
	ON Creator.UserId = Classifications.CreatorID
JOIN Persons Modifier
	ON Modifier.UserId = Classifications.ModifierID
WHERE ClassificationLanguages.LanguageId = @LanguageID
	AND Classifications.ClassificationId = @ClassificationID

	COMMIT TRANSACTION


