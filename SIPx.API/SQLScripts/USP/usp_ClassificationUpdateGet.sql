CREATE PROCEDURE usp_ClassificationUpdateGet (@UserId nvarchar(450),@ClassificationId int)
AS
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;
	SET XACT_ABORT ON;
BEGIN TRANSACTION
exec usp_readlogWrite 'Classification', 'Edit',1,'',@ClassificationId,@UserId

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


