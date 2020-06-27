CREATE PROCEDURE [dbo].[usp_ClassificationUpdate] (
	@ClassificationLanguageID int
	, @ClassificationID int
	, @StatusID int
	, @DefaultPageID int
	, @HasDropDown bit
	, @DropDownSequence int
	, @Name nvarchar(50)
	, @Description nvarchar(max)
	, @MenuName nvarchar(50)
	, @MouseOver nvarchar(50)
	, @UserID nvarchar(450)) 
AS 
DECLARE @OldSequence int;
SELECT @OldSequence = DropDownSequence FROM Classifications WHERE ClassificationID = @ClassificationID;
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
	StatusID = @StatusID
	, DefaultPageID = @DefaultPageID
	, HasDropDown = @HasDropDown
	, DropDownSequence = @DropDownSequence
	, ModifierID = @UserID
	, ModifiedDate = GETDATE()
WHERE ClassificationID = @ClassificationID

UPDATE  ClassificationLanguages SET 
	Name = @Name
	, Description = @Description
	, MenuName = @MenuName
	, MouseOver = @MouseOver
	, ModifierID = @UserID
	, ModifiedDate = getdate()
WHERE ClassificationLanguageID= @ClassificationLanguageID

COMMIT TRANSACTION


