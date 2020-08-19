CREATE PROCEDURE [dbo].[usp_ClassificationUpdatePost] (
	@ClassificationId int
	, @StatusId int
	, @DefaultPageId int
	, @HasDropDown bit
	, @DropDownSequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @Color char(9) 
	, @IconId int 
	, @UserId nvarchar(450)) 
AS 
DECLARE @LanguageId int;
SELECT @LanguageId = IntPreference
FROM UserPreferences
WHERE USerId = @UserID
	AND UserPreferences.PreferenceTypeId = 1 ;

DECLARE @OldSequence int;
SELECT @OldSequence = DropDownSequence FROM Classifications  WHERE ClassificationID= @ClassificationID;
BEGIN TRANSACTION
IF @OldSequence > @DropDownSequence
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence + 1 WHERE DropDownSequence < @DropDownSequence AND DropDownSequence >= @OldSequence
END
ELSE
BEGIN
UPDATE Classifications SET DropDownSequence = DropDownSequence - 1 WHERE DropDownSequence <= @DropDownSequence AND DropDownSequence > @OldSequence
END

UPDATE Classifications SET 
	StatusId = @StatusID
	, DefaultPageId = @DefaultPageID
	, HasDropDown = @HasDropDown
	, DropDownSequence = @DropDownSequence
	, Color = @Color
	, IconId = @IconId
	, ModifierId = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationId = @ClassificationID

UPDATE  ClassificationLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierId = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationId = @ClassificationID
	AND LanguageID = @LanguageID

COMMIT TRANSACTION


